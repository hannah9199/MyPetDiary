package pet.board.image;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.bean.Board;
import pet.bean.Member;
import pet.common.SuperClass;
import pet.dao.BoardDao;
import pet.util.FlowParameters;

public class IBDetailViewController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("IBDetailViewController START ===========");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDao dao = new BoardDao();
		
		Board bean = dao.SelectDataByPk(no);
		
		System.out.println("ok");
		FlowParameters parameters 
			= new FlowParameters(
					request.getParameter("pageNumber"), 
					request.getParameter("pageSize"), 
					request.getParameter("mode"),
					request.getParameter("keyword"));
		
		System.out.println(this.getClass() + " : " + parameters.toString());
		
		super.doGet(request, response);
		
		request.setAttribute("bean", bean);
		request.setAttribute("parameters", parameters.toString());
		
		//상세 보기 페이지로 이동 
		String gotopage = "board/board_image/IBDetailView.jsp";
		super.goToPage(gotopage);
		
		
		
//		if (bean != null) {
//			
//			Member login = (Member)super.session.getAttribute("loginfo");
//			
//			if (!bean.getWriter().equals(login.getId())) {
//				dao.UpdateReadhit(no);
//			}
//				request.setAttribute("bean", bean);
//				request.setAttribute("parameters", parameters.toString());
//				
//				//상세 보기 페이지로 이동 
//				String gotopage = "/board/IBDetailView.jsp";
//				super.goToPage(gotopage);
//			
//		} else {
//				
//			new IBListController().doGet(request, response);
//		}
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		super.doPost(request, response);
		
		String gotopage = "";
		if (this.validate(request) == true) {
			gotopage = "";
			super.goToPage(gotopage);
		} else {
			gotopage = "";
			super.goToPage(gotopage);
		}
	}
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true;
		return isCheck;
	}
}
		
	


