package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.FComment;
import com.bluecoffee.domain.FPost;
import com.bluecoffee.jdbc.FCommentRowMapper;
import com.bluecoffee.jdbc.FPostRowMapper;

public class FCommentDaoImpl implements FCommentDao {

	@Autowired
	DataSource dataSource;

	public void insertData(FComment fcomment){
		String sql = "INSERT INTO fcomment "
				+ "(content, commentDate, fPostID, userID) VALUES (?, ?, ?, ?)";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { fcomment.getContent(), fcomment.getCommentDate(), fcomment.getFPostID(), fcomment.getUserID()});
		
	}

	public List<FComment> getFCommentList(){
		List fCommentList = new ArrayList();

		String sql = "select * from fcomment";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fCommentList = jdbcTemplate.query(sql, new FCommentRowMapper());
		return fCommentList;		
	}
	
	public List<FComment> getFCommentListByFPostID(int fPostID){
		List<FComment> fCommentList = new ArrayList();

		String sql = "select * from fcomment where fPostID = " + fPostID;

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fCommentList = jdbcTemplate.query(sql, new FCommentRowMapper());
		return fCommentList;		
	}
}