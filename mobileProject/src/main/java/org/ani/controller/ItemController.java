package org.ani.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ani.dao.ItemListDao;
import org.ani.vo.ItemListVo;
import org.ani.vo.UserMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class ItemController {
	@Autowired
	private ItemListDao dao;

	@RequestMapping(value = "/store.do")
	public void store() {}
	
	@RequestMapping(value = "/myBuy.do")
	public ModelAndView store2(String tab) {
		ModelAndView m = new ModelAndView("store");
		m.addObject("tab",tab);
		return m;
	}

	@RequestMapping(value = "/listItem.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String itemList() {
		String str = "";
		ObjectMapper m = new ObjectMapper();
		try {
			str = m.writeValueAsString(dao.list());
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping(value = "/detailItem.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String itemDetail(@RequestBody ItemListVo vo) {
		String str = "";
		
		ObjectMapper m = new ObjectMapper();
		try {
			str = m.writeValueAsString(dao.detail(vo));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping(value = "/insertItem.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String itemInsert(@RequestBody ItemListVo v) {
		String str = "";
		//ObjectMapper m = new ObjectMapper();
		if(dao.insert(v)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}

	@RequestMapping(value = "/updateItem.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String itemUpdate(@RequestBody ItemListVo v) {
		String str = "";
		//ObjectMapper m = new ObjectMapper();
		if(dao.update(v)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	@RequestMapping(value = "/deleteItem.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String itemDelete(String key) {
		
		System.out.println(key);
		String str = "";
		Map map = new HashMap();	
		map.put("key", key);
		//ObjectMapper m = new ObjectMapper();
		if(dao.delete(map)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	@RequestMapping(value = "/userItemList.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String userItemList(HttpSession s) {
		String str = "";
		ObjectMapper m = new ObjectMapper();
		UserMainVo uv = (UserMainVo)s.getAttribute("user");
		Map map = new HashMap();	
		map.put("id", uv.getId());
		try {
			str = m.writeValueAsString(dao.userItems(map));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}

	@RequestMapping(value = "/insertCustom.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String customInsert(String item_key,int lcount, int point, String now, HttpSession s) {
		String str = "";
		Map map = new HashMap();	
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		map.put("id", v.getId());
		map.put("item_key", item_key);
		map.put("lcount", lcount);
		map.put("point", point);
		map.put("now", now);
		if(dao.itemBuy(map)>0) {
			str="SUCCESS";
			v.setPoint(v.getPoint()-point );
			s.setAttribute("user", v);
		}else {
			str="FAIL";
		}
		return str;
	}
	
	@RequestMapping(value = "/updateCustom.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String customUpdate(String item_key, String now, HttpSession s) {
		String str = "";
		Map map = new HashMap();	
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		map.put("id", v.getId());
		map.put("item_key", item_key);
		map.put("now", now);
		if(dao.setItem(map)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	
	@RequestMapping(value = "/deleteCustom.do", produces = "text/plain;charset=utf-8;")
	@ResponseBody
	public String customDelete(int no, HttpSession s) {
		String str = "";
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		Map map = new HashMap();	
		map.put("id", v.getId());
		map.put("no", no);
		if(dao.useItem(map)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	//행성이미지명  가져감
	
	@RequestMapping(value="/getP.do", produces="text/plain;charset=utf-8;")
	@ResponseBody
	public String getP(String id) {
		String str = "";
		ObjectMapper m = new ObjectMapper();
		Map map = new HashMap();	
		map.put("id", id);
		try {
			str = m.writeValueAsString(dao.getP(map));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
}
