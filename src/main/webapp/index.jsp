<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="jspbord.dao.DBConnect,java.util.ArrayList,java.sql.Timestamp, java.sql.Connection, jspbord.dao.JBoardDao, dto.BDto, java.sql.Timestamp, java.text.SimpleDateFormat, java.text.NumberFormat"%>
<jsp:include page="inc/header.jsp" flush="true" />
<%@ include file="inc/aside.jsp" %>
<jsp:useBean id="db" class="jspbord.dao.DBConnect" scope="page" />
<%
    String sname = request.getParameter("searchname");
    String svalue = request.getParameter("searchvalue");
   
    /* 페이징을 위한 변수 */
    int pg; //받아올 현재 페이지 번호
    int allCount; //1. 전체 개시글 수 
    int listCount; //2. 한 페이지에 보일 목록 수
    int pageCount; //3. 한 페이지에 보일 페이지 수
    int allPage;  //4. 전체 페이지 수
    int limitPage; //4. 쿼리문으로 보낼 시작번호
    int startPage;  //5. 시작페이지
    int endPage;   //6. 마지막 페이지


    String cpg = request.getParameter("cpg");
    if(cpg == null){
    	pg = 1;
    }else{
    	pg = Integer.parseInt(cpg);   	
    }
    listCount = 10;
    pageCount = 10;
    
    limitPage = (pg-1)*listCount; //(현재페이지 -1) * 목록수
    
    limitPage = (pg-1)*listCount;  //(현재페이지-1)x목록수 
    Connection conn = db.conn;
    JBoardDao dao = new JBoardDao(conn);
    ArrayList<BDto> list = null;
    allCount = dao.AllSelectDB();
    allPage = (int)Math.ceil(allCount/(double)listCount);
    
    //시작페이지
     startPage = ((pg-1)/pageCount)* pageCount+1;
  
    //마지막페이지
    endPage = startPage + pageCount -1;
    if(endPage > allPage ) endPage = allPage;
    
    
    if(sname == null || sname.trim().isEmpty()){    
       list = dao.selectDB(limitPage, listCount);
    }else{
       list = dao.selectDB(limitPage, listCount, sname, svalue);
    }

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
    NumberFormat formatter = NumberFormat.getInstance();
%>
    <section>
            <!-- listbox -->
            <div class="listbox">
                <h1 class="text-center mb-5"></h1>
                <div class="d-flex justify-content-between py-4">
                    <div>
                        <label>총 게시글</label> : <%=formatter.format(allCount) %>개 / <%=formatter.format(allPage) %>page
                    </div>
                    <div>
                        <a href="/jspBoard" class="btn btn-primary">목록</a>
                        <a href="write.jsp" class="btn btn-primary">글쓰기</a>                      
                    </div>
                </div>
                <table class="table table-hover">
                    <colgroup>
                       <col width="8%">
                       <col>
                       <col width="15%">
                       <col width="10%">
                       <col width="15%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>글쓴이</th>
                            <th>조회수</th>
                            <th>날짜</th>
                        </tr>
                    </thead>
                    <tbody>
                       <!-- loop --> 
                   <%
                      int num = allCount - (listCount*(pg-1)); 
                   
                      for(int i=0; i<list.size(); i++){
                    	  BDto dto = list.get(i);
                    	  int id = dto.getId();
                    	  int depth = dto.getDepth();
                    	  String title = dto.getTitle();
                    	  String writer = dto.getWriter();
                    	  int hit = dto.getHit();
                    	  int chit = dto.getChit();
                    	  Timestamp dates = dto.getWdate();
                    	  String wdate = sdf.format(dates);
                    	  String styleDepth = "";
                    	  if(depth > 0){
                    		  String padding = (depth*10)+"px";
                    		  String reicon = "<i class=\"ri-corner-down-right-line\"></i>";
                    	      styleDepth = "<span style='display:inline-block;width:"+padding+"'></span>"+reicon+" ";
                    	  }
                   %>    
                       <tr>
                           <td class="text-center"><%=num %></td>
                           <td><a href="contents.jsp?id=<%=id%>&cpg=<%=pg%>">
                               <%=styleDepth%><%=title %>
                            </a><span></span>
                            <!-- 
                               <i class="ri-file-image-fill"></i>
                               <i class="ri-file-hwp-fill"></i>
                               <i class="ri-file-music-fill"></i>
                            -->   
                            </td>
                            
                           <td class="text-center"><%=writer %></td>
                           <td class="text-center"><%=hit %></td>
                           <td class="text-center"><%=wdate %></td>
                       </tr>
                  <% 
                        num--;
                      } 
                  %>     
                       <!-- /loop -->
                    </tbody>
                </table>
                <div class="d-flex justify-content-between py-4">
                    <div>
                    </div>
                    <ul class="paging">
                        <li>
                            <a href="?cpg=1"><i class="ri-arrow-left-double-line"></i></a>
                        </li>
                        <li>
                        <%
                           if(startPage - 1 == 0){
                        %>
                            <a href="?cpg=<%=startPage%>"><i class="ri-arrow-left-s-line"></i></a>
                        <% }else{ %>
                            <a href="?cpg=<%=startPage-1%>"><i class="ri-arrow-left-s-line"></i></a>
                        <% } %>
                        </li>
                        <%
                        //시작페이지 6
                        for(int i = startPage; i <= endPage; i++){
                           if(pg == i) {
                              out.println("<li><a href=\"?cpg="+i+"\" class=\"active\">"+i+"</a></li>");
                           }else{
                              out.println("<li><a href=\"?cpg="+i+"\">"+i+"</a></li>");
                           }
                        }
                        //끝페이지 10
                        %>
                        
                        <li>
                          <%
                           if(endPage + 1 > allPage){
                          %>
                            <a href="?cpg=<%=endPage%>"><i class="ri-arrow-right-s-line"></i></a>
                         <%
                           }else{ 
                         %>   
                            <a href="?cpg=<%=endPage+1%>"><i class="ri-arrow-right-s-line"></i></a>
                         <%
                           }
                         %>
                        </li>
                        <li>
                            <a href="?cpg=<%=allPage%>"><i class="ri-arrow-right-double-line"></i></a>
                        </li>
                    </ul>

                    <div>
                        <a href="/jspBoard" class="btn btn-primary">목록</a>
                        <a href="write.jsp" class="btn btn-primary">글쓰기</a>                      
                    </div>
               </div>
               <form name="searchform" id="searchform" class="searchform" method="get">
                   <div class="input-group my-3">
                        <div class="input-group-prepend">
                             <button type="button" 
                                    class="btn btn-outline-secondary dropdown-toggle" 
                                    data-toggle="dropdown"
                                    value="title">
                                제목검색
                              </button>
                              <input type="hidden" name="searchname" id="searchname" value="title">
                              <div class="dropdown-menu">
                                <a class="dropdown-item" href="writer">이름검색</a>
                                <a class="dropdown-item" href="title">제목검색</a>
                                <a class="dropdown-item" href="content">내용검색</a>
                            </div>
                        </div>
                       <input type="search" name="searchvalue" class="form-control" placeholder="검색">
                       <div class="input-group-append">
                          <button type="submit" class="btn btn-primary"><i class="ri-search-line"></i></button>
                       </div>
                   </div>
               </form>
            </div>
            <!-- /listbox-->
         </section>
    <%@ include file="inc/footer.jsp" %>   