package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.Chat_ListManager;
import org.ani.vo.Chat_listVo;
import org.ani.vo.UserCustomVo;
import org.springframework.stereotype.Repository;

@Repository
public class Chat_ListDao {

	public List<Chat_listVo> list(Map map) 
	{
		return Chat_ListManager.list(map);
	}
	public List<Chat_listVo> fromMe(Map map) 
	{
		return Chat_ListManager.fromMe(map);
	}

	public Chat_listVo getChat(Map map) 
	{
		return Chat_ListManager.getChat(map);
	}
	public UserCustomVo haveL(Map map) 
	{
		return Chat_ListManager.haveL(map);
	}
	public int delete(Map map) 
	{
		return Chat_ListManager.delete(map);
	}

	public int insert(Chat_listVo vo) 
	{
		return Chat_ListManager.insert(vo);
	}
	public int useChat(Map map) 
	{		
		return Chat_ListManager.useChat(map);
	}

}
