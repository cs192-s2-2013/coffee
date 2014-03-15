package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.jdbc.MatFolderRowMapper;
import com.bluecoffee.jdbc.MatSubjectRowMapper;

public class MatFolderDaoImpl implements MatFolderDao {

	@Autowired
	DataSource dataSource;


	public List<MatFolder> getMatFolderList() {
		List matFolderList = new ArrayList();

		String sql = "select * from matfolder ";

		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFolderList = jdbcTemplate.query(sql, new MatFolderRowMapper());
		return matFolderList;
	}
	
	@Override
	public int getMatFolderIDbyName(String name){
		MatFolder matFolder = new MatFolder();

		String sql = "select * from matfolder where folderName='"+name+"'";
		
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFolder = jdbcTemplate.query(sql, new MatFolderRowMapper()).get(0);
		
		return matFolder.getMatFolderID();
	}
	
	
}