package com.iii._05_.customized.model;

import java.util.List;







public interface CustomizedDAO {
	public List<CustomizedBean> getAllByAccount(String account);
	
	public CustomizedBean getCustomizedBySeqNo(int customizedSeqNo);
	
	public int saveCustomized(CustomizedBean CustomizedBean);

	public void updateCustomized(CustomizedBean CustomizedBean);

	public void deleteCustomized(CustomizedBean CustomizedBean);
}
