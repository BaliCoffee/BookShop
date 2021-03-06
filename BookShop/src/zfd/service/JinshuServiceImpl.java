package zfd.service;

import java.util.List;

import zfd.bean.BookInfo;
import zfd.bean.BookJinhuo;
import zfd.dao.JinshuDao;
import zfd.dao.JinshuDaoImpl;

public class JinshuServiceImpl implements JinshuService{
	
	private JinshuDao jinshuDao; 
	
	public void setJinshuDao(JinshuDao jinshuDao) {
		this.jinshuDao = jinshuDao;
	}

	@Override
	public List<BookJinhuo> findAll() {
		return jinshuDao.findAll();
	}

	@Override
	public List<BookJinhuo> find(BookJinhuo bookJinhuo) {
		return jinshuDao.find(bookJinhuo);
	}

	@Override
	public List<BookJinhuo> find(BookJinhuo bookJinhuo, int start, int ronglinag) {
		return jinshuDao.find(bookJinhuo, start, ronglinag);
	}

	@Override
	public void saveOrUpdateBookJinhuo(BookJinhuo bookJinhuo) {
		
		jinshuDao.saveOrUpdateBookJinhuo(bookJinhuo);
		
	}

	@Override
	public List<BookJinhuo> findByBookIdWithAscOrder(BookInfo book) {
		
		
		
		return jinshuDao.findByBookIdWithAscOrder(book);
	}
	
	

}
