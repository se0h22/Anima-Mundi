package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.TestListVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class TestListManager {
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
	public static List<TestListVo> list()
	{
		SqlSession session = factory.openSession();
		List<TestListVo> list = session.selectList("testList.list");
		return list;
	}
	public static int insert(TestListVo v)
	{
		int re=-1;
		SqlSession session = factory.openSession();
		re = session.insert("testList.insert",v);
		return re;
	}
	public static int update(TestListVo v)
	{
		int re=-1;
		SqlSession session = factory.openSession();
		re = session.update("testList.update",v);
		return re;
	}
	public static int delete(Map map)
	{
		int re=-1;
		SqlSession session = factory.openSession();
		re = session.delete("testList.delete",map);
		return re;
	}
	public static List<TestListVo> customList()
	{
		SqlSession session = factory.openSession();
		List<TestListVo> list = session.selectList("testList.customList");
		return list;
	}
}
