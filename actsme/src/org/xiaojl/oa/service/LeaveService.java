package org.xiaojl.oa.service;

import org.xiaojl.core.model.result.PageInfo;
import org.xiaojl.core.model.result.SessionUser;
import org.xiaojl.oa.model.LeaveBill;

public interface LeaveService {

	public void selectDataGrid(PageInfo pi) ;

	public void insertLeaveBill(LeaveBill leaveBill);

	public void insertStartWorkflow(Long leaveBillId, SessionUser suser);

	public LeaveBill selectLeaveBillById(Long id);

	public void selectProcessTaskDataGrid(PageInfo pi);

}
