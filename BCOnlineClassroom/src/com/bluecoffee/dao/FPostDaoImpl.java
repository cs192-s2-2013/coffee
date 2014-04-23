package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.FPost;
import com.bluecoffee.jdbc.FPostRowMapper;

public class FPostDaoImpl implements FPostDao {

	@Autowired DataSource dataSource;

	@Override
	public void insertData(FPost fpost){
		
		String sql = "INSERT INTO fpost (title, content, commentCount, postDate, userID) VALUES (?, ?, ?, ?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { fpost.getTitle(), fpost.getContent(), fpost.getCommentCount(), fpost.getPostDate(), fpost.getUserID()});
	}
	
	@Override
	public void deleteData(int fPostID){
		String sql = "DELETE FROM fpost WHERE fPostID="+fPostID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}
	
	@Override
	public FPost getFPostByID(int fPostID){
		List<FPost> fPostList = new ArrayList<FPost>();

		String sql = "SELECT * FROM fpost WHERE fPostID=" + fPostID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostList = jdbcTemplate.query(sql, new FPostRowMapper());
		
		return fPostList.get(0);
	}

	@Override
	public int getIDByFPost(FPost fPost){
		List<FPost> fPostList = new ArrayList<FPost>();
		
		String title = fPost.getTitle().replace("'", "''");
		title = title.replace("\\", "\\\\");
		String content = fPost.getContent().replace("'", "''");
		content = fPost.getContent().replace("\\", "\\\\");
		
		String sql = "SELECT * FROM fpost WHERE title='"+title+ "' AND content='" +content+ "'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostList = jdbcTemplate.query(sql, new FPostRowMapper());
		
		return fPostList.get(0).getFPostID();
	}
	
	@Override
	public List<FPost> getFPostByCategory(int fCategoryID){
		List<FPost> fPostList = new ArrayList<FPost>();
		
		String sql = "SELECT * FROM fpost WHERE fcategoryID =" + fCategoryID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostList = jdbcTemplate.query(sql, new FPostRowMapper());
		
		return fPostList;
	}
	
	@Override
	public List<FPost> getFPostList(){
		List<FPost> fPostList = new ArrayList<FPost>();

		String sql = "SELECT * FROM fpost";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostList = jdbcTemplate.query(sql, new FPostRowMapper());
		
		return fPostList;		
	}
	
	@Override
	public void updateCommentCount(int fPostID, int newCount){
		
		String sql = "UPDATE fpost SET commentCount=" +newCount
				+" WHERE fPostID="+fPostID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);	
	}

}