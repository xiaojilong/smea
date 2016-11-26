package org.xiaojl.core.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xiaojl.core.dao.OrganizationDao;
import org.xiaojl.core.model.Organization;
import org.xiaojl.core.model.result.Tree;

@Service
public class OrganizationServiceImpl implements OrganizationService {
	@Autowired
	private OrganizationDao organizationDao;
	
	
	public List<Tree> selectAllTree() {
		List<Tree> tree = new ArrayList<Tree>();
		
		List<Organization> orgList = organizationDao.selectListByPid(null);
		if(orgList == null){
			return null;
		}
		for(Organization o:orgList){
			Tree oneTree = new Tree();
			oneTree.setId(o.getId());
			oneTree.setText(o.getName());
			oneTree.setIconCls(o.getIcon());
			
			List<Organization> orgList2 = organizationDao.selectListByPid(o.getId());
			if(orgList2!=null){
				List<Tree> tree2 = new ArrayList<Tree>();
				for(Organization or:orgList2){
					Tree two = new Tree();
					two.setId(or.getId());
					two.setText(or.getName());
					two.setIconCls(or.getIcon());
					
					tree2.add(two);
				}
				oneTree.setChildren(tree2);
			}else{
				oneTree.setState("closed");
			}
			tree.add(oneTree);
		}
		return tree;
	}


	public List<Organization> selectAll() {
		return organizationDao.selectAll();
	}


	public Organization selectById(Long id) {
		return organizationDao.selectById(id);
	}

	public Organization selectByName(String name) {
		return organizationDao.selectByName(name);
	}


	public int updateById(Organization o) {
		return organizationDao.updateById(o);
	}


	public Organization selectByCode(String code) {
		return organizationDao.selectByCode(code);
	}


	public int insertOrganization(Organization o) {
		return organizationDao.insert(o);
	}

}
