package org.ani.controller;

import java.io.FileReader;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray; 
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@RequestMapping("/test.do")
	public void test()
	{
	}
	
	@RequestMapping("/matching.do")
	public void matching()
	{
	}
	
	@RequestMapping(value="/testDetail.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String detail(String tablename,HttpServletRequest req)
	{
		
		
		JSONParser parser = new JSONParser();
		String tn=null;
		 
		try {
			String path = req.getRealPath("/resources/json/");
			
			Object obj = parser.parse(new FileReader(path+"/testList.json"));	        					
			
			JSONArray arr = (JSONArray) obj;	
			

			for (int i = 0; i < arr.size();i++) {
				
				JSONObject jsonObject=(JSONObject)arr.get(i);
				if(jsonObject.get(tablename)!=null)
				 tn = jsonObject.get(tablename).toString();
			}
	 
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return tn;

	}
	
	

}
