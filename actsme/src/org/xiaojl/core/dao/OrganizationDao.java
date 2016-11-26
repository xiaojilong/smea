package org.xiaojl.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.xiaojl.core.model.Organization;

import com.baomidou.mybatisplus.mapper.AutoMapper;

public interface OrganizationDao extends AutoMapper<Organization>{

	List<Organization> selectListByPid(@Param("pid") Long id);

	List<Organization> selectAll();

	Organization selectByName(@Param("name")String name);

	Organization selectByCode(@Param("code")String code);

}
