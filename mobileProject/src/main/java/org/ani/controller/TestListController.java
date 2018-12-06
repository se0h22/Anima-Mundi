package org.ani.controller;

import java.util.HashMap;
import java.util.Map;

import org.ani.dao.TestListDao;
import org.ani.vo.TestListVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class TestListController {
	@Autowired
	private TestListDao dao;
	
	@RequestMapping(value="/test_main.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String list()
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.list());
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/customList.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String customList()
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(dao.customList());
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/test_update.do", method=RequestMethod.GET, produces="text/plain;charset=utf-8")
	@ResponseBody
	public void update()
	{
		
	}
	@RequestMapping(value="/test_update.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public void updateOk(TestListVo v)
	{
		
		
		int re = dao.update(v);

	}
	@RequestMapping(value="/test_delete.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public void delete(String testTable_name)
	{
		Map map = new HashMap();
		map.put("testTable_name", testTable_name);
		int re = dao.delete(map);
		
	}

}
