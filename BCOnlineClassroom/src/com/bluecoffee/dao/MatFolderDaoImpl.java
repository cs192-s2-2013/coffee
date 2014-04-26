package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatFolder;
import com.bluecoffee.jdbc.MatFolderRowMapper;

public class MatFolderDaoImpl implements MatFolderDao {

	@Autowired DataSource dataSource;

	public List<MatFolder> getMatFolderList() {
		List<MatFolder> matFolderList = new ArrayList<MatFolder>();

		String sql = "SELECT * FROM matfolder ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFolderList = jdbcTemplate.query(sql, new MatFolderRowMapper());
		
		return matFolderList;
	}
	
	@Override
	public int getMatFolderIDbyName(String name){
		MatFolder matFolder = new MatFolder();

		String sql = "SELECT * FROM matfolder WHERE folderName='"+name+"'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFolder = jdbcTemplate.query(sql, new MatFolderRowMapper()).get(0);
		
		return matFolder.getMatFolderID();
	}
	
	@Override
	public void insertFolder(MatFolder matFolder){
		String sql = "INSERT INTO matfolder (folderName) VALUES (?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { matFolder.getFolderName() });	
	}
	
	@Override
	public void deleteFolder(int matFolderID){
		String sql = "DELETE FROM matfolder WHERE matFolderID = " + matFolderID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}
	
	/*public void deleteFolder(int id){
		String sql = "delete from matfolder where matFolderID=" + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}*/
}