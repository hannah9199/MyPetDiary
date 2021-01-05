package pet.board.image;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.bean.Board;
import pet.common.SuperClass;
import pet.dao.BoardDao;

public class IBModifyController extends SuperClass {
	private Board bean = null;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("IBModifyController START ===============");
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		
		BoardDao dao = new BoardDao();
		
		// 여기서 xxx는 현재 수정하고자 하는 이전에 기입했던 게시물 1건을 의미합니다.
		Board bean = dao.SelectDataByPk(no);
		
		request.setAttribute("bean", bean);
		
		super.doGet(request, response);
		
		String gotopage = "/board/board_image/IBModify.jsp";
		super.goToPage(gotopage);
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		bean = new Board();
		
		bean.setBoard_type(request.getParameter("setboard_type"));
		bean.setContent(request.getParameter("content"));
		bean.setCreated_at(request.getParameter("created_at"));
		bean.setDeleted_at(request.getParameter("deleted_at"));
		bean.setFileName(request.getParameter("file_name"));
		bean.setFilePath(request.getParameter("file_path"));
		bean.setGroup_no(Integer.parseInt(request.getParameter("group_no")));
		bean.setNo(Integer.parseInt(request.getParameter("no")));
		bean.setTitle(request.getParameter("title"));
		bean.setUpdated_at(request.getParameter("updated_at"));
		bean.setWriter(request.getParameter("writer"));
	
		String gotopage = "" ;
		if (this.validate(request) == true) {
			// 유효성 검사 통과
			BoardDao dao = new BoardDao();
			int cnt = -999999;
			cnt = dao.UpdateData(bean);
			
			// request 객체의 내용을 보존하면서 목록 보기 페이지로 넘겨 줍니다.
			new IBListController().doGet(request, response);
			
		} else { // 유효성 검사 실패
			request.setAttribute("bean", bean);
			super.doPost(request, response);
			gotopage = "board/board_image/IBModify.jsp";
			super.goToPage(gotopage);
		}
	}
	@Override
	public boolean validate(HttpServletRequest request) {
		
		boolean isCheck = true;
		
		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "titile", "제목은 3글자 이상 10글자 이하여야 합니다.");
			isCheck = false;
		}
		
		if (bean.getContent().length() < 5 || bean.getContent().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false;
		}
		
		String regex = "\\d{4}[-/]\\d{2}[-/]\\d{2}" ;
		if (bean.getUpdated_at() == null) {
			bean.setUpdated_at("");
		}
		boolean result = Pattern.matches(regex, bean.getUpdated_at());
		if (result == false) {
			request.setAttribute(super.PREFIX + "updated_at", "날짜는 yyyy/MM/dd 또는 yyyy-MM-dd 형식으로 입력해 주세요.");
			isCheck = false;
		}
		
		return isCheck;
	}

}
