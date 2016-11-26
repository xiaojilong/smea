package org.xiaojl.core.service;

import java.util.List;

import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.vo.UserVO;

public interface UserService {
	public static final String serviceName = "org.xiaojl.core.service.UserServiceImpl";
	
	User selectUserByloginNameAndPassword(String username, String password);

	List<Role> selectRolesByUserId(Long id);

	void selectDataGrid(PageInfo pi);

	User selectUserById(Long id);

	UserVO selectUserVoById(Long id);

	User selectUserByLoginName(String loginName);

	void updateByVO(UserVO userVo);

	void insertByVO(UserVO userVo);

	void updateUser(User user);

	void updateUserPwdById(Long userId, String pwd);

}
