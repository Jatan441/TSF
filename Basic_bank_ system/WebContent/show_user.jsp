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
 <a class="navbar-brand" href="#index.jsp">
    <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
  <%="Bank" %>
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
      <li class="nav-item ">  <a class="nav-link" href="manager_addnew_user.jsp">Add New Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_feedback.jsp">Feedback</a></li>



    </ul>
     <form class="form-inline my-2 my-lg-0">
    
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>
<%
String id = request.getParameter("id");
String query = "select * from useraccounts,branch where useraccounts.id = ? AND useraccounts.branch = branch.branchId";
PreparedStatement ps = con.prepareStatement(query);
ps.setString(1,id);
ResultSet rs = ps.executeQuery();
if(rs.next())
{
	do{
			
	        String name = rs.getString("name");
	        String accountNo = rs.getString("accountNo");
	        String branchName = rs.getString("branchName");
	        String branchNo = rs.getString("branchNo");
	        String balance = rs.getString("balance");
	        String accountType = rs.getString("accountType");
	        String number = rs.getString("number");
	        String cnic = rs.getString("cnic");
	        String city = rs.getString("city");
	        String address = rs.getString("address");
	
%>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
    <%="Account profile for "+name + " <kbd>#"+ accountNo+ "</kbd>"  %>
  </div>
  <div class="card-body">
    <table class="table table-bordered">
      <tbody>
        <tr>
          <td>Name</td>
          <th><%=name %></th>
          <td>Account No</td>
          <th><%=accountNo %></th>
        </tr><tr>
          <td>Branch Name</td>
          <th><%=branchName %></th>
          <td>Brach Code</td>
          <th><%=branchNo %></th>
        </tr><tr>
          <td>Current Balance</td>
          <th><%=balance %></th>
          <td>Account Type</td>
          <th><%=accountType %></th>
        </tr><tr>
          <td>Cnic</td>
          <th><%=cnic %></th>
          <td>City</td>
          <th><%=city %></th>
        </tr><tr>
          <td>Contact Number</td>
          <th><%=number %></th>
          <td>Address</td>
          <th><%=address %></th>
        </tr>
        <%
        }
        while(rs.next());
        }
		else{
			out.println("No record found");
		}
        %>
      </tbody>
    </table>
  </div>
  <div class="card-footer text-muted">
    <%="Bank" %>
  </div>
</div>

</body>

<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>


</html>