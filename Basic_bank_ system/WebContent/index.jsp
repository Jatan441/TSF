<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp"%>
<%@include file="db.jsp"%>    
<%
String uid = request.getParameter("uid");
String upwd = request.getParameter("upwd");
String cid = request.getParameter("cid");
String cpwd = request.getParameter("cpwd");
String mid = request.getParameter("mid");
String mpwd = request.getParameter("mpwd");
		if(uid != null && upwd != null){
		String qr = "select * from useraccounts where email=? and password=?";
		PreparedStatement statement=con.prepareStatement(qr);  
		statement.setString(1,uid);
		statement.setString(2,upwd);  
		ResultSet rs =statement.executeQuery();
		if(rs.next()){
			String name = rs.getString("name"); 
			String accountNo = rs.getString("accountNo");
			String id = rs.getString("id");
			session.setAttribute("name",name);
			session.setAttribute("id",id);
			session.setAttribute("rs",uid);
			session.setAttribute("accountNo",accountNo);
			response.sendRedirect("user_index.jsp");
		}
		else {
			out.println("Email or Password is incorrect");
		}
		}
		
		
		if(cid != null && cpwd != null){
		String qr = "select * from login where email=? and password=?";
		PreparedStatement statement=con.prepareStatement(qr);  
		statement.setString(1,cid);
		statement.setString(2,cpwd);  
		ResultSet rs =statement.executeQuery();
		if(rs.next()){
			session.setAttribute("cid",cid);
			session.setAttribute("cpwd",cpwd);
			response.sendRedirect("cashier_index.jsp");
		}
		else {
			out.println("Email or Password is incorrect");
		}
		}
		
		
		if(mid != null && mpwd != null){
		String qr = "select * from login where email=? and password=?";
		PreparedStatement statement=con.prepareStatement(qr);  
		statement.setString(1,mid);
		statement.setString(2,mpwd);  
		ResultSet rs =statement.executeQuery();
		if(rs.next()){
			session.setAttribute("mid",mid);
			session.setAttribute("mpwd",mpwd);
			response.sendRedirect("mindex.jsp");
		}
		else {
			out.println("Email or Passwrd is incorrect");
		}
		}
		
		
%>



<!DOCTYPE html>
<html>
<head>
	<title>Banking</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/custom.css">
	<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
	
</head>
<body style="background: url(images/netbank.jpg);background-size: 100%; ">
<h1 class="">	<small class="float-right text-muted" style="font-size: 12pt;"><kbd>Presented by:Jatan Choudhary</kbd></small></h1>
<br>
<br>
<div id="accordion" role="tablist" class="w-25 float-right shadowBlack" style="margin-right: 222px">
	<br><h4 class="text-center text-black" style="color: white;">Select Your Session</h4>
  <div class="card rounded-0">
    <div class="card-header" role="tab" id="headingOne">
      <h5 class="mb-0">
        <a style="text-decoration: none;" data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
         <button class="btn btn-outline-success btn-block">User Login</button>
        </a>
      </h5>
    </div>

    <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
       <form method="POST" action="index.jsp">
       	<input type="email" value="jatan@gmail.com" name="uid" class="form-control" required placeholder="Enter Email">
       	<input type="password" name="upwd" value="12345" class="form-control" required placeholder="Enter Password">
       	<button type="submit" class="btn btn-primary btn-block btn-sm my-1" name="">Enter </button>
       </form>
      </div>
    </div>
  </div>
  <div class="card rounded-0">
    <div class="card-header" role="tab" id="headingTwo">
      <h5 class="mb-0">
        <a class="collapsed btn btn-outline-success btn-block" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Manager Login
        </a>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
         <form method="POST" action="index.jsp">
       	<input type="email" value="jatanchoudhary441@gmail.com" name="mid" class="form-control" required placeholder="Enter Email">
       	<input type="password" name="mpwd" value="12345" class="form-control" required placeholder="Enter Password">
       	<button type="submit" class="btn btn-primary btn-block btn-sm my-1" name="">Enter </button>
       </form>
      </div>
    </div>
  </div>
  <div class="card rounded-0">
    <div class="card-header" role="tab" id="headingThree">
      <h5 class="mb-0">
        <a class="collapsed btn btn-outline-success btn-block" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
         Cashier Login
        </a>
      </h5>
    </div>
    <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
        <form method="POST" action="index.jsp">
       	<input type="email" value="cashier@gmail.com" name="cid" class="form-control" required placeholder="Enter Email">
       	<input type="password" name="cpwd" value="cashier" class="form-control" required placeholder="Enter Password">
       	<button type="submit"  class="btn btn-primary btn-block btn-sm my-1" name="">Enter </button>
       </form>
      </div>
    </div>
  </div>
</div>
</body>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>
</html>