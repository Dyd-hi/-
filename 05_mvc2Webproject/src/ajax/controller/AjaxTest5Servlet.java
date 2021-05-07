package ajax.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class AjaxTest5Servlet
 */
@WebServlet(name = "AjaxTest5", urlPatterns = { "/ajaxTest5" })
public class AjaxTest5Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxTest5Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.인코딩
		request.setCharacterEncoding("utf-8");
		//2.값추출
		String memberId = request.getParameter("memberId");
		//3.비즈니스 로직
		Member m = new MemberService().selectOneMember(memberId);
		JSONObject result = null;
		if(m != null) {
			result = new JSONObject(); //자바스크립트 객체스타일로 바꿔주는 과정
			result.put("memberNo", m.getMemberNo());
			result.put("memberId", m.getMemberId());
			result.put("memberName1", m.getMemberName()); //한글을 인코딩 안한경우
			result.put("memberName2", URLEncoder.encode(m.getMemberName(),"UTF-8")); //한글 처리를 위한 인코딩
		}
		response.setContentType("application/json"); //되돌려주는 데이터의 타입이 json임을 명시
		PrintWriter out = response.getWriter();
		out.print(result);
		out.flush();//버퍼링 되어 아직 기록되지 않는 데이터를 출력스트림으로 모두 출력
		out.close();//출력되지 않은 데이터가 있으면 출력하고 스트림 종료
		//4.결과처리
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
