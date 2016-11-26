package org.xiaojl.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.commons.utils.BeanUtils;
import org.xiaojl.core.dao.RoleDao;
import org.xiaojl.core.dao.UserDao;
import org.xiaojl.core.dao.UserRoleDao;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.UserRole;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.vo.UserVO;

import com.baomidou.mybatisplus.plugins.Page;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserRoleDao userRoleDao;

	public User selectUserByloginNameAndPassword(String username, String password) {
		return userDao.selectUserByloginNameAndPassword(username,password);
	}

	public List<Role> selectRolesByUserId(Long id) {
		return roleDao.selectRolesByUserId(id);
	}

	public void selectDataGrid(PageInfo pi) {
		Page<User> page = new Page<User>(pi.getNowpage(), pi.getSize());
		List<User> lists = userDao.selectUserVoPage(page, pi.getCondition());
		pi.setRows(lists);
		pi.setTotal(page.getTotal());
	}

	public User selectUserById(Long id) {
		return userDao.selectById(id);
	}

	public UserVO selectUserVoById(Long id) {
		return userDao.selectUserVoById(id);
	}

	public User selectUserByLoginName(String loginName) {
		return userDao.selectUserByLoginName(loginName);
	}

	public void updateByVO(UserVO userVo) {
		//1 修改用户表
		User user = BeanUtils.copy(userVo, User.class);
		userDao.updateSelectiveById(user);
		
		//2 获取用户角色信息，并删除
		List<UserRole> userRoles = userRoleDao.selectByUserId(userVo.getId());
		for(int i=0;userRoles!=null && i<userRoles.size();i++){
			UserRole ur = userRoles.get(i);
			userRoleDao.deleteById(ur.getId());
		}
		
		//3 添加用户角色信息
		String[] roleIds = userVo.getRoleIds().split(",");
		if(roleIds!=null){
			for(String rid : roleIds){
				UserRole ur = new UserRole();
				ur.setRoleId(Long.valueOf(rid));
				ur.setUserId(userVo.getId());
				
				userRoleDao.insert(ur);
			}
		}
		
	}

	public void insertByVO(UserVO userVo) {
		User user = BeanUtils.copy(userVo, User.class);
		userDao.insert(user);
		
		//添加用户角色信息
		String[] roleIds = userVo.getRoleIds().split(",");
		if(roleIds!=null){
			for(String rid : roleIds){
				UserRole ur = new UserRole();
				ur.setRoleId(Long.valueOf(rid));
				ur.setUserId(userVo.getId());
				
				userRoleDao.insert(ur);
			}
		}
	}

	public void updateUser(User user) {
		userDao.updateById(user);
	}

	public void updateUserPwdById(Long userId, String pwd) {
		userDao.updateUserPwdById(userId,pwd);
	}
	
	
}
