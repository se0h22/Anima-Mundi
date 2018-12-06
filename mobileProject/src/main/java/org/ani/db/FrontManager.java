package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.ItemListVo;
import org.ani.vo.TestListVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FrontManager {
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
	
	//사용자의 now 아이템 이미지파일명 
	public static List<String> imgList(Map map){
		SqlSession session = factory.openSession();
		List<String> list =session.selectList("front.pimg",map);
		session.close();
		return list;
	}
	public static List<String> getTimes(Map map){
		SqlSession session = factory.openSession();
		List<String> list =session.selectList("front.getTimes",map);
		session.close();
		return list;
	}
	public static List<String> myCount(Map map){
		SqlSession session = factory.openSession();
		List<String> list =session.selectList("front.myCount",map);
		session.close();
		return list;
	}
	public static int addCustomTest(TestListVo v) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.insert("front.addCustomTest",v);
		session.close();
		return re;
	}
}
