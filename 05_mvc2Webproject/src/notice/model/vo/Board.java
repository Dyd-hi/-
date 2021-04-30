package notice.model.vo;

public class Board {
	 private int rnum;
	 private int boardNo;
	 private String boardTitle;
	 private String boardContent;
	 private String boardWrioter;
	 private String boardDate;
	 private String filename;
	 private String filepath;
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Board(int rnum, int boardNo, String boardTitle, String boardContent, String boardWrioter, String boardDate,
			String filename, String filepath) {
		super();
		this.rnum = rnum;
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWrioter = boardWrioter;
		this.boardDate = boardDate;
		this.filename = filename;
		this.filepath = filepath;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getBoardWrioter() {
		return boardWrioter;
	}
	public void setBoardWrioter(String boardWrioter) {
		this.boardWrioter = boardWrioter;
	}
	public String getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(String boardDate) {
		this.boardDate = boardDate;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	 
	 
}
