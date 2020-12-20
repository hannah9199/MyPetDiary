package pet.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pet.bean.Member;
import pet.common.SuperClass;
import pet.dao.MemberDao;

public class MemberModifyController extends SuperClass {
	private Member bean = null;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mID = request.getParameter("id");
		
		MemberDao mdao = new MemberDao();
		Member bean = mdao.selectDataByID(mID);
		super.doGet(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
	
}
