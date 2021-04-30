package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.BoardDao;
import notice.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectBoarList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
//		ArrayList<Board> list = new BoardDao().selectBoardList(conn,list);
		return null;
	}

}
