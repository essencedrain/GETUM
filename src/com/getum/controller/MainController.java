package com.getum.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.getum.command.CommandHandler;

public class MainController extends HttpServlet{
	
	//<커맨드, 핸들러인스턴스> Map
	private Map<String, CommandHandler> map = new HashMap<>();
	
	
	//======================================================================================================
	//init() 컨트롤러 초기화
	//======================================================================================================
	public void init(ServletConfig config) throws ServletException{
	
		// 1. 프로퍼티 경로 설정 및 변수 준비
		String path = config.getServletContext().getRealPath("/");
        String pros = path+config.getInitParameter("propertyConfig");
        Properties pr = new Properties();
        FileInputStream f = null;
        
        
        //경로확인
        System.out.println("realpath:"+path);
        System.out.println("pros:"+pros);
        
        
        // 2.WEB-INF/CommandPro.properties 읽기
        try{
            f = new FileInputStream(pros);
            pr.load(f);
        }catch(Exception ex){
            System.out.println("파일 읽기 예외 :"+ex);
        }finally{
            try{
            	if(f!=null){f.close();}
            }catch(Exception ex2){}
        }//try
        
        // 3. 2에서 읽은 프로퍼티 pr에다가 박은걸 이터레이터로 
        Iterator keyItor=pr.keySet().iterator();

        while(keyItor.hasNext()){

           String key = (String) keyItor.next();// key string : /join.get
           String className=pr.getProperty(key);// class instance : com.getum.member.command.JoinMemberHandler
           System.out.println("클라스네임 : "+className);

           	try{
                 Class<?> handlerClass = Class.forName(className);
                 /*
                 해당문자열로 된 클래스가 JVM에 있는지 찾고
                 로드되어 있지 않다면 ClassLoader 클래스 혹은 그를 상속받은 클래스들을 이용하여 해당 클래스를 로드하려고 시도
                 만약 찾지 못하면 ClassNotFoundException이 발생
                 */
                 
                 CommandHandler handlerInstance = (CommandHandler) handlerClass.newInstance();//찾은 클래스로부터 기본생성자로 초기화하고 인스턴스 생성

                 map.put(key, handlerInstance);///map에 그 인스턴스를 쑤셔박음
                
            

           }catch(Exception ex3){
                 System.out.println("proeprty 파일내용을 클래스 객체로 만드는 중 예외 발생 "+ex3);
           }//try
           	
        }//while end
		
	}//init()
	//======================================================================================================

	
	
	//======================================================================================================
	// doGet(), doPost()
	//======================================================================================================
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        process(request,response);
     }

     public void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException,ServletException{
        process(request,response);
     }
	//======================================================================================================

     
     
    //======================================================================================================
 	// process()
 	//======================================================================================================
     private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    	 
    	 //URI로부터 프로퍼티 key값 정제해서 넣을 변수
    	 String command = request.getRequestURI(); //  ex: /getum/join.get
    	 
    	 //경로 확인해보자
    	 System.out.println("request.getRequestURI() : " + request.getRequestURI());
    	 System.out.println("request.getContextPath() : " + request.getContextPath());
    	 System.out.println("command.substring(request.getContextPath().length()); : " + command.substring( request.getContextPath().length() ));
    	 //확인 후 삭제
    	 
    	 if( command.indexOf(request.getContextPath()) == 0 ){
    		 command = command.substring( request.getContextPath().length() ); // ex: /join.get
    	 }//if
    	 
    	 CommandHandler handler = map.get(command);
    	 //map.get(command) 결과가 인스턴스다. 이 인스턴스는 CommandHandler를 implements하고 있음
    	 // = map.get("/join.get")
    	 
    	 //포워딩할 jsp 주소 넣을 변수
    	 String viewPage = null;
    	 
    	 try {
    		 // 핸들러 인스턴스에 process 실행 시키고, 포워딩할 페이지 가져옴
    		 viewPage = handler.process(request, response);
    	 } catch (Throwable e) {
    		 throw new ServletException(e);
    	 }//try
    	 
    	 
    	 if(viewPage != null){
    		 RequestDispatcher rd = request.getRequestDispatcher(viewPage);
             rd.forward(request, response);//최초 요청 받고 중간에 핸들러로 수정된 리퀘스트, 리스폰스 들고 jsp로 포워딩
    	 }//if
    	 
    	 
     }//process()
    //======================================================================================================
}//class
