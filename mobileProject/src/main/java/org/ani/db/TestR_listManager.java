package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.TestR_listVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class TestR_listManager {
	private static SqlSessionFactory factory;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("org/ani/db/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	public static List<TestR_listVo> list(Map map)
	{	
		SqlSession session = factory.openSession();
		List<TestR_listVo> list = session.selectList("testRlist.list",map);
		session.close();
		return list;
	}
	public static List<TestR_listVo> getConlist(Map map)
	{
		SqlSession session = factory.openSession();
		List<TestR_listVo> trv = session.selectList("testRlist.getConlist",map);
		session.close();
		return trv;
	}
	public static TestR_listVo getMyCount(Map map)
	{
		SqlSession session = factory.openSession();
		TestR_listVo gmc = session.selectOne("testRlist.getMyCount",map);
		session.close();
		return gmc;
	}
	public static int insert(Map map)
	{
		int re = -1; 
		SqlSession session = factory.openSession(true);
		re =session.insert("testRlist.insert",map);
		session.close();
		return re;
	}
	public static int update(Map map)
	{
		int re = -1; 
		SqlSession session = factory.openSession(true);
		re =session.insert("testRlist.update",map);
		session.close();
		return re;
	}

}
