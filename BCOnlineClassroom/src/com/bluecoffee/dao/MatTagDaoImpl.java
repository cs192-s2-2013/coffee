package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatTag;
import com.bluecoffee.jdbc.MatTagRowMapper;

public class MatTagDaoImpl implements MatTagDao {
	
	@Autowired
	DataSource dataSource;

	@Override
	public void insertData(String matTag){
		String sql = "INSERT INTO mattag (matTag) VALUES (?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, new Object[] {matTag});
		
	}
	
	@Override
	public List<MatTag> getMatTagList(){
		List<MatTag> matTagList = new ArrayList<MatTag>();

		String sql = "SELECT * FROM mattag";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matTagList = jdbcTemplate.query(sql, new MatTagRowMapper());
		
		return matTagList;
	}
	
	@Override
	public int getMatTagID(String matTag){
		
		matTag = matTag.replace("'", "''");
		matTag = matTag.replace("\\", "\\\\");
		
		List<MatTag> matTagList = new ArrayList<MatTag>();
		
		String sql = "SELECT * FROM mattag WHERE matTag='"+matTag+"'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matTagList = jdbcTemplate.query(sql, new MatTagRowMapper());
		
		if(matTagList.size() == 0){ return -1; } //tag not found
		else{ return matTagList.get(0).getMatTagID(); }
	}
	
	@Override
	public MatTag getMatTag(int matTagID){
		List<MatTag> matTagList = new ArrayList<MatTag>();
		
		String sql = "SELECT * FROM mattag WHERE matTagID="+matTagID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matTagList = jdbcTemplate.query(sql, new MatTagRowMapper());
		
		return matTagList.get(0);
	}
}
 