package pet.board.image;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.bean.Board;
import pet.common.SuperClass;
import pet.dao.BoardDao;
import pet.util.FlowParameters;
import pet.util.Paging;

public class IBListController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("IBLIstControll START ===============");

		String pageNumber = request.getParameter("pageNumber") != null ? request.getParameter("pageNumber") : "1";
		String pageSize = request.getParameter("pageSize") != null ? request.getParameter("pageSize") : "9";
		
		BoardDao dao = new BoardDao();
		
		FlowParameters parameters 
			= new FlowParameters(
					pageNumber,
					"9",
					request.getParameter("mode"),
					request.getParameter("keyword"));
		
		System.out.println(this.getClass() + " : " + parameters.toString());
		
		int totalCount 
			= dao.SelectTotalCount(
					parameters.getMode(),
					parameters.getKeyword());
		
		String contextPath = request.getContextPath();
		String myurl = contextPath + "/Mypet?command=IBList";
		
		Paging pageInfo
			=new Paging(
					parameters.getPageNumber(),
					parameters.getPageSize(),
					totalCount,
					myurl,
					parameters.getMode(),
					parameters.getKeyword());
		
		List<Board> lists = dao.SelectDataList(
				pageInfo.getBeginRow(),
				pageInfo.getEndRow());
		
		// 바인딩해야 할 목록들
		request.setAttribute("lists", lists);
		System.out.println("목록 : "+ lists);

		//페이징 관련 항목들
		request.setAttribute("pagingHtml", pageInfo.getPagingHtml());
		request.setAttribute("pagingStatus", pageInfo.getPagingStatus());
		
		//검색 필들의 상태 값 저장을 위한 항목들
		request.setAttribute("mode", parameters.getMode());
		request.setAttribute("keyword", parameters.getKeyword());
		
		//상세보기, 수정, 삭제, 답글 등의 링크에 사용될 parameter list 문자열
		request.setAttribute("parameters", parameters.toString());
		
		super.doGet(request, response);
		String gotopage = "/board/board_image/IBList.jsp" ;
		super.goToPage(gotopage);
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		super.doPost(request, response);
		
		String gotopage = "" ;
		if (this.validate(request) == true) {
			gotopage = "" ;
			super.goToPage(gotopage);
			
		}else {
			gotopage = "" ;
			super.goToPage(gotopage);
		}
		
    }
	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true;
		
		return isCheck;
	}

	}
	
	
	

