package org.xiaojl.core.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.commons.utils.StringUtils;
import org.xiaojl.core.dao.RoleDao;
import org.xiaojl.core.dao.RoleResourceDao;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.RoleResource;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.Tree;

import com.baomidou.mybatisplus.plugins.Page;

@Service
public class RoleServiceImpl implements RoleService {
	
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private RoleResourceDao roleResourceDao;

	public void selectDataGrid(PageInfo pageInfo) {
		//mybatisplus.plugins的分页类
		Page<Role> page = new Page<Role>(pageInfo.getNowpage(),pageInfo.getSize());
		List<Role> lists = roleDao.selectRoleList(page,pageInfo.getSort(),pageInfo.getOrder());
		
		pageInfo.setRows(lists);
		pageInfo.setTotal(page.getTotal());
	}

	public void insertRole(Role role) {
		roleDao.insert(role);
	}

	public void updateRoleById(Role role) {
		roleDao.updateById(role);
	}

	public Role selectRoleById(Long id) {
		return roleDao.selectById(id);
	}

	public List<Long> selectResourceIdListByRoleId(Long id) {
		return roleResourceDao.selectResourceIdListByRoleId(id);
	}

	public void updateRoleResource(Long id, String resourceIds) {
		//先删除
		RoleResource rr = new RoleResource();
		rr.setRoleId(id);
		roleResourceDao.deleteSelective(rr);
		
		//再添加
		String[] rIds = resourceIds.split(",");
		for(int i=0;rIds!=null && i<rIds.length;i++){
			if(!StringUtils.isBlank(rIds[i])){
				Long rid = Long.parseLong(rIds[i]);
				rr = new RoleResource();
				rr.setRoleId(id);
				rr.setResourceId(rid);
				
				roleResourceDao.insert(rr);
			}
		}
	}

	public List<Tree> selectTree() {
		List<Tree> tree = new ArrayList<Tree>();
		List<Role> roles = roleDao.selectAll();
		if(roles!=null){
			for(Role r : roles){
				Tree t = new Tree();
				t.setId(r.getId());
				t.setText(r.getName());
				
				tree.add(t);
			}
		}
		return tree;
	}
	

}
