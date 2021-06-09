<%@page errorPage="error.jsp"  %>
<%@include file="db.jsp" %>
<%@page import="java.util.*"%>
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
<%
String feedbackId = request.getParameter("delete");
if(feedbackId != null){
	String qr = "Delete from feedback where feedbackId = ?";
	PreparedStatement ps = con.prepareStatement(qr);
	ps.setString(1,feedbackId);
	int i = ps.executeUpdate();
	if(i!=0){
		out.println("<div claass='alert alert-success'>Deleted.</div>");
	}
	else{
		response.sendRedirect("manager_feedback.jsp");
	}
}
%>
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
        <a class="nav-link " href="mindex.jsp">User Accounts <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="manage_cashier_accounts.jsp">Cashier Accounts</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_addnew_users.jsp">Add New Account</a></li>
      <li class="nav-item active">  <a class="nav-link" href="manager_feedback.jsp">Feedback</a></li>


    </ul>
      <form class="form-inline my-2 my-lg-0">
       	
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
    Feedback from Account Holder
  </div>
  <div class="card-body">
   <table class="table table-bordered table-sm bg-dark text-white">
  <thead>
    <tr>
      <th scope="col">From</th>
      <th scope="col">Account No.</th>
      <th scope="col">Contact</th>
      <th scope="col">Message</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
  <%
  String qr = "select * from useraccounts,feedback where useraccounts.id = feedback.userId";
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery(qr);
  if(rs.next()){
	  do{
		  String id = rs.getString("feedbackId");
		  String name =rs.getString("name");
		  String accountNo =rs.getString("accountNo");
		  String number =rs.getString("number");
		  String message =rs.getString("message");
	  %>
          <tr>
        <td><%=name %></td>
        <td><%=accountNo %></td>
        <td><%=number %></td>
        <td><%=message %></td>
        <td>
          <a href="manager_feedback.jsp?delete=<%=id%>" class='btn btn-danger btn-sm' data-toggle='tooltip' title="Delete this Message">Delete</a>
        </td>
      </tr>
  </tbody>
      <%
	  }
	  while(rs.next());
	  }
  		else{
  			out.println("<div claass='alert alert-success'>Not found.</div>");
  		}
	  %>
</table>
  <div class="card-footer text-muted">
       <%="Bank"%>
  </div>
</div>
</body>
</html>