package org.xiaojl.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.Resource;

import com.baomidou.mybatisplus.mapper.AutoMapper;

public interface ResourceDao extends AutoMapper<Resource> {

	List<Resource> selectResourcesByTypeAndPid(@Param("resourceType") Integer resourceType, @Param("pId")Long pId);

	List<Resource> selectResourcesByRoleIdAndType(@Param("resourceType") Integer resourceType, @Param("roleId") Long roleId);

	List<Resource> selectAllResource();

	List<Resource> selectByPid(@Param("pid")Long id);

}
