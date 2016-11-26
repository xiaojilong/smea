package org.xiaojl.core.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.core.dao.ResourceDao;
import org.xiaojl.core.dao.RoleResourceDao;
import org.xiaojl.core.dao.UserRoleDao;
import org.xiaojl.core.model.Resource;
import org.xiaojl.core.model.Role;
import org.xiaojl.core.model.RoleResource;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.core.model.result.Tree;

@Service
public class ResourceServiceImpl implements ResourceService{
	private Log log = LogFactory.getLog(this.getClass());
	private static final int RESOURCE_MENU = 0;//菜单
	private static final int RESOURCE_BUTTON = 1;//按钮
	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private RoleResourceDao roleResourceDao;
	
	public List<Tree> selectMenuTree(SessionUser currentUser) {
		List<Tree> resultList = new ArrayList<Tree>();
		if("admin".equals(currentUser.getLoginName())){
			List<Resource> relist = resourceDao.selectResourcesByTypeAndPid(RESOURCE_MENU,null);
			if(relist==null){
				return null;
			}
			
			for(Resource res:relist){
				Tree t = new Tree();
				t.setId(res.getId());
				t.setText(res.getName());
				t.setIconCls(res.getIcon());
				t.setAttributes(res.getUrl());
				
				//获取子菜单
				List<Resource> relistson = resourceDao.selectResourcesByTypeAndPid(RESOURCE_MENU,res.getId());
				if(relistson!=null){
					List<Tree> sonTree = new ArrayList<Tree>();
					
					for(Resource rs:relistson){
						Tree t2 = new Tree();
						t2.setId(rs.getId());
						t2.setText(rs.getName());
						t2.setAttributes(rs.getUrl());
						t2.setIconCls(rs.getIcon());
						sonTree.add(t2);
					}
					t.setChildren(sonTree);
				}else{
					t.setState("closed");
				}
				resultList.add(t);
			}
			
			return resultList;
		}
		
		//普通用户
		//1、根据用户ID获取所拥有的角色ID
		List<Long> roleIds = userRoleDao.selectRoleIdsByUserId(currentUser.getUserId());
		//2、根据角色ID获取所有的资源
		List<Resource> relist = new ArrayList<Resource>();
		for(Long rid:roleIds){
			List<Resource> rl = resourceDao.selectResourcesByRoleIdAndType(RESOURCE_MENU , rid);
			if(rl!=null){
				for(Resource re:rl){
					if(!relist.contains(re)){
						relist.add(re);
					}
				}
			}
		}
		//3、将资源list转化为treelist
		if(relist==null){
			return null;
		}
		for(Resource rs : relist){
			if(rs!=null && rs.getPid()==null){
				Tree t = new Tree();
				t.setId(rs.getId());
				t.setText(rs.getName());
				t.setIconCls(rs.getIcon());
				t.setAttributes(rs.getUrl());
				
				//获取子菜单
				List<Tree> sonTree = new ArrayList<Tree>();
				for(Resource re : relist){
					if(re != null && re.getPid()==rs.getId()){
						Tree t2 = new Tree();
						t2.setId(rs.getId());
						t2.setText(rs.getName());
						t2.setAttributes(rs.getUrl());
						t2.setIconCls(rs.getIcon());
						sonTree.add(t2);
					}
				}
				t.setChildren(sonTree);
				resultList.add(t);
			}
		}
		return resultList;
	}

	public List<Resource> selectAllResources() {
		return resourceDao.selectAllResource();
	}

	public Resource selectOneById(Long id) {
		return resourceDao.selectById(id);
	}

	public void updateResourceById(Resource resource) {
		resourceDao.updateSelectiveById(resource);
	}

	public void deleteResourceById(Long id) {
		//删除资源下的子资源
		List<Resource> slist = resourceDao.selectByPid(id);
		for(int i=0;slist!=null && i<slist.size();i++){
			Resource r = slist.get(i);
			//删除角色资源关联表数据
			roleResourceDao.deleteRoleResouceByResourceId(r.getId());
			//删除资源
			resourceDao.deleteById(r.getId());
		}
		
		//删除角色资源关联表数据
		roleResourceDao.deleteRoleResouceByResourceId(id);
		//删除本资源
		resourceDao.deleteById(id);
	}

	public void insertResource(Resource resource) {
		resourceDao.insert(resource);
	}

	public List<Tree> selectResourcesTree(SessionUser currentUser) {
		List<Tree> resultList = new ArrayList<Tree>();
		if("admin".equals(currentUser.getLoginName())){
			List<Resource> relist = resourceDao.selectResourcesByTypeAndPid(RESOURCE_MENU,null);
			if(relist==null){
				return null;
			}
			
			for(Resource res:relist){
				Tree t = new Tree();
				t.setId(res.getId());
				t.setText(res.getName());
				t.setIconCls(res.getIcon());
				t.setAttributes(res.getUrl());
				
				//获取子菜单
				List<Resource> relistson = resourceDao.selectResourcesByTypeAndPid(RESOURCE_MENU,res.getId());
				if(relistson!=null){
					List<Tree> sonTree = new ArrayList<Tree>();
					
					for(Resource rs:relistson){
						Tree t2 = new Tree();
						t2.setId(rs.getId());
						t2.setText(rs.getName());
						t2.setAttributes(rs.getUrl());
						t2.setIconCls(rs.getIcon());
						
						/***********************按钮****************************/
	                    List<Resource> resourceSons = resourceDao.selectResourcesByTypeAndPid(RESOURCE_BUTTON, rs.getId());

	                    if (resourceSons == null) {
	                        t2.setState("closed");
	                    } else {
	                        List<Tree> treeThreeList = new ArrayList<Tree>();
	                        for (Resource resourceThree : resourceSons) {
	                            Tree treeThree = new Tree();

	                            treeThree.setId(resourceThree.getId());
	                            treeThree.setText(resourceThree.getName());
	                            treeThree.setIconCls(resourceThree.getIcon());
	                            treeThree.setAttributes(resourceThree.getUrl());

	                            treeThreeList.add(treeThree);
	                        }
	                        t2.setChildren(treeThreeList);
	                    }
	                    /***************************************************/
						
						sonTree.add(t2);
					}
					t.setChildren(sonTree);
				}else{
					t.setState("closed");
				}
				resultList.add(t);
			}
			
			return resultList;
		}
		
		//普通用户
		//1、根据用户ID获取所拥有的角色ID
		List<Long> roleIds = userRoleDao.selectRoleIdsByUserId(currentUser.getUserId());
		//2、根据角色ID获取所有的资源
		List<Resource> relist = new ArrayList<Resource>();
		for(Long rid:roleIds){
			List<Resource> rl = resourceDao.selectResourcesByRoleIdAndType(RESOURCE_MENU , rid);
			if(rl!=null){
				for(Resource re:rl){
					if(!relist.contains(re)){
						relist.add(re);
					}
				}
			}
		}
		//3、将资源list转化为treelist
		if(relist==null){
			return null;
		}
		for(Resource rs : relist){
			if(rs!=null && rs.getPid()==null){
				Tree t = new Tree();
				t.setId(rs.getId());
				t.setText(rs.getName());
				t.setIconCls(rs.getIcon());
				t.setAttributes(rs.getUrl());
				
				//获取子菜单
				List<Tree> sonTree = new ArrayList<Tree>();
				for(Resource re : relist){
					if(re != null && re.getPid()==rs.getId()){
						Tree t2 = new Tree();
						t2.setId(rs.getId());
						t2.setText(rs.getName());
						t2.setAttributes(rs.getUrl());
						t2.setIconCls(rs.getIcon());
						
						/***********************按钮****************************/
	                    List<Resource> resourceSons = resourceDao.selectResourcesByTypeAndPid(RESOURCE_BUTTON, rs.getId());

	                    if (resourceSons == null) {
	                        t2.setState("closed");
	                    } else {
	                        List<Tree> treeThreeList = new ArrayList<Tree>();
	                        for (Resource resourceThree : resourceSons) {
	                            Tree treeThree = new Tree();

	                            treeThree.setId(resourceThree.getId());
	                            treeThree.setText(resourceThree.getName());
	                            treeThree.setIconCls(resourceThree.getIcon());
	                            treeThree.setAttributes(resourceThree.getUrl());

	                            treeThreeList.add(treeThree);
	                        }
	                        t2.setChildren(treeThreeList);
	                    }
	                    /***************************************************/
						
						sonTree.add(t2);
					}
				}
				t.setChildren(sonTree);
				resultList.add(t);
			}
		}
		return resultList;
	}

	public List<Resource> selectResourcesByRoles(List<Role> roles) {
		List<Resource> list = new ArrayList<Resource>();
		if(roles!=null){
			for(Role r:roles){
				List<Resource> rmlists = resourceDao.selectResourcesByRoleIdAndType(RESOURCE_MENU , r.getId());
				List<Resource> rblists = resourceDao.selectResourcesByRoleIdAndType(RESOURCE_BUTTON , r.getId());
				if(rmlists!=null){
					for(Resource re:rmlists){
						if(!list.contains(re)){
							list.add(re);
						}
					}
				}
				if(rblists!=null){
					for(Resource re:rblists){
						if(!list.contains(re)){
							list.add(re);
						}
					}
				}
			}
		}
		log.debug(list);
		return list;
	}

}
