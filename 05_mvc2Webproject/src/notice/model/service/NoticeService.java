package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.Notice;
import notice.model.vo.NoticePageData;



public class NoticeService {

	public NoticePageData selectNoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		//1.한페이지에 게시물을 몇개 보여줄지 : 한페이지당 10개씩 보여줌
		int numPerPage = 10;
		//reqPage를 통해서 게시물 시작 rnum 끝 rnum 계산
		//1 -> start : 1, end : 10, 2-> start : 11, end: 20,3 -> start : 21, end : 30
		int end = reqPage * numPerPage;
		int start = end - numPerPage + 1;
		NoticeDao dao = new NoticeDao();
		ArrayList<Notice> list = dao.selectNoticeList(conn , start , end);
		//페이지 네비게이션 제작
		//1) 전체 페이지수를 구해야함 80/10
		int totalCount = dao.totalCount(conn);
		//전체 페이지 수 계산
		int totalPage = 0;
		if(totalCount%numPerPage == 0) {
			totalPage = totalCount/numPerPage;
		}else {
			totalPage = totalCount/numPerPage+1;
		}
		//페이지 네비 길이지정
		int pageNaviSize = 5;
		//1~5페이지 요청시 페이지 네비 시작번호 : 1
		//6~10패이지 요청시 페이지 네비 시작번호 : 6
		//11~15패이지 요청시 페이지 네비 시작번호 : 11
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//페이지네비 시작
		String pageNavi = "<ul class='pagination pagination-lg'>";
		//페이지네비 시작번호가 1이 아닌경우는 이전버튼 생성
		if(pageNo != 1) {
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/noticeList?reqPage="+(pageNo-1)+"'>&lt;</a></li>"; //%lt '<' 이전모양 기호 
		}
		//페이지 숫자 생성
		for(int i=0;i<pageNaviSize;i++) {
			if(pageNo == reqPage) { //현재보는 페이지를 부각시키기위한 코드
				pageNavi += "<li class='page-item active'>";
				pageNavi += "<a class='page-link' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a></li>";	
			}else {
				pageNavi += "<li class='page-item'>";
				pageNavi += "<a class='page-link' href='/noticeList?reqPage="+pageNo+"'>"+pageNo+"</a></li>";
			}
			pageNo++;
			if(pageNo > totalPage) {
				break;
			}	
		}
		//다음버튼 생성
		if(pageNo <= totalPage) { //현재 페이지넘버 보다 토탈페이지가 높으면 다음버튼을 생성함
			pageNavi += "<li class='page-item'>";
			pageNavi += "<a class='page-link' href='/noticeList?reqPage="+(pageNo)+"'>&gt;</a></li>"; //%gt '>' 이전모양 기호 	
		}
		pageNavi += "</ul>";
		JDBCTemplate.close(conn);
		NoticePageData npd = new NoticePageData(list,pageNavi);
		return npd;
	}

	

	

}
