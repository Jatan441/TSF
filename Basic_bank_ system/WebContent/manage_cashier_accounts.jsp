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
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">
  <title>Banking</title>
  <%
		String cashierid = request.getParameter("del");
		if(cashierid != null){
		 String qr = "delete from login where id="+cashierid;
		Statement ps = con.createStatement();
		int ex = ps.executeUpdate(qr);
		if(ex==0){
			 out.println("<div claass='alert alert-success'>Failed to remove.</div>");
		}
		else{
			response.sendRedirect("manage_cashier_accounts.jsp");
		}
		}
%>
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
        <a class="nav-link " href="mindex.jsp">User Accounts <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item active">  <a class="nav-link" href="manage_cashier_accounts.jsp">Cashier Accounts</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_addnew_users.jsp">Add New Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_feedback.jsp">Feedback</a></li>



    </ul>
    
    <form class="form-inline my-2 my-lg-0">
       
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" style="height:37px"><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>

  <%
  String email = request.getParameter("email");
  String pwd = request.getParameter("pwd");
     if(email != null && pwd !=null){
  String type = "cashier";
  String qr1 = "insert into login  (email,password,type) values(?,?,?)";
  PreparedStatement ps1 = con.prepareStatement(qr1);
  ps1.setString(1,email);
  ps1.setString(2,pwd);
  ps1.setString(3,type);
  int i = ps1.executeUpdate();
  if(i==0){
	  out.println("<div claass='alert alert-success'>Failed to add.</div>");
  }
  }
  %>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
    All Cashier Accounts <button class="btn btn-outline-success btn-sm float-right" data-toggle="modal" data-target="#exampleModal">Add New Account</button>
  </div>
  <div class="card-body">
    <table class="table table-bordered">
      <thead>
        <tr>
          <th>Email</th>
          <th>Password</th>
          <th>Account Type</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
		
  <%
  String qr = "select * from login where type='cashier'";
  Statement st = con.createStatement();
  ResultSet rs = st.executeQuery(qr);
  if(rs.next()){
	  do{
		 String id = rs.getString("id");
		  %>
		  <tr>
		 <td> <%=rs.getString("email") %> </td>
		 <td> <%=rs.getString("password") %> </td>
		 <td> <%=rs.getString("type") %> </td>
		  <td><a href='manage_cashier_accounts.jsp?del=<%=id %>' class='btn btn-danger btn-sm'>Delete</a></td>
		  </tr>
		  <%
	  }
	  while(rs.next());
  }
  else {
	  out.println("No record found");
  }
  %>
      </tbody>
    </table>
  </div>
  <div class="card-footer text-muted">
   <% out.println("Bank");%>
  </div>
</div>



<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Cashier Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="POST" action="manage_cashier_accounts.jsp">
          Enter Details
         <input class="form-control w-75 mx-auto" type="email" name="email" required placeholder="Email">
         <input class="form-control w-75 mx-auto" type="password" name="pwd" required placeholder="Password">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="saveAccount" class="btn btn-primary">Save Account</button>
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