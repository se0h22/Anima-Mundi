package org.ani.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ani.vo.QABoardVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class QABoardManager {
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
	
	public static List<QABoardVo> list(Map map)
	{	
		SqlSession session = factory.openSession();
		List<QABoardVo> list= session.selectList("board.boardList",map);
		session.close();
		return list;
	}
	public static QABoardVo getBoard(int bno)
	{
		SqlSession session = factory.openSession();
		QABoardVo v= session.selectOne("board.getBoard",bno);
		session.close();
		return v;
	}
	public static int getNextNo()
	{
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("board.nextNo");
		session.close();
		return re;
	}
	public static int insert(QABoardVo vo)
	{
		SqlSession session = factory.openSession(true);
		int re = session.insert("board.insert",vo);
		session.close();
		return re;
	}
	public static int update(QABoardVo vo)
	{
		SqlSession session = factory.openSession(true);
		int re = session.update("board.update",vo);
		session.close();
		return re;
	}
	public static int delete(Map map)
	{
		SqlSession session = factory.openSession(true);
		int re = session.delete("board.delete",map);
		session.close();
		return re;
	}
	public static int updateStep(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("board.upStep",map);
		session.close();
		return re;
	}
	

}


