package org.xiaojl.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.UserRole;

import com.baomidou.mybatisplus.mapper.AutoMapper;

public interface UserRoleDao extends AutoMapper<UserRole> {

	List<Long> selectRoleIdsByUserId(@Param("userId") Long userId);

	List<UserRole> selectByUserId(Long id);


}
