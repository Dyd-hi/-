package photo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import photo.model.dao.PhotoDao;
import photo.model.vo.Photo;

public class PhotoService {

	public int totalCount() {
		Connection conn = JDBCTemplate.getConnection();
		int totalCount = new PhotoDao().totalCount(conn);
		JDBCTemplate.close(conn);
		
		return totalCount;
	}

	public int insertPhoto(Photo p) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new PhotoDao().insertPhoto(conn,p);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		
		return result;
	}

	public ArrayList<Photo> morePhoto(int start) {
		Connection conn = JDBCTemplate.getConnection();
		int length = 5; //더보기 한번당 추가로 가져올 갯수
		int end = start+length-1;
		ArrayList<Photo> list = new PhotoDao().morePhoto(conn,start,end);
		JDBCTemplate.close(conn);
		return list;
	}

}
