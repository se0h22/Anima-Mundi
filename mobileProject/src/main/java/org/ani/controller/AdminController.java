package org.ani.controller;

import java.util.HashMap;
import java.util.Map;

import org.ani.dao.AdminDao;
import org.ani.dao.QABoardDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {

	@Autowired 
	private AdminDao dao;
	
	@RequestMapping("/adminP.do") //������������ �������� ������ ���������� �̵�
	public ModelAndView adminMain() {
		ModelAndView m = new ModelAndView("admin/a_item");
		return m;
	}
	@RequestMapping("/adminS.do") //�ɸ��׽�Ʈ ���������� �̵�
	public ModelAndView adminMain2() {
		ModelAndView m = new ModelAndView("admin/a_simte");
		return m;
	}
	@RequestMapping("/adminB.do") //���ǰԽ��� ���������� �̵�
	public ModelAndView adminMain3() {
		ModelAndView m = new ModelAndView("admin/a_board");
		m.addObject("list",dao.qaList());
		return m;
	}
	@RequestMapping("/editTest.do") //�ɸ��׽�Ʈ JSON���� ������������ �̵�
	public ModelAndView editTest() {
		ModelAndView m = new ModelAndView("admin/a_simteEdit");
		return m;
	}
	
	@RequestMapping(value="/getItem.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getItem(String item_key)
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		Map map = new HashMap();
		map.put("item_key", item_key);
		try {
		str = mapper.writeValueAsString(dao.getItem(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
}
