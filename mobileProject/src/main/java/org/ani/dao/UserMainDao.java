package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.UserMainManager;
import org.ani.vo.UserMainVo;
import org.springframework.stereotype.Repository;
@Repository
public class UserMainDao {

	public UserMainVo check(UserMainVo vo) {
		// TODO Auto-generated method stub
		return UserMainManager.check(vo);
	}

	public int update(UserMainVo vo) {
		// TODO Auto-generated method stub
		return UserMainManager.update(vo);
	}
	public int insertUserMain(UserMainVo u,Map map1,Map map2) {
		// TODO Auto-generated method stub
		return UserMainManager.insertUserMain(u,map1,map2);
	}

	public UserMainVo login(Map map) {
		// TODO Auto-generated method stub
		return UserMainManager.login(map);
	}
	public String pwcheck(String id) {
		// TODO Auto-generated method stub
		return UserMainManager.pwcheck(id);
	}
	public UserMainVo id_nic_check(Map map) {
		return UserMainManager.id_nic_check(map);
	}
	public List<String> idcheck(Map map) {
		return UserMainManager.idcheck(map);
	}
	public List<String> getPwd(Map map) {
		return UserMainManager.getPwd(map);
	}

	public int bye(Map map) {
		// TODO Auto-generated method stub
		return UserMainManager.bye(map);
	}

	public UserMainVo getUser(UserMainVo vo) {
		// TODO Auto-generated method stub
		return UserMainManager.getUser(vo);
	}
	
	
}
