package dto;

import java.sql.Timestamp;

public class MDto {
	   private int id;
	   private String userid;
	   private String userpass;
	   private String username;
	   private String useremail;
	   private String usertel;
	   private String addr1;
	   private String addr2;
	   private String userlink;
	   private String role;
	   private Timestamp wdate;
	   private int zipcode;

	   public MDto() {
	   }

	   public MDto(int id, String userid, String userpass, String username, String useremail, String usertel, String addr1, String addr2, String userlink, String role, Timestamp wdate, int zipcode) {
	      this.id = id;
	      this.userid = userid;
	      this.userpass = userpass;
	      this.username = username;
	      this.useremail = useremail;
	      this.usertel = usertel;
	      this.addr1 = addr1;
	      this.addr2 = addr2;
	      this.userlink = userlink;
	      this.role = role;
	      this.wdate = wdate;
	      this.zipcode = zipcode;
	   }

	   public int getId() {
	      return this.id;
	   }

	   public void setId(int id) {
	      this.id = id;
	   }

	   public String getUserid() {
	      return this.userid;
	   }

	   public void setUserid(String userid) {
	      this.userid = userid;
	   }

	   public String getUserpass() {
	      return this.userpass;
	   }

	   public void setUserpass(String userpass) {
	      this.userpass = userpass;
	   }

	   public String getUsername() {
	      return this.username;
	   }

	   public void setUsername(String username) {
	      this.username = username;
	   }

	   public String getUseremail() {
	      return this.useremail;
	   }

	   public void setUseremail(String useremail) {
	      this.useremail = useremail;
	   }

	   public String getUsertel() {
	      return this.usertel;
	   }

	   public void setUsertel(String usertel) {
	      this.usertel = usertel;
	   }

	   public String getAddr1() {
	      return this.addr1;
	   }

	   public void setAddr1(String addr1) {
	      this.addr1 = addr1;
	   }

	   public String getAddr2() {
	      return this.addr2;
	   }

	   public void setAddr2(String addr2) {
	      this.addr2 = addr2;
	   }

	   public String getUserlink() {
	      return this.userlink;
	   }

	   public void setUserlink(String userlink) {
	      this.userlink = userlink;
	   }

	   public String getRole() {
	      return this.role;
	   }

	   public void setRole(String role) {
	      this.role = role;
	   }

	   public Timestamp getWdate() {
	      return this.wdate;
	   }

	   public void setWdate(Timestamp wdate) {
	      this.wdate = wdate;
	   }

	   public int getZipcode() {
	      return this.zipcode;
	   }

	   public void setZipcode(int zipcode) {
	      this.zipcode = zipcode;
	   }

	   public String toString() {
	      int var10000 = this.id;
	      return "MDto [id=" + var10000 + ", userid=" + this.userid + ", userpass=" + this.userpass + ", username=" + this.username + ", useremail=" + this.useremail + ", usertel=" + this.usertel + ", addr1=" + this.addr1 + ", addr2=" + this.addr2 + ", userlink=" + this.userlink + ", role=" + this.role + ", wdate=" + String.valueOf(this.wdate) + ", zipcode=" + this.zipcode + "]";
	   }
	}

