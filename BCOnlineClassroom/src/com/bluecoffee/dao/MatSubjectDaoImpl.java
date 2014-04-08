package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatSubject;
import com.bluecoffee.jdbc.MatSubjectRowMapper;

public class MatSubjectDaoImpl implements MatSubjectDao {

	@Autowired DataSource dataSource;

	public List<MatSubject> getMatSubjectList() {
		List<MatSubject> matSubjectList = new ArrayList<MatSubject>();

		String sql = "SELECT * FROM matsubject ";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matSubjectList = jdbcTemplate.query(sql, new MatSubjectRowMapper());
		
		return matSubjectList;
	}
	
	@Override
	public int getMatSubjectIDbyName(String name){
		MatSubject matSubject = new MatSubject();

		String sql = "SELECT * FROM matsubject WHERE subjectName='"+name+"'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matSubject = jdbcTemplate.query(sql, new MatSubjectRowMapper()).get(0);
		
		return matSubject.getMatSubjectID();
	}
	
	
	
/*	@Override
	public void deleteData(String id) {
		String sql = "delete from matfile where matFileID=" + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);

	}

	@Override
	public void updateData(MatFile matFile) {

		String sql = "UPDATE matfile set fileName = ?,fileType = ?, fileSize = ?, uploadDate = ? where matFileID = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);

		jdbcTemplate.update(
				sql,
				new Object[] { matFile.getFileName(), matFile.getFileType(),
						matFile.getFileSize(), matFile.getUploadDate(), matFile.getMatFileID() });

	}

	@Override
	public MatSubject getMatSubject(String id) {
		List<MatSubject> matSubjectList = new ArrayList<MatSubject>();
		String sql = "select * from matsubject where matSubjectID= " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matSubjectList = jdbcTemplate.query(sql, new MatSubjectRowMapper());
		return matSubjectList.get(0);
	}
*/
}
