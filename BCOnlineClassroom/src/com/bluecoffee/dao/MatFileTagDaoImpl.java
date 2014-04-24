package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatFileTag;
import com.bluecoffee.jdbc.MatFileTagRowMapper;

public class MatFileTagDaoImpl implements MatFileTagDao {

	@Autowired DataSource dataSource;	
	
	@Override
	public void insertData(int matFileID, int matTagID){
		
		String sql = "INSERT INTO matfiletag (matFileID, matTagID) VALUES (?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql, new Object[] {matFileID, matTagID});
		
	}
	
	
	@Override
	public List<MatFileTag> getMatFileTagListByFileID(int matFileID){
		
		List<MatFileTag> matFileTagList = new ArrayList<MatFileTag>();
		
		String sql = "SELECT * FROM matfiletag WHERE matFileID="+matFileID;		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileTagList = jdbcTemplate.query(sql, new MatFileTagRowMapper());
		
		return matFileTagList;
	}
	
	@Override
	public List<MatFileTag> getMatFileTagListByTagID(int matTagID){
		List<MatFileTag> matFileTagList = new ArrayList<MatFileTag>();
		
		String sql = "SELECT * FROM matfiletag WHERE matTagID="+matTagID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileTagList = jdbcTemplate.query(sql, new MatFileTagRowMapper());
		
		return matFileTagList;
	}
}
 