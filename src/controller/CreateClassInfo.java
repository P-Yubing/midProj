package controller;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.*;

import service.ClassInfoServiceImpl;
import service.ClassPicServiceImpl;
import service.ClassServiceImpl;
import service.IClassInfoService;
import service.IClassPicService;
import service.IClassService;
import vo.ClassInfoVO;
import vo.ClassPicVO;
import vo.ClassVO;

@WebServlet("/create")
public class CreateClassInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;
    IClassService service = ClassServiceImpl.getInstance();
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // doGet 메서드에서도 doPost 메서드를 호출하여 처리
        
    	doPost(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 로그인한 사용자의 USER_ID 가져오기
//        String userId = (String) request.getSession().getAttribute("userId");
        String classId = (String) request.getSession().getAttribute("classId");
        String userId = (String) request.getSession().getAttribute("loginCode");
        System.out.println("userId : " + userId);
        
      //이미지 파일업로드 처리
        String path = "D:\\4.HighJava\\workspace\\TodayDoDay\\WebContent\\img\\classHostPic";
        String path2 = "D:\\4.HighJava\\workspace\\TodayDoDay\\WebContent\\ClassPic";
        //파일업로드 처리용 클래스
        DiskFileUpload upload = new DiskFileUpload();

        upload.setSizeMax(1000000);	//1Mb
        upload.setSizeThreshold(4096);	//1 * 1024 * 1024 => 1Mb
        upload.setRepositoryPath(path);	//임시 저장경로 : 생략가능
        //request 객체에 있는 모든 요청 파라미터를 분석하여 List타입의 items 변수에 저장
        List items;
        
		try {
			items = upload.parseRequest(request);
			
			Iterator params = items.iterator();	//열거형으로 처리

	        String productId = "";
	        String pname = "";
	        String unitPrice = "";
	        String description = "";
	        String manufacturer = "";
	        String category = "";
	        String unitsInStock = "";
	        String condition = "";
	        //unitPrice는 문자형 데이터. -> 숫자형으로 변환
	        double price = 0d;
	        long stock = 0L;

	        String fileFieldName = "";
	        String fileName = "";
	        String contentType = "";

	        // ClassInfoVO에 값을 설정
	        ClassInfoVO classInfoVO = new ClassInfoVO();
	        ClassPicVO classPicVO = new ClassPicVO();
	        
	        //vo객체에 요청파라미터를 setting => spring에서는 골뱅이 ModelAttribute로 쉽게 처리될것임
	        while(params.hasNext()){	//다음 항목이 있는지? 
	        	FileItem item = (FileItem)params.next();	//있으면 그 항목을 가져오자
	        	if(item.isFormField()){	//일반 항목일때
	        		//item : {productId=P1234}
	        		String name = item.getFieldName();	//productId
	        		if(name.equals("classCurr")){	
	        			classInfoVO.setClassCurr(item.getString("UTF-8"));
	        		}else if(name.equals("classIntro")){
	        			classInfoVO.setClassIntro(item.getString("UTF-8"));
	        		}else if(name.equals("classHost")){
	        			classInfoVO.setClassHost(item.getString("UTF-8"));
	        		}else if(name.equals("classCategory")){
	        			classInfoVO.setClassCategory(item.getString("UTF-8"));
	        		}else if(name.equals("classPrice")){
	        			classInfoVO.setClassPrice(item.getString("UTF-8"));
	        		}else if(name.equals("classDay")){
	        			classInfoVO.setClassDay(item.getString("UTF-8"));
	        		}else if(name.equals("classCertificate")){
	        			classInfoVO.setClassCertificate(item.getString("UTF-8"));
	        		}else if(name.equals("className")){
	        			classInfoVO.setClassName(item.getString("UTF-8"));
	        		}else if(name.equals("classWishCount")){
	        			classInfoVO.setClassWishCount(item.getString("UTF-8"));
	        		}else if(name.equals("classAddr")){
	        			classInfoVO.setClassAddr(item.getString("UTF-8"));
	        		}
	        	}else{	//파일객체일 때
	        		try {
	        			fileFieldName = item.getFieldName();	//productImage
	        			if(fileFieldName.equals("file")) {
		        			fileName = item.getName();	//C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG
		        			contentType = item.getContentType();	//images/jpeg
		        			
		        			//C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG -> 	tomcate.PNG
		        			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		        			long fileSize = item.getSize();	//파일 크기
		        			
		        			//설계 => 복사될 위치 및 파일명 결합연산
		        			File file = new File(path + "/" + fileName);// 복사될 위치\\tomcate.PNG
		        			//복사 처리
							item.write(file);
							classInfoVO.setHostPic("/img/classHostPic/" + fileName);
	        			}else if(fileFieldName.equals("file2")) {
		        			fileName = item.getName();	//C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG
		        			contentType = item.getContentType();	//images/jpeg
		        			
		        			//C:\\Users\\SEM-PC\\Pictures\\tomcate.PNG -> 	tomcate.PNG
		        			fileName = fileName.substring(fileName.lastIndexOf("\\")+1);
		        			long fileSize = item.getSize();	//파일 크기
		        			
		        			//설계 => 복사될 위치 및 파일명 결합연산
		        			File file = new File(path2 + "/" + fileName);// 복사될 위치\\tomcate.PNG
		        			//복사 처리
							item.write(file);
							classPicVO.setFileStreCours("/ClassPic/" + fileName);
							classPicVO.setClassPicName(fileName);
	        			}
					} catch (Exception e) {
						System.out.println("오류 : " + e.getMessage());
					}
	        		
	        	}
	        }//end while
	        
	        
//	        System.out.println("화긴>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + request.getReader());
	        
	        
	        // IClassInfoService를 통해 ClassInfoVO를 insert
	        IClassInfoService classInfoService = new ClassInfoServiceImpl();
	        IClassPicService  classPicService = new ClassPicServiceImpl();
	        
	        
	        
	        //1) 클래스 생성
	        ClassVO classVO = new ClassVO();
	        classVO.setUserid(userId);
	        System.out.println("classVO : " + classVO);
	        //classId이 채워짐 ex) 8
	        int result = service.createClass(classVO);
	        System.out.println("result : " + result);
	        
	        //2) 클래스 상세 정보 등록
	        classInfoVO.setClassId(classVO.getClassId());
	        //ClassInfoVO [classId=8, classCurr=드로잉을배우다가짜증나면수업드로잉하고도망가도됨, classIntro=드로잉드로잉던져버려수업을, classHost=지연지, classCategory=베이커리
	        //, classPrice=77000, classDay=주중, classCertificate=null, className=지연드로잉, classWishCount=null, hostPic=/img/classHostPic/굉장한대.png
	        //, classAddr=광주시 서구, classPicId=]
	        System.out.println("classInfoVO : " + classInfoVO);
	        classInfoService.createClassInfo(classInfoVO);
	        
	        //3) 클래스 사진 (CLASSPIC) 테이블에 INSERT
	        classPicVO.setClassId(classVO.getClassId());
	        classPicService.insertClassPic(classPicVO);
	        
	        // 클래스 정보 삽입 완료 후 처리

	        // 리다이렉트 또는 응답 처리
	        response.sendRedirect("/index.jsp");
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        
    }
}
