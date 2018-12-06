package org.ani.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.ani.db.QABoardManager;
import org.ani.vo.QABoardVo;
import org.springframework.stereotype.Repository;
@Repository
public class QABoardDao {

	public List<QABoardVo> list(Map map)
	{
		return QABoardManager.list(map);
	}
	public QABoardVo getBoard(int bno)
	{
		return QABoardManager.getBoard(bno);
	}
	public int getNextNo()
	{
		return QABoardManager.getNextNo();
	}
	public int insert(QABoardVo vo)
	{
		return QABoardManager.insert(vo);
	}
	public int update(QABoardVo vo)
	{
		return QABoardManager.update(vo);
	}
	public int delete(Map map)
	{
		return QABoardManager.delete(map);
	}
	public int updateStep(Map map)
	{
		return QABoardManager.updateStep(map);
	}
	
}
