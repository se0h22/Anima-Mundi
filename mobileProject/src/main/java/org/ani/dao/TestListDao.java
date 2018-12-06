package org.ani.dao;


import java.util.List;
import java.util.Map;

import org.ani.db.TestListManager;
import org.ani.vo.TestListVo;
import org.springframework.stereotype.Repository;
@Repository
public class TestListDao {
	
	public List<TestListVo> list()
	{
		return TestListManager.list();
	}
	public List<TestListVo> customList()
	{
		return TestListManager.customList();
	}
	public int insert(TestListVo v)
	{
		return TestListManager.insert(v);
	}
	public int update(TestListVo v)
	{
		return TestListManager.update(v);
	}
	public int delete(Map map)
	{
		return TestListManager.delete(map);
	}

}
