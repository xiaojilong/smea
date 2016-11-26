package org.xiaojl.core.service;

import java.util.List;

import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.Tree;

public interface RoleService {

	void selectDataGrid(PageInfo pageInfo);

	void insertRole(Role role);

	void updateRoleById(Role role);

	Role selectRoleById(Long id);

	List<Long> selectResourceIdListByRoleId(Long id);

	/**
	 * 授权
	 * @param id
	 * @param resourceIds
	 */
	void updateRoleResource(Long id, String resourceIds);

	List<Tree> selectTree();

}
