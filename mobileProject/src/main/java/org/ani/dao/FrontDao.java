package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.FrontManager;
import org.ani.vo.TestListVo;
import org.springframework.stereotype.Repository;
@Repository
public class FrontDao {
	public List<String> imgList(Map map){
		return FrontManager.imgList(map); 
	}
	public List<String> getTimes(Map map){
		return FrontManager.getTimes(map); 
	}
	public List<String> myCount(Map map){
		return FrontManager.myCount(map); 
	}
	public int addCustomTest(TestListVo v) {
		// TODO Auto-generated method stub
		return FrontManager.addCustomTest(v);
	}
}
