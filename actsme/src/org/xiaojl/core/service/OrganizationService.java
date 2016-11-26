package org.xiaojl.core.service;

import java.util.List;

import org.xiaojl.core.model.Organization;
import org.xiaojl.core.model.result.Tree;

public interface OrganizationService {

	List<Tree> selectAllTree();

	List<Organization> selectAll();

	Organization selectById(Long id);

	Organization selectByName(String name);

	int updateById(Organization o);

	Organization selectByCode(String code);

	int insertOrganization(Organization o);

}
