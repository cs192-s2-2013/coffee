package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.FTag;
import com.bluecoffee.domain.FPost;
import com.bluecoffee.jdbc.FTagRowMapper;
import com.bluecoffee.jdbc.FPostRowMapper;

public class FTagDaoImpl implements FTagDao {
	
	@Autowired
	DataSource dataSource;

	@Override
	public void insertData(String tag){
		String sql = "INSERT INTO ftag "
				+ "(tag) VALUES (?)";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] {tag});
		
	}
	
	@Override
	public List<FTag> getFTagList(){
		List fTagList = new ArrayList();

		String sql = "select * from ftag";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fTagList = jdbcTemplate.query(sql, new FTagRowMapper());
		return fTagList;
	}
	
	@Override
	public int getFTagID(String tag){
		
		List<FTag> fTagList = new ArrayList();
		
		String sql = "select * from ftag where tag='"+tag+"'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fTagList = jdbcTemplate.query(sql, new FTagRowMapper());
		
		if(fTagList.size() == 0){ //tag not found
			return -1;
		}
		else{
			return fTagList.get(0).getFTagID();
		}
	}
	
	@Override
	public FTag getFTag(int fTagID){
		List<FTag> fTagList = new ArrayList();
		
		String sql = "select * from ftag where fTagID="+fTagID;
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fTagList = jdbcTemplate.query(sql, new FTagRowMapper());
		
		return fTagList.get(0);
		
	}
}
 