package org.ani.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.ani.dao.TestR_listDao;
import org.ani.vo.TestR_listVo;
import org.ani.vo.UserMainVo;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.rcaller.rStuff.RCaller;
import com.github.rcaller.rStuff.RCode;

@Controller
public class BigdataController {

	@RequestMapping(value="/wordCloud.do", produces="text/plain;charset=utf-8")
	@ResponseBody
	public String createCSV(HttpSession s, HttpServletRequest req) //������� ��������� ��� csv����
	{
		String fname="";
		//json���� �о����
		JSONParser parser = new JSONParser();
		JSONObject resultJ=null;
		
		try {
			String path = req.getRealPath("resources/json");
			Object obj = parser.parse(new FileReader(path+"/testList.json"));	        					
			
			JSONArray arr = (JSONArray) obj;	//���̽������� ������ ���̽����·� ����
			
			UserMainVo v = (UserMainVo)s.getAttribute("user");
			Map map = new HashMap();
			map.put("id", v.getId());
			List<TestR_listVo> resultList = (new TestR_listDao()).list(map);
			String filename=v.getId()+"_result.csv"; //������� ���̵� �� csv���� ����
			
			//������� csv������ ����
			BufferedWriter fw = new BufferedWriter(new FileWriter("c:/r_temp/"+filename,true)); 
			
			for(TestR_listVo one : resultList) { //�Ѱ������ r1�� ������ csv�������ϱ� ���� �ݺ���
				for (int i = 0; i < arr.size();i++) { //���̽���ü�� ���� ���� �ݺ���
					JSONObject jsonObject = (JSONObject)arr.get(i); //������ ���ʷ� {���̺�� : {}}�ϳ� �����ͼ� ����
					if(jsonObject.get(one.getTestTable_name())!=null) { //���̺���� �����ϸ�
						resultJ = (JSONObject)jsonObject.get(one.getTestTable_name()); //�� ���̺���� json������
						String result = resultJ.get(one.getResult()).toString(); //������� (~�������� ���!)
						fw.write(result);
						fw.newLine();
						
					}
				}
			}
			
			fw.flush();
			fw.close();
			
			System.out.println("�н� : "+path);
			
	//--------------------------------------�ð�ȭ�� ���� R ����--------------------------------------------
			RCaller caller = new RCaller();
			caller.setRscriptExecutable("C:\\Program Files\\R\\R-3.5.1\\bin\\x64\\Rscript.exe");
			
			RCode code = new RCode();
			code.clear();		
			
			File file;			
			file = code.startPlot();			
			
			code.addRCode("setwd('c:/r_temp')");
			code.addRCode("library(KoNLP)");
			code.addRCode("library(wordcloud)");
			code.addRCode("useSejongDic()");			
			code.addRCode("data1 <- readLines('"+filename+"')");
			code.addRCode("data2 <- sapply(data1,extractNoun,USE.NAMES=F)");
			code.addRCode("data3 <- unlist(data2)");
			code.addRCode("data3 <- gsub('\t','',data3)");
			code.addRCode("data3 <- gsub('���','',data3)");
			code.addRCode("data3 <- gsub('���','',data3)");
			code.addRCode("data3 <- gsub('���','',data3)");
			code.addRCode("data3 <- gsub('Ÿ��','',data3)");
			code.addRCode("data3 <- gsub('����','',data3)");
			code.addRCode("data3 <- gsub('GA','',data3)");
			code.addRCode("data3 <- gsub('OV','',data3)");
			code.addRCode("data3 <- gsub('OVE','',data3)");
			code.addRCode("data3 <- gsub('GAM','',data3)");
			code.addRCode("data3 <- gsub('��Ÿ��','',data3)");
			/*code.addRCode("data3 <- gsub('\\d+','',data3)"); 
			code.addRCode("data3 <- gsub('\\(','',data3)");
			code.addRCode("data3 <- gsub('\\)','',data3)");
			code.addRCode("data3 <- gsub('\\[','',data3)");
			code.addRCode("data3 <- gsub('\\]','',data3)");*/
			code.addRCode("data3 <- gsub('','',data3)");
			code.addRCode("data3 <- gsub(',','',data3)");
			code.addRCode("data3 <- Filter(function(x) {nchar(x) >= 2} ,data3)");
			code.addRCode("write(unlist(data3),'"+filename+"')");
			code.addRCode("data4 <- read.table('"+filename+"')");
			code.addRCode("library(RColorBrewer)");
			code.addRCode("wordcount = table(data4)");
			code.addRCode("palete <- brewer.pal(8,'Dark2')");
			code.addRCode("wordcloud(names(wordcount),freq=wordcount,scale=c(5,1),rot.per=0.1,min.freq=1,random.order=F,random.color=T,colors=palete)");
			
			code.endPlot();
			
			caller.setRCode(code);
			caller.runOnly();
			
			fname= file.getName();
			
			FileInputStream fis = new FileInputStream(file);
			FileOutputStream fos = new FileOutputStream(path + "/" + fname);
			FileCopyUtils.copy(fis, fos);
			fis.close();
			fos.close();
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return fname;
	}

}
