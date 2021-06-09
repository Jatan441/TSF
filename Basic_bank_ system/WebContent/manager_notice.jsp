<%@page errorPage="error.jsp"  %>
<%@include file="db.jsp" %>

<%
	String mid = (String)session.getAttribute("mid");
	String mpwd = (String)session.getAttribute("mpwd");
if(mid == null && mpwd == null){
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
        <a class="nav-link active" href="mindex.jsp">User Accounts <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="manage_cashier_accounts.jsp">Cashier Accounts</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_addnew_users.jsp">Add New Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_feedback.jsp">Feedback</a></li>

    </ul>
 <form class="form-inline my-2 my-lg-0">
       
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>
 <%
 String id = request.getParameter("id");
 String query = "select * from useraccounts where id = ?"; 
 PreparedStatement ps = con.prepareStatement(query);
 ps.setString(1,id);
 ResultSet rs = ps.executeQuery();
 if(rs.next()){
	 do{
		 String name = rs.getString("name");
	 
 %>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
    <%="Send Notice to "+name %> 
  </div>
  <div class="card-body">
    <form method="POST" action="manager_notice.jsp">
          <div class="alert alert-success w-50 mx-auto">
            <h5><%= "Write notice for "+ name%></h5>
            <input type="hidden" name="userId" value="<%=id%>">
            <textarea class="form-control" name="notice" required placeholder="Write your message"></textarea>
            <button type="submit" name="" class="btn btn-primary btn-block btn-sm my-1">Send</button>
          </div>
      </form>
      <%}
	 while(rs.next());
 		}
 	
 		String userId = request.getParameter("userId");	
		String notice = request.getParameter("notice"); 	
	 	if(userId != null && notice != null){
	 		String qr = "insert into notice (notice,userId) values (?,?)";
	 		PreparedStatement ps1 = con.prepareStatement(qr);
	 		ps1.setString(1, notice);
	 		ps1.setString(2, userId);
	 		int i = ps1.executeUpdate();
	 		if(i != 0){
	 			out.println("<div class='alert alert-success'>Successfully send</div>");
	 		}
	 		else {
	 			  out.println("<div claass='alert alert-success'>Failed to send.</div>");
	 		}
	 	
 }
	 %>
	 

  </div>
  <div class="card-footer text-muted">
		<%="Bank"%>
  </div>
</div>

</body>

<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>


</html>