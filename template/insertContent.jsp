<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

		<%
				int id;
				int rownum = 0;
				Connection conn = null;
				Statement stmt = null;
				String sql = null;
				ResultSet rs = null;
				
				try {
					String user_id = (String)session.getAttribute("id");
					Class.forName("com.mysql.jdbc.Driver"); 
					String url = "jdbc:mysql://localhost:3306/ootd_db?characterEncoding=utf8"; 
					conn = DriverManager.getConnection(url,"root","password!"); 
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, 
							ResultSet.CONCUR_UPDATABLE); 
					sql = "select * from feed_tbl";
					rs = stmt.executeQuery(sql); 
				}catch(Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				String nickname = (String)session.getAttribute("id");
				String date = "181222";
				String title = "pleas.."
				String price = request.getParameter("price");
				String content = request.getParameter("content");
				
				String sql_update = "insert into feed_tbl values (" + "3,'" + nickname + "','" + date +"','" +
						title + "'," + price + ",'" + content + "','" + nickname + "')";
				
				try {
					stmt.executeUpdate(sql_update);
				}catch(Exception e) {
					out.println("DB 연동 오류입니다. : " + e.getMessage());
				}
				
				stmt.close();
				conn.close();
				response.sendRedirect("board.jsp");
			%>