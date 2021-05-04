package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.Board;
import common.JDBCTemplate;

public class BoardService {

	public ArrayList<Board> selectBoarList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int start = 0;
//		ArrayList<Board> list = new BoardDao().selectBoardList(conn,list);
		return null;
	}

}
