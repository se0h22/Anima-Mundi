package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.TestR_listManager;
import org.ani.vo.TestR_listVo;
import org.springframework.stereotype.Repository;
@Repository
public class TestR_listDao {
	
	public List<TestR_listVo> list(Map map)
	{
		return TestR_listManager.list(map);
	}
	public List<TestR_listVo> getConlist(Map map)
	{
		return TestR_listManager.getConlist(map);
	}
	public TestR_listVo getMyCount(Map map)
	{
		return TestR_listManager.getMyCount(map);
	}
	public int insert(Map map)
	{
		return TestR_listManager.insert(map);
	}
	public int update(Map map)
	{
		return TestR_listManager.update(map);
	}
}
