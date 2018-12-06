package org.ani.controller;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ani.dao.FrontDao;
import org.ani.dao.UserMainDao;
import org.ani.vo.TestListVo;
import org.ani.vo.UserMainVo;
import org.apache.ibatis.reflection.SystemMetaObject;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class FrontController {
	@Autowired
	private FrontDao dao;
	@RequestMapping("/testList.do")
	public void testList() {}
	@RequestMapping("/testList2.do")
	public void testList2() {}
	@RequestMapping("/testList3.do")
	public void testList3() {}
	@RequestMapping("/makeTest.do")
	public void makeTest() {}
	@RequestMapping("/info.do")
	public void info() {}
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public ModelAndView main(HttpSession s){
		ModelAndView m = new ModelAndView();
		Map map = new HashMap();
		if(s.getAttribute("user")==null || s.getAttribute("user")=="") {
			m.setViewName("redirect:/index.do");
			return m;
		}
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		map.put("id",v.getId());
		List<String> list=dao.imgList(map);
		
		for(String i : list) {
			if(i.substring(0,1).equals("P")) {
				m.addObject("pImg",i);
			}else if(i.substring(0,1).equals("H")) {
				m.addObject("hImg",i);				
			}
		}
		return m;
	}
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public void index(HttpSession s){
		s.setAttribute("user", null);
	}
	
	@RequestMapping(value="/getTimes.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getTimes(String id)
	{
		String str = "";
		
		Map map = new HashMap(); 
		map.put("id", id);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.getTimes(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/myCount.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String myCount(String id)
	{
		String str = "";
		
		Map map = new HashMap(); 
		map.put("id", id);
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.myCount(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/customAddTest.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String addTest(TestListVo v)
	{
		String str = "FAIL";

		if(dao.addCustomTest(v)>0) {
			str="SUCCESS";
		}

		return str;
	}	
	@RequestMapping(value="/customAddTestJ.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public void addTest(HttpServletRequest req, String str)
	{
		JSONParser parser = new JSONParser();
		Object obj;
		
		try {
			try {
				obj = parser.parse(str);
				JSONObject jsonObj = (JSONObject) obj;
				
				String path = req.getRealPath("/resources/json/");
				
				Object old = parser.parse(new FileReader(path+"/testList.json"));
				JSONArray arr = (JSONArray) old;
				arr.add(jsonObj);
				
				System.out.println(arr.toJSONString());
				FileWriter file = new FileWriter(path+"/testList.json");
				file.write(arr.toJSONString());
				file.flush();
				file.close();
				System.out.println("≥°¿Œ∞°?");
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	     } catch(IOException e) {
	            e.printStackTrace();
	     }
		
	}	
}
