package org.xiaojl.core.service;

import java.util.List;

import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.model.result.Tree;

public interface ResourceService {

	/**
	 * 获取菜单
	 */
	List<Tree> selectMenuTree(SessionUser currentUser);

	List<Resource> selectAllResources();

	Resource selectOneById(Long id);

	void updateResourceById(Resource resource);

	void deleteResourceById(Long id);

	void insertResource(Resource resource);

	/**
	 * 获取菜单和按钮
	 */
	List<Tree> selectResourcesTree(SessionUser currentUser);

	List<Resource> selectResourcesByRoles(List<Role> roles);

}
