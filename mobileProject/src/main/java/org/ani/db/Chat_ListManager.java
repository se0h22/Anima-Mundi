package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.Chat_listVo;
import org.ani.vo.UserCustomVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Chat_ListManager {
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
	
	public static List<Chat_listVo> list(Map map)
	{
		SqlSession session = factory.openSession();
		List<Chat_listVo> list= session.selectList("chatList.list",map);
		session.close();
		return list;
	}
	public static List<Chat_listVo> fromMe(Map map)
	{
		SqlSession session = factory.openSession();
		List<Chat_listVo> list= session.selectList("chatList.fromMe",map);
		session.close();
		return list;
	}
	public static Chat_listVo getChat(Map map)
	{
		SqlSession session = factory.openSession();
		Chat_listVo vo = session.selectOne("chatList.getChat",map);
		session.close();
		return vo;
	}
	public static int insert(Chat_listVo vo)
	{
		int re = -1;
		SqlSession session = factory.openSession(true);
		re = session.insert("chatList.insert",vo);
		session.close();
		return re;
	}
	public static int useChat(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("chatList.useChat",map);
		session.close();
		return re;
	}
	public static int delete(Map map)
	{
		SqlSession session = factory.openSession(true);
		int re = session.delete("chatList.delete",map);
		session.close();
		return re;
	}
	public static UserCustomVo haveL(Map map)
	{
		SqlSession session = factory.openSession();
		UserCustomVo vo = session.selectOne("chatList.haveL",map);
		session.close();
		return vo;
	}
	
}
