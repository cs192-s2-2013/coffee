package com.bluecoffee.dao;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.bluecoffee.domain.FCategory;
import com.bluecoffee.jdbc.FCategoryRowMapper;

public class FCategoryDaoImpl implements FCategoryDao {

	@Autowired
	DataSource dataSource;
	
	@Override
	public void insertCategory(FCategory fCategory){
		String sql = "INSERT INTO fcategory (category) VALUES (?)";
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(
				sql,
				new Object[] { fCategory.getFCategory() });	
	}
	
	public void deleteCategory(int fCategoryID){
		String sql = "DELETE FROM fcategory WHERE fcategoryID = " + fCategoryID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		jdbcTemplate.update(sql);
	}
	
	public String getCategoryByID(int fCategoryID){
		List<FCategory> fCategoryList = new ArrayList<FCategory>();
		String sql = "SELECT fcategoryID, category FROM fcategory WHERE fcategoryID = " + fCategoryID;
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		fCategoryList = jdbcTemplate.query(sql, new FCategoryRowMapper());
		
		return fCategoryList.get(0).getFCategory();
	}
	
}