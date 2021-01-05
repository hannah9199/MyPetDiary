package pet.board.image;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import pet.bean.Board;
import pet.bean.Member;
import pet.common.SuperClass;
import pet.dao.BoardDao;


public class IBWriteController extends SuperClass {
	private Board bean = null;
	
	//업로드가 되는 실제 경로
	private String uploadedPath = null; 

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);

		String gotpage = "board/board_image/IBWrite.jsp";
		super.goToPage(gotpage);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		MultipartRequest multRequest = null;   // 멀티파트 데이터를 받기 위한 전용 객체 선언
 		
 		
 		// 업로드 될 파일의 최대 사이즈 (10메가)
		int sizeLimit = 10 * 1024 * 1024;
		// 파일이 업로드될 실제 tomcat 폴더의 경로 (WebContent 기준)
		String savePath = request.getRealPath("/upload");
		System.out.println("savePath : " + savePath);
		try {
			// MultipartRequest 객체를 생성하면 파일 업로드 수행
			multRequest = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());	
			// 파일 이름 추출 
			String filename = multRequest.getFilesystemName("imageFile");
			String title = multRequest.getParameter("title");
			String content = multRequest.getParameter("content");
			
			Member login = (Member)super.session.getAttribute("loginfo");
			
			bean = new Board();
			bean.setBoard_type("이미지");	// 게시글 타입 
			bean.setWriter(login.getId());	// 작성자 
			bean.setTitle(title);	// 제목 
			bean.setFileName(filename); // 파일이름 
			bean.setFilePath(savePath); // 파일경로 
			bean.setContent(content);// 글 내용 
			
			BoardDao dao = new BoardDao();
			int cnt = -999999;
			cnt = dao.upload(bean);	// cnt 결과값에 따른 메세지 처리 해야함 
			
			super.doGet(request, response);
			
			new IBListController().doGet(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

	}

	@Override
	public boolean validate(HttpServletRequest request) {
		final String PREFIX = "err";
		boolean isCheck = true;

		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(PREFIX + "title", "제목은 3글자 이상 10글자 이하이어야 합니다.");
			isCheck = false;
		}

		if (bean.getContent().length() < 5 || bean.getContent().length() > 30) {
			request.setAttribute(PREFIX + "content", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false;
		}
		String regex = "\\d{4}[-/]\\d{2}[-/]\\d{2}";
		if (bean.getCreated_at() == null) {
			bean.setCreated_at("");
		}
		boolean result = Pattern.matches(regex, bean.getCreated_at());
		if (result == false) {
			request.setAttribute(PREFIX + "created_at", "날짜는 yyyy/MM/dd 또는 yyyy-MM-dd 형식으로 입력해 주세요.");
			isCheck = false;
		}

		return isCheck;          
	}

	public String getFileName(Part filePart) {
		for (String filePartData : filePart.getHeader("Content-Disposition").split(";")) {
			System.out.println(filePartData);
			if (filePartData.trim().startsWith("filename")) {
				return filePartData.substring(filePartData.indexOf("=") + 1).trim().replace("\"", "");
			}
		}

		return null;
	}

}
