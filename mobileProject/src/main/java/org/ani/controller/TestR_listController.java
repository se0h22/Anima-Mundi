package org.ani.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ani.dao.TestR_listDao;
import org.ani.vo.TestR_listVo;
import org.ani.vo.UserMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class TestR_listController {
	@Autowired
	private TestR_listDao dao;
	
	@RequestMapping("/history.do")
	public void historyMain() {	}
	
	@RequestMapping(value="/testR_history.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String list(HttpSession s)
	{
		Map map = new HashMap(); 
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		map.put("id", v.getId());
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.list(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/testR_con.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getConlist(String id)
	{
		Map map = new HashMap(); 
		map.put("id", id);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.getConlist(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/getMyCount.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getMyCount(String id)
	{
		Map map = new HashMap(); 
		map.put("id", id);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.getMyCount(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/testR_insert.do")
	@ResponseBody
	public void insertOk(String id, String testTable_name,String result)
	{
		Map map = new HashMap(); 
		map.put("id", id);
		map.put("testTable_name", testTable_name);
		map.put("result", result);
		
		int re = dao.insert(map);
		//System.out.println("µî·Ïre°ª"+re);
	}
	@RequestMapping(value="/point_up.do")
	@ResponseBody
	public void updateOk(String id,int point,HttpSession s)
	{
		Map map = new HashMap();
		map.put("id", id);
		map.put("point", point);
		int re = dao.update(map);
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		v.setPoint(point+v.getPoint());
		s.setAttribute("user", v);
	}

}
