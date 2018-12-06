package org.ani.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.ani.dao.ItemListDao;
import org.ani.dao.UserMainDao;
import org.ani.vo.UserMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class UserMainController {

	@Autowired
	private UserMainDao dao;
	
	@RequestMapping("/myPage.do")
	public void gtM() {}

	@RequestMapping("/editMyPage.do")
	public void gteM() {}
	
	@RequestMapping(value="/check.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String check(UserMainVo v) {
		String str = "";
		UserMainVo vo = null;
		vo = dao.check(v);
		if(vo != null)
			str = "{\"result\":\"1\"}";
		else
			str = "{\"result\":\"0\"}";
		
		return str;
	}
	@RequestMapping(value="/updateUserMain.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String update(UserMainVo vo, HttpSession s){
		String str = "";
		
		if(dao.update(vo)>0) {
			str="SUCCESS";
			s.setAttribute("user", dao.getUser(vo) );
		}else
			str="FAIL";
		
		return str;
	}
	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public void join() {}
	
	@RequestMapping(value="/join.do", method = RequestMethod.POST)
	@ResponseBody
	public String joinOk(UserMainVo v) {
		String str = "";
		Map map1 = new HashMap();
		map1.put("item_key", "Pdefault");
		map1.put("id", v.getId());
		map1.put("now", "true");
		map1.put("lcount", 0);
		Map map2 = new HashMap();
		map2.put("item_key", "Hdefault");
		map2.put("id", v.getId());
		map2.put("now", "true");
		map2.put("lcount", 0);
		
		if(dao.insertUserMain(v,map1,map2)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	@RequestMapping(value="/login.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String login(String id,String pwd,HttpSession session) {
        Map map = new HashMap(); 
		
		map.put("id", id);
		map.put("pwd", pwd);
		
		String str = "";
		UserMainVo vo = null;
		
		vo = dao.login(map);
		
		if(vo != null) {
			str = "{\"result\":\"1\"}";
			session.setAttribute("user",vo);
		}else{
			str = "{\"result\":\"0\"}";
		}
		return str;
	}
	
	@RequestMapping(value="/id_nic.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String id_nic_check(@RequestParam("id")String id) {
		Map map = new HashMap(); 
		
		map.put("id", id);
		
		String str = "";
		
		UserMainVo vo = null;
		
		vo = dao.id_nic_check(map);

		if(vo == null)
			str = "{\"result\":\"1\"}";
		else
			str = "{\"result\":\"0\"}";
		
		return str;
	}
	@RequestMapping(value="/findId.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String idcheck(String phone,String email) {
		
        Map map = new HashMap(); 
		map.put("phone", phone);
		map.put("email", email);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.idcheck(map));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/findPwd.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getPwd(String id,String phone,String email) {
		
		Map map = new HashMap(); 
		map.put("id", id);
		map.put("phone", phone);
		map.put("email", email);
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.getPwd(map));
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/bye.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String bye(HttpSession s) {
		String id = ((UserMainVo)s.getAttribute("user")).getId();
		Map map = new HashMap(); 
		map.put("id", id);
		String str = "";
		
		if(dao.bye(map)>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		
		return str;
	}
	
	
}
