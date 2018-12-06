package org.ani.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ani.dao.Chat_ListDao;
import org.ani.vo.Chat_listVo;
import org.ani.vo.UserMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class Chat_ListController {
	@Autowired
	private Chat_ListDao dao;
	
	@RequestMapping(value = "/letter.do")
	public void letter() {}
	
	@RequestMapping(value="/chatList.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String list(HttpSession s)
	{
		Map map = new HashMap();
		map.put("receiver",((UserMainVo)s.getAttribute("user")).getId());
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.list(map));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/fromMe.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String fromMe(String id)
	{
		Map map = new HashMap();
		map.put("id",id);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.fromMe(map));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/getChat.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getChat(int no)
	{
		Map map = new HashMap(); 
		map.put("no", no);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.getChat(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	} 
	@RequestMapping(value="/haveL.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String haveL(HttpSession s)
	{
		Map map = new HashMap(); 
		map.put("id", ((UserMainVo)s.getAttribute("user")).getId());
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.haveL(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	} 
	
	@RequestMapping(value="/insertChat.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String insert(Chat_listVo vo)
	{
		String str = "";
		if(dao.insert(vo)>0) {
			str = "{\"result\":\"1\"}";
		}else {
			str = "{\"result\":\"0\"}";
		}
		return str;
	}
	@RequestMapping(value="/useChat.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String useChat(String id)
	{
		Map map = new HashMap(); 
	    map.put("id", id);
		String str = "";
		if(dao.useChat(map)>0) {
			str = "{\"result\":\"1\"}";
		}else {
			str = "{\"result\":\"0\"}";
		}
		return str;
	}
	@RequestMapping(value="/deleteChat.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String delete(int no)
	{
		Map map = new HashMap();
		map.put("no",no);
		String str = "";
		if(dao.delete(map)>0) {
			str = "{\"result\":\"1\"}";
		}else {
			str = "{\"result\":\"0\"}";
		}
		return str;
	}
	
	
}
