package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.ItemListVo;
import org.ani.vo.QABoardVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class AdminManager {
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
	
	public static List<QABoardVo> qaList(){
		SqlSession session = factory.openSession();
		List<QABoardVo> list =session.selectList("admin.qa_list");
		session.close();
		return list;
	}

	public static ItemListVo getItem(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		ItemListVo item =session.selectOne("item.detail",map);
		session.close();
		return item;}
}
