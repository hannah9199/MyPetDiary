package pet.board.image;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.bean.Board;
import pet.common.SuperClass;
import pet.dao.BoardDao;


public class IBCommentController extends SuperClass {
	private Board bean = null;
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		bean.setContent(request.getParameter(""));
		bean.setUpdated_at(request.getParameter(""));
		bean.setTitle(request.getParameter(""));
		bean.setWriter(request.getParameter(""));
		
		int group_no = Integer.parseInt(request.getParameter("group_no"));
		bean.setGroup_no(group_no);
		
		int order_no = Integer.parseInt(request.getParameter("order_no"));
		bean.setOrder_no(order_no + 1);
		
		int depth = Integer.parseInt(request.getParameter("depth"));
		bean.setDepth(depth + 1);
		
		String gotopage = "";
		
		if (this.validate(request) ==  true) {
			BoardDao dao = new BoardDao();
			int cnt = -999999;
			cnt = dao.ReplyData(bean, group_no, order_no);
			
			new IBListController().doGet(request, response);
		} else {
			request.setAttribute("bean", bean);
			super.doPost(request, response);
			gotopage = ".board/_image/IBReply.jsp";
			super.goToPage(gotopage);
		}
	}
		
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true;
		
		if(bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "title", "제목은 3글자 이상 10글자 이하이어야 합니다.");
			isCheck = false;
		}
		
		if(bean.getContent().length() < 5 || bean.getContent().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false;
		}
		
		String regex = "\\d{4}[-/]\\d{2}[-/]\\d{2}" ;
		if(bean.getUpdated_at() == null) {
			bean.setUpdated_at("");
		}
		boolean result = Pattern.matches(regex, bean.getUpdated_at());
		if(result == false) {
			request.setAttribute(super.PREFIX + "updated_at", "날짜는 yyyy/MM/dd 또는 yyyy-MM-dd 형식으로 입력해 주세요." );
			isCheck = false;
		}
		return isCheck;
		
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		super.doGet(request, response);
		
		String gotopage = ".board/_image/IBReply.jsp";
		super.goToPage(gotopage);
	}
  

}
