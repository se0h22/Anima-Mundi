package org.ani.db;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.ani.vo.UserMainVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserMainManager {
	
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
	public static UserMainVo check(UserMainVo vo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		UserMainVo v= session.selectOne("userMain.check1",vo);
		session.close();
		return v;
	}

	public static int update(UserMainVo vo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		int re = session.update("userMain.update",vo);
		session.close();
		return re;
	}
	
	public static int insertUserMain(UserMainVo u,Map map1,Map map2) {
		SqlSession session = factory.openSession();
		int re=-1;
		int re1 = session.insert("userMain.insert",u);
		int re2 = session.insert("item.buy",map1);
		int re3 = session.insert("item.buy",map2);
		if(re1==1 && re2==1 && re3==1) {
			re=1;
			session.commit();
		}
		session.close();
		return re;
	}

	public static UserMainVo login(Map map) {
		SqlSession session = factory.openSession();
		UserMainVo v =session.selectOne("userMain.check2",map);
		session.close();
		return v;
	}
		
	public static UserMainVo id_nic_check(Map map) {
		SqlSession session = factory.openSession();
		UserMainVo v =  session.selectOne("userMain.id_nic_check",map);
		session.close();
		return v;
	}

	public static String pwcheck(String id) {
		SqlSession session = factory.openSession();
		String pwcheck=session.selectOne("userMain.pwcheck",id);
		session.close();
		return pwcheck;
	}
	public static List<String> idcheck(Map map) {
		SqlSession session = factory.openSession();
		List<String> v =session.selectList("userMain.getId",map);
		session.close();
		return v;
	}
	public static List<String> getPwd(Map map) {
		SqlSession session = factory.openSession();
		List<String> v =session.selectList("userMain.getPwd",map);
		session.close();
		return v;
	}

	public static int bye(Map map) {
		SqlSession session = factory.openSession();
		int re=-1;
		int re1 = session.delete("userMain.bye1",map);
		int re2 = session.delete("userMain.bye2",map);
		int re3 = session.delete("userMain.bye3",map);
		int re4 = session.delete("userMain.bye4",map);
		int re5 = session.delete("userMain.bye5",map);
		if(re5>0) {
			re=1;
			session.commit();
		}
		session.close();
		return re;
	}

	public static UserMainVo getUser(UserMainVo vo) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		UserMainVo v =  session.selectOne("userMain.getUser",vo);
		session.close();
		return v;
	}
	
	
	
}
