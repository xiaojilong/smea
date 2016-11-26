package org.xiaojl.core.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.User;
import org.xiaojl.core.model.vo.UserVO;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.Page;

public interface UserDao extends AutoMapper<User> {

	User selectUserByloginNameAndPassword(@Param("loginName") String loginName, @Param("password") String password);

	List<User> selectUserVoPage(Page<User> page, Map<String, Object> condition);

	UserVO selectUserVoById(@Param("id")Long id);

	User selectUserByLoginName(@Param("loginName")String loginName);

	void updateUserPwdById(@Param("id")Long userId, @Param("pwd")String pwd);


}
