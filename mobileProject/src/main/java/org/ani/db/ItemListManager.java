package org.ani.db;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ani.vo.ItemListVo;
import org.ani.vo.UserItemVo;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

public class ItemListManager {
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

	public static List<ItemListVo> list(){
		SqlSession session = factory.openSession();
		List<ItemListVo> list =session.selectList("item.list");
		session.close();
		return list;
	}

	public static ItemListVo detail(ItemListVo vo) {
		SqlSession session = factory.openSession();
		ItemListVo v = session.selectOne("item.detail",vo);
		session.close();
		return v;
	}

	public static int insert(ItemListVo v) {
		SqlSession session = factory.openSession(true);
		int re = session.insert("item.insert",v);
		session.close();
		return re;
	}

	public static int update(ItemListVo v) {
		SqlSession session = factory.openSession(true);
		int re = session.update("item.update",v);
		session.close();
		return re;
	}
	
	public static int delete(Map map) {
		SqlSession session = factory.openSession(true);
		int re = session.selectOne("item.delete",map);
		session.close();
		return re;
	}
	
	public static List<UserItemVo> userItems(Map map) {
		SqlSession session = factory.openSession();
		List<UserItemVo> list =  session.selectList("item.haveList",map);
		session.close();
		return list;
	}
	
	public static int itemBuy(Map map) {
		SqlSession session = factory.openSession(true);
		map.put("startK", (map.get("item_key")+"").substring(0,1));
		session.update("item.setItem2",map);
		int re1 =session.insert("item.buy",map);
		int re2=session.update("item.buyPoint",map);
		int re=-1;
		if(re1>0 && re2>0) {
			re=1;
		}
		session.close();
		return re;
	}
	
	public static int useItem(Map map) {
		SqlSession session = factory.openSession(true);
		int re = session.delete("item.useItem",map);
		session.close();
		return re;
	}
	
	//매칭에 가져갈 행성 이미지 이름
	public static String getP(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession();
		String re = session.selectOne("item.getP",map);
		session.close();
		return re;
	}

	public static int setItem(Map map) {
		// TODO Auto-generated method stub
		SqlSession session = factory.openSession(true);
		map.put("startK", (map.get("item_key")+"").substring(0,1));
		session.update("item.setItem2",map);
		int re = session.update("item.setItem",map);
		session.close();
		return re;
	}
	
}
