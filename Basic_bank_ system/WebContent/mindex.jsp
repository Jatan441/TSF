<%@page errorPage="error.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="db.jsp"  %> 

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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
  

  <title>Banking</title>
  
  <%
		String uid = request.getParameter("delete");
		if(uid != null){
		 String qr = "delete from useraccounts where id="+uid;
		Statement ps = con.createStatement();
		int ex = ps.executeUpdate(qr);
		if(ex==0){
			 out.println("<div claass='alert alert-success'>Failed to remove.</div>");
		}
		else{
			response.sendRedirect("mindex.jsp");
		}
		}
%>
</head>
<body style="background:#808000;background-size: 100%">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
 <a class="navbar-brand" href="#">
    <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
   <%="Bank" %>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link active" href="mindex.jsp">User Accounts<span class="sr-only">(current)</span></a>
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

<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
    All User Accounts
  </div>
  <div class="card-body">
   <table class="table table-bordered table-sm">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Holder Name</th>
      <th scope="col">Account No.</th>
      <th scope="col">Branch Name</th>
      <th scope="col">Current Balance</th>
      <th scope="col">Account type</th>
      <th scope="col">Contact</th>
      <th scope="col"></th>
    </tr>
  </thead>
  <tbody>
   <%
      int i=0;
      String qr = "select * from useraccounts,branch where useraccounts.branch = branch.branchId";
      Statement ps  =con.createStatement();
      Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery(qr);      
      if (rs.next())
      { 
    	  do{
    	  i++;
        String id = rs.getString("id");
        String name = rs.getString("name");
        String accountNo = rs.getString("accountNo");
        String branchName = rs.getString("branchName");
        String balance = rs.getString("balance");
        String accountType = rs.getString("accountType");
        String number = rs.getString("number");
       %>
       <tr>
       <td><%=i%></td>
       <td><%=name%></td>
       <td><%=accountNo%></td>
       <td><%=branchName%></td>
       <td><%=balance%></td>
       <td><%=accountType%></td>
       <td><%=number%></td>

        <td>
          <a href="show_user.jsp?id=<%=id%>" class='btn btn-success btn-sm' data-toggle='tooltip' title="View More info">View</a>
          <a href="manager_notice.jsp?id=<%=id%>" class='btn btn-primary btn-sm' data-toggle='tooltip' title="Send notice to this">Send Notice</a>
          <a href="mindex.jsp?delete=<%=id%>" class='btn btn-danger btn-sm' data-toggle='tooltip' title="Delete this account">Delete</a>
        </td>
        
      </tr>
    <%} 
    	  while(rs.next());
      }  
      
      else{
    	  out.println("No record found");
      }
      %>
  </tbody>
</table>
  <div class="card-footer text-muted">
  <%="Bank" %>
  </div>
</div>
</body>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>
</html>