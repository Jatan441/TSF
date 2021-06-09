<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="db.jsp"  %> 
 
<%
	String id = (String)session.getAttribute("id");
	String uid = (String)session.getAttribute("uid");
if(id == null && uid == null){
	response.sendRedirect("index.jsp");
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
<body style="background:#808000;background-size: 100%">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
 <a class="navbar-brand" href="#">
    <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
    <%="Bank"%>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link" href="user_index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="user_detail.jsp">Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="statements.jsp">Account Statements</a></li>
      <li class="nav-item ">  <a class="nav-link" href="transfer.jsp">Funds Transfer</a></li>
      


    </ul>
     <form class="form-inline my-2 my-lg-0">
          
        <a href="user_detail.jsp" data-toggle="tooltip" title="Account Summary" class="btn btn-outline-primary mx-1" ><i class="fa fa-book fa-fw"></i></a> 
        <a href="notice.jsp" data-toggle="tooltip" title="View Notice" class="btn btn-outline-primary mx-1" ><i class="fa fa-envelope fa-fw"></i></a> 
        <a href="feedback.jsp" data-toggle="tooltip" title="Help?" class="btn btn-outline-info mx-1" ><i class="fa fa-question fa-fw"></i></a> 
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
  </div>
</nav><br><br><br>
<div class="container">
  <div class="card  w-75 mx-auto">
  <div class="card-header text-center">
    Help Card
  </div>
  <div class="card-body">
      <form method="POST" action="feedback.jsp">
          <div class="alert alert-success w-50 mx-auto">
            <h5>Enter your message</h5>
            <textarea class="form-control" name="msg" required placeholder="Write your message"></textarea>
            <button type="submit" name="send" class="btn btn-primary btn-block btn-sm my-1">Send</button>
          </div>
      </form>
      
    <br>
<%
		String msg = request.getParameter("msg");
		if(msg != null){
			String qr = "insert into feedback (message,userId) values (?,?)";
			PreparedStatement ps = con.prepareStatement(qr);
			ps.setString(1,msg);
			ps.setInt(2,Integer.parseInt(id));
			int i = ps.executeUpdate();
			if(i!= 0){
				out.println("<div class='alert alert-success'>Successfully send</div>");
			}
			else{
				out.println("<div class='alert alert-success'Not send.</div>");
			}
		}
%>  
    
  </div>

  <div class="card-footer text-muted">
   <%="Bank"%>
  </div>
</div>

</div>
</body>

<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>


</html>