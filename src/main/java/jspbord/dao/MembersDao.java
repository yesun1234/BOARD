package jspbord.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import dto.MDto;


public class MembersDao {
	
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   Connection conn;

	   public MembersDao(Connection conn) {
	      this.conn = conn;
	   }

	   public int insertDB(MDto dto) {
	      int num = 0;
	      String sql = "insert into members  (userid, userpass, username, useremail, usertel, zipcode, addr1, addr2, userlink)  values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

	      try {
	         this.pstmt = this.conn.prepareStatement(sql);
	         this.pstmt.setString(1, dto.getUserid());
	         this.pstmt.setString(2, dto.getUserpass());
	         this.pstmt.setString(3, dto.getUsername());
	         this.pstmt.setString(4, dto.getUseremail());
	         this.pstmt.setString(5, dto.getUsertel());
	         this.pstmt.setInt(6, dto.getZipcode());
	         this.pstmt.setString(7, dto.getAddr1());
	         this.pstmt.setString(8, dto.getAddr2());
	         this.pstmt.setString(9, dto.getUserlink());
	         System.out.println(this.pstmt);
	         num = this.pstmt.executeUpdate();
	      } catch (SQLException var13) {
	         var13.printStackTrace();
	      } finally {
	         try {
	            if (this.pstmt != null) {
	               this.pstmt.close();
	            }
	         } catch (SQLException var12) {
	            var12.printStackTrace();
	         }

	      }

	      return num;
	   }
	   
	  
	   public MDto login(String userid, String userpass) {
		   String sql = "select * from members where userid=? and userpass=?";
		   MDto dto = new MDto();
		   try {
			   pstmt = conn.prepareStatement(sql);
			   pstmt.setString(1, userid);
			   pstmt.setString(2, userpass);
			   rs = pstmt.executeQuery();
			   
			   if(rs.next()) {
			   dto.setId(rs.getInt("id"));
			   dto.setUserid(rs.getString("userId"));
			   dto.setUseremail(rs.getString("useremail"));
			   dto.setUsername(rs.getString("username"));
			   dto.setRole(rs.getString("rol"));
			    }
		   }catch(SQLException e) {
			   e.printStackTrace();
		   }finally {
			   try {
				   if(pstmt != null ) pstmt.close();
				   if(rs != null) rs.close();
				   }catch(SQLException e) {
					   e.printStackTrace();
				   }
		   }
		   return dto;
	   }


	   public boolean findUser(String column, String uname) {
	      boolean res = true;
	      String sql = "select * from members where " + column + "= ?";

	      try {
	         this.pstmt = this.conn.prepareStatement(sql);
	         this.pstmt.setString(1, uname);
	         this.rs = this.pstmt.executeQuery();
	         if (this.rs.next()) {
	            res = false;
	         }
	      } catch (SQLException var14) {
	         var14.printStackTrace();
	      } finally {
	         try {
	            if (this.pstmt != null) {
	               this.pstmt.close();
	            }
	         } catch (SQLException var13) {
	            var13.printStackTrace();
	         }

	      }

	      return res;
	   }
	}

