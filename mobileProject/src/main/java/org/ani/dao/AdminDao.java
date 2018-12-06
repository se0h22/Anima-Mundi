package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.AdminManager;
import org.ani.vo.ItemListVo;
import org.ani.vo.QABoardVo;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {
	public List<QABoardVo> qaList(){
		return AdminManager.qaList(); 
	}

	public ItemListVo getItem(Map map) {
		// TODO Auto-generated method stub
		return AdminManager.getItem(map);
	}
}
