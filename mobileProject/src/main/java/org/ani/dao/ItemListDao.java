package org.ani.dao;

import java.util.List;
import java.util.Map;

import org.ani.db.ItemListManager;
import org.ani.vo.ItemListVo;
import org.ani.vo.UserItemVo;
import org.springframework.stereotype.Repository;
@Repository
public class ItemListDao {
	
	public List<ItemListVo> list() {
		return ItemListManager.list();
	}

	public ItemListVo detail(ItemListVo vo) {
		return ItemListManager.detail(vo);
	}

	public int insert(ItemListVo v) {
		return ItemListManager.insert(v);
	}

	public int update(ItemListVo v) {
		return ItemListManager.update(v);
	}

	public int delete(Map map) {
		return ItemListManager.delete(map);
	}

	public List<UserItemVo> userItems(Map map) {
		return ItemListManager.userItems(map);
	}

	public int itemBuy(Map map) {
		return ItemListManager.itemBuy(map);
	}

	public int useItem(Map map) {
		return ItemListManager.useItem(map);
	}
	
	public String getP(Map map) {
		return ItemListManager.getP(map);
	}

	public int setItem(Map map) {
		// TODO Auto-generated method stub
		return ItemListManager.setItem(map);
	}

}
