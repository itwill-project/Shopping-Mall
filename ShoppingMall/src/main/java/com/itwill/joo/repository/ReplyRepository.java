package com.itwill.joo.repository;

import java.util.List;

import com.itwill.joo.domain.Reply;

public interface ReplyRepository {
	
	List<Reply> selectByPostId(long r_Id);
	Reply selectById(long id);
	int insert(Reply reply);
	int update(Reply reply);
	int delete(long id);
	
	long selectReplyCountWithPostId(long r_Id);

}
