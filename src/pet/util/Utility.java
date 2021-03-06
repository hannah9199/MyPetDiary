package pet.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import pet.common.SuperController;

public class Utility {
	public static MultipartRequest getMultiPartRequest(HttpServletRequest request, String uploadedPath) {
		//파일 업로드를 위한 MultipartRequest 객체를 구해주는 static 메소드		
		
		String encType = "UTF-8"; //문자열 인코딩
		int sizeLimit = 20 * 1024 * 1024; //업로드 허용 최대 사이즈
		MultipartRequest multi = null; //파일 업로드 객체
		
		try {
			multi = new MultipartRequest(request, uploadedPath, sizeLimit,
					encType, new DefaultFileRenamePolicy());	
			
		} catch (IOException e) {
			multi = null;
			e.printStackTrace();
		}		
		
		return multi;
	}
	
	// command.txt 파일을 읽어서 스트림을 이용하여 Properties 객체에 데이터 추가
	
	public static Map<String, SuperController> getActionMapList(String todolist) {
		Properties prop = new Properties();
		FileInputStream fis = null;
		
		Map<String, SuperController> mapdata = new HashMap<String, SuperController>();
		
		try {
			fis = new FileInputStream(todolist);
			prop.load(fis);
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(fis != null) {fis.close();}
				
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		// 현재까지 커맨드 이름을 key로 해당 클래스 문자열을 value로 저장한 상태
		System.out.println("prop.toString() : " + prop.toString());
		
		Enumeration<Object> enu = prop.keys();
		
		while(enu.hasMoreElements()) {
			String command = enu.nextElement().toString();
			
			//ClassName은 아직 문자열 상태
			String ClassName = prop.getProperty(command);
			
			try {
				// forName메소드는 문자열을 읽어서 instance로 만듬
				Class<?> handleClass = Class.forName(ClassName);
				
				// 모든 서브 컨트롤러들을 SuperController 형태로 승급
				SuperController instance = (SuperController)handleClass.newInstance();
				
				mapdata.put(command, instance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println("mapdata.toString : " + mapdata.toString());
		
		return mapdata;
	}
}
