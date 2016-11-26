package org.xiaojl.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.RoleResource;

import com.baomidou.mybatisplus.mapper.AutoMapper;

public interface RoleResourceDao extends AutoMapper<RoleResource> {

	List<Long> selectResourceIdListByRoleId(@Param("roleId") Long id);

	RoleResource selectByResourceId(@Param("resourceId")Long id);

	void deleteRoleResouceByResourceId(@Param("resourceId")Long id);

}
