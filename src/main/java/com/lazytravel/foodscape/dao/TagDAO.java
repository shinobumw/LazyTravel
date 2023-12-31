package com.lazytravel.foodscape.dao;

import java.util.List;
import com.lazytravel.foodscape.entity.Tag;

public interface TagDAO {
	void add(Tag tag);
	
	void update(Tag tag);
	
	//int delete(Integer tagId);
	
	Tag getByPK(Integer tagId);
	
	List<Tag> getAll();
	
	List<Tag> getAll(int currentPage);
	

}
