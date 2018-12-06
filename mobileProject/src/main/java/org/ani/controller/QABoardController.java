package org.ani.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ani.dao.QABoardDao;
import org.ani.vo.QABoardVo;
import org.ani.vo.UserMainVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class QABoardController {
	
	@Autowired 
	private QABoardDao dao;
	
	@RequestMapping("/boardList.do")
	public void board(){}

	@RequestMapping(value="/qaBoardList.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String listBoard(HttpSession s)
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		Map map = new HashMap();
		map.put("id", v.getId());
		try {
		str = mapper.writeValueAsString(dao.list(map));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	
	@RequestMapping(value="/qaBoardDetail.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String getBoard(int bno)
	{
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
		str = mapper.writeValueAsString(dao.getBoard(bno));
		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
		return str;
	}
	@RequestMapping(value="/qaBoardInsert.do", method=RequestMethod.POST,produces="text/plain;charset=utf-8")
	@ResponseBody
	public String insertOk(MultipartHttpServletRequest multi, HttpSession s) throws Exception
	{	QABoardVo vo = new QABoardVo();
		String str="";
		String path = multi.getSession().getServletContext().getRealPath("resources/upload");
		System.out.println("path:"+path);
		String filename="";
		vo.setFilename("파일이 없습니다.");
		File dir = new File(path);
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		Iterator<String> files=multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile=files.next();
			MultipartFile mf=multi.getFile(uploadFile);
			String fileName=mf.getOriginalFilename();
			filename=System.currentTimeMillis()+"."+fileName.substring(filename.lastIndexOf(".")+1);
			vo.setFilename(fileName);
			try {
				mf.transferTo(new File(path+filename));
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		vo.setBno(dao.getNextNo());
		vo.setId(((UserMainVo)s.getAttribute("user")).getId());
		vo.setState("처리중");//처음엔 처리중, 관리자가 답변달면 처리완료라고 바꿔야함 
		vo.setCategory(multi.getParameter("category"));
		vo.setContent(multi.getParameter("content"));
		vo.setTitle(multi.getParameter("title"));
		
		int re = dao.insert(vo);
		if(re>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	
	@RequestMapping(value="/qaBoardUpdate.do", method=RequestMethod.POST, produces="text/plain;charset=utf-8")
	@ResponseBody
	public String updateOk(MultipartHttpServletRequest multi,HttpSession s) throws Exception
	{	
		
		QABoardVo vo = new QABoardVo();
		String str="";
		String path = multi.getSession().getServletContext().getRealPath("resources/upload/");
		System.out.println("path:"+path);
		String oldFname=(dao.getBoard(Integer.parseInt(multi.getParameter("bno")))).getFilename();
		vo.setFilename(oldFname);
		Iterator<String> files=multi.getFileNames();
		while(files.hasNext()) { //파일 수정한 경우
			try {
				MultipartFile uploadFile=multi.getFile(files.next());
				String fname=uploadFile.getOriginalFilename();
				vo.setFilename(fname);
				FileOutputStream fos = new FileOutputStream(path + "/"+ fname); //파일을 추가할 스트림 생성
				fos.write(uploadFile.getBytes()); //파일 추가
				fos.close();
			}catch (Exception e) {
				// TODO: handle exception
				System.out.println(e.getMessage());
			}
		}
		
		if(!vo.getFilename().equals(oldFname)) { //첨부파일이 바뀐경우 전 파일 삭제
			File df = new File(path+"/"+oldFname);
			df.delete();
		}
		UserMainVo v = (UserMainVo)s.getAttribute("user");
		
		vo.setBno(Integer.parseInt(multi.getParameter("bno")));
		vo.setId(v.getId());
		vo.setState("처리중");//처리완료여도 수정했으면 다시 처리중, 관리자가 답변달면 처리완료라고 바꿔야함 
		vo.setCategory(multi.getParameter("category"));
		vo.setContent(multi.getParameter("content"));
		vo.setTitle(multi.getParameter("title"));
		
		int re = dao.update(vo);
		if(re>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}
	@RequestMapping(value="/qaBoardDelete.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String delete(int bno)
	{
		String str="";
		Map map = new HashMap();
		map.put("bno", bno);
		int re = dao.delete(map);
		if(re>0) {
			str="SUCCESS";
		}else {
			str="FAIL";
		}
		return str;
	}	
	
	
}
