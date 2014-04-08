package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.FPostag;
import com.bluecoffee.jdbc.FPostagRowMapper;

public class FPostagDaoImpl implements FPostagDao {

	@Autowired DataSource dataSource;	
	
	@Override
	public void insertData(int fPostID, int fTagID){
		
		String sql = "INSERT INTO fpostag (fPostID, fTagID) VALUES (?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, new Object[] {fPostID, fTagID});
		
	}
	
	
	@Override
	public List<FPostag> getFPostagListByPostID(int fPostID){
		
		List<FPostag> fPostagList = new ArrayList<FPostag>();
		
		String sql = "SELECT * FROM fpostag WHERE fPostID="+fPostID;		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostagList = jdbcTemplate.query(sql, new FPostagRowMapper());
		
		return fPostagList;
	}
	
	@Override
	public List<FPostag> getFPostagListByTagID(int fTagID){
		List<FPostag> fPostagList = new ArrayList<FPostag>();
		
		String sql = "SELECT * FROM fpostag WHERE fTagID="+fTagID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fPostagList = jdbcTemplate.query(sql, new FPostagRowMapper());
		
		return fPostagList;
	}
}
 