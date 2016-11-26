package org.xiaojl.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;

import com.baomidou.mybatisplus.mapper.AutoMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

public interface RoleDao extends AutoMapper<Role> {

	List<Resource> getResourcesByRoleIdAndType(@Param("resourceType") Integer resourceType, @Param("roleId") Long rid);

	List<Role> selectRoleList(Pagination page, @Param("sort") String sort, @Param("order") String order);

	List<Role> selectRolesByUserId(@Param("userId")Long id);

	List<Role> selectAll();

}
