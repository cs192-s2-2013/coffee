package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.MatFile;
import com.bluecoffee.jdbc.MatFileRowMapper;

public class MatFileDaoImpl implements MatFileDao {

	@Autowired DataSource dataSource;

	public void insertData(MatFile matFile) {

		String sql = "INSERT INTO matfile "
				+ "(fileName, fileType, fileSize, uploadDate, path, matSubjectID, matFolderID, userID) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { matFile.getFileName(), matFile.getFileType(),
						matFile.getFileSize(), matFile.getUploadDate(), matFile.getPath(),
						matFile.getMatSubjectID(), matFile.getMatFolderID(), matFile.getUserID()});

	}

	public List<MatFile> getMatFileList() {
		List<MatFile> matFileList = new ArrayList<MatFile>();

		String sql = "SELECT * FROM matfile";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList;
	}

	@Override
	public void deleteData(int id) {
		String sql = "DELETE FROM matfile WHERE matFileID=" + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}

	@Override
	public void updateData(MatFile matFile) {

		String sql = "UPDATE matfile SET fileName = ?,fileType = ?, fileSize = ?, uploadDate = ?, path = ? where matFileID = ?";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { matFile.getFileName(), matFile.getFileType(),
						matFile.getFileSize(), matFile.getUploadDate(), matFile.getPath(), matFile.getMatFileID() });
	
	}

	@Override
	public MatFile getMatFile(int id) {
		List<MatFile> matFileList = new ArrayList<MatFile>();
		
		String sql = "SELECT * FROM matfile WHERE matFileID= " + id;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList.get(0);
	}
	
	public List<MatFile> getMatFileListBySubjectName(String subjectName) {
		subjectName = subjectName.replace("'","''");
		subjectName = subjectName.replace("\\", "\\\\");
		
		List<MatFile> matFileList = new ArrayList<MatFile>();

		String sql = "SELECT matFileID, fileName, fileType, fileSize, uploadDate, path, matSubjectID, matFolderID, userID"
				+ " FROM matfile NATURAL JOIN matsubject WHERE subjectName='"+subjectName+"'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList;
	}

	public List<MatFile> getMatFileListBySubjectFolder(String subjectName, int matFolderID) {
		
		subjectName = subjectName.replace("'","''");
		subjectName = subjectName.replace("\\", "\\\\");
		
		List<MatFile> matFileList = new ArrayList<MatFile>();

		String sql = "SELECT matFileID, fileName, fileType, fileSize, uploadDate, path, matSubjectID, matFolderID, userID"
				+ " FROM matfile NATURAL JOIN matsubject WHERE subjectName='"+subjectName+"' AND matFolderID="+matFolderID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList;
	}
	
	public List<MatFile> getMatFileListByFilename(String filename){
		filename = filename.replace("'","''");
		filename = filename.replace("\\", "\\\\");
		
		List<MatFile> matFileList = new ArrayList<MatFile>();
		
		String sql = "SELECT * FROM matfile WHERE filename LIKE '%" +filename+ "%'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList;
	}
	
	public List<MatFile> getMatFileListByDescription(String searchString){
		searchString = searchString.replace("'","''");
		searchString = searchString.replace("\\", "\\\\");
		
		List<MatFile> matFileList = new ArrayList<MatFile>();
		
		String sql = "SELECT * FROM matfile WHERE fileDesc LIKE '%" +searchString+ "%'";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		matFileList = jdbcTemplate.query(sql, new MatFileRowMapper());
		
		return matFileList;
	}
}
