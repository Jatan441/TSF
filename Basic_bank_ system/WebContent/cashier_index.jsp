<%@page import="com.mysql.jdbc.StringUtils"%>
<%@page errorPage="error.jsp"  %>
<%@include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	String cid = (String)session.getAttribute("cid");
	String cpwd = (String)session.getAttribute("cpwd");
if(cid == null && cpwd == null){
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
	<%
	//String forwithdrawOther ="";
	//Sstem.out.println(forwithdrawOther);
	//ring forWithdraw ="";
	//String forDiposit ="";
	
	String withdrawOther = request.getParameter("withdrawOther");
	String withdraw = request.getParameter("withdraw");
	String deposit = request.getParameter("deposit");

	
	String accountNo = request.getParameter("otherNo");
	String accNo = request.getParameter("accountNo");
	String userId = request.getParameter("userId");
	String check = request.getParameter("checkno");
	String amount = request.getParameter("amount");

	if(withdrawOther != null){
		String query1 = "select * from otheraccounts where accountNo='"+accountNo+"'";
		Statement st = con.createStatement();
		ResultSet rs1 = st.executeQuery(query1);
		rs1.next();
				String balance = rs1.getString("balance"); 
				int newBalance = Integer.parseInt(balance);
			  	int newAmount = Integer.parseInt(amount);
			  	newBalance = newBalance - newAmount;
			  	balance = Integer.toString(newBalance); 
			  	query1 = "update otheraccounts set balance = '"+balance+"' where accountNo = '"+accountNo+"'";
			  	st = con.createStatement();
				int i = st.executeUpdate(query1);
				response.sendRedirect("cashier_index.jsp?msg='done'");
				}
				
	
	else if(withdraw != null){  // amount  debit accountNo
		 String qr = "Select * from useraccounts where accountNo = '"+accNo+"'";//101079737
		 Statement st = con.createStatement();
		 ResultSet rs = st.executeQuery(qr);
			rs.next();	
			 String balance = rs.getString("balance"); 
			 int newBalance = Integer.parseInt(balance);
			  int newAmount = Integer.parseInt(amount);
			  newBalance = newBalance - newAmount;
			  balance = Integer.toString(newBalance);
			 qr = "update useraccounts set balance = ? where accountNo = ? ";
			 PreparedStatement ps = con.prepareStatement(qr);
			 ps.setString(1,balance);
			 ps.setString(2,accNo);
			 ps.executeUpdate();
			 
			 qr = "insert into transaction (action,debit,other,userId) values (?,?,?,?)"; // withdraw amonut checkno userid 
			 ps = con.prepareStatement(qr);
			 ps.setString(1,"withdraw");
			 ps.setString(2,amount);
			 ps.setString(3,check);
			 ps.setString(4,userId);
			 ps.executeUpdate();		
			 response.sendRedirect("cashier_index.jsp?msg='done'");
			}
		
	
	
	else if(deposit != null){
		String qr = "Select * from useraccounts where accountNo = '"+accNo+"'";//101079737
		 Statement st = con.createStatement();
		 ResultSet rs = st.executeQuery(qr);
			rs.next();	
			 String balance = rs.getString("balance"); 
			 int newBalance = Integer.parseInt(balance);
			  int newAmount = Integer.parseInt(amount);
			  newBalance = newBalance + newAmount;
			  balance = Integer.toString(newBalance);
			 qr = "update useraccounts set balance = ? where accountNo = ? ";
			 PreparedStatement ps = con.prepareStatement(qr);
			 ps.setString(1,balance);
			 ps.setString(2,accNo);
			 ps.executeUpdate();
			 
			 qr = "insert into transaction (action,debit,other,userId) values (?,?,?,?)"; // withdraw amonut checkno userid 
			 ps = con.prepareStatement(qr);
			 ps.setString(1,"deposit");
			 ps.setString(2,amount);
			 ps.setString(3,check);
			 ps.setString(4,userId);
			 ps.executeUpdate();
			 response.sendRedirect("cashier_index.jsp?msg='done'");
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
        <a class="nav-link active" href="cashier_index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
        
      
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>
<%
	
	String	msg = request.getParameter("msg");
	if(!(StringUtils.isNullOrEmpty(msg))){
		out.println("<div class='alert alert-success'>successfully transaction done</div>");
		
	}%>
<div class="row w-100" style="padding: 11px">
  <div class="col">
    <div class="card text-center w-75 mx-auto">
  <div class="card-header">
    Account Information
  </div>
  <div class="card-body">
    <p class="card-text"><?php echo $note; ?>
      <form method="POST">
          <div class="alert alert-success w-50 mx-auto">
            <h5>Enter Account Number</h5>
            <input type="text" name="otherNo" class="form-control " placeholder="Enter  Account number" required>
            <button type="submit" name="get" class="btn btn-primary btn-bloc btn-sm my-1">Get Account Info</button>
          </div>
      </form>
    </p>
    <%
    String otherNo = request.getParameter("otherNo");
    if(otherNo != null)
    {
    	String useraccount = null;
    	String otheraccount = null;
    	String qr1 = "select * from otheraccounts where accountNo = '"+otherNo+"'";
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(qr1);
		if(rs1.next()){
			 		otheraccount ="otheraccount";
					accountNo = rs1.getString("accountNo");
			String holderName = rs1.getString("holderName");
			String bankName = rs1.getString("bankName");
			String balance = rs1.getString("balance");
			%>
			<div class='row'>
            <div class='col'>
            <form method='POST' action="cashier_index.jsp">
              Account No.
              <input type='text' value='<%=accountNo %>' name='otherNo' class='form-control ' readonly required>
              Account Holder Name.
              <input type='text' class='form-control' value='<%=holderName %>' readonly required>
              Account Holder Bank Name.
              <input type='text' class='form-control' value='<%=bankName %>' readonly required>
            </div>
            
            <div class='col'>
              Bank Balance
              <input type="hidden"  value="withdrawOther" name="withdrawother">
              <input type='text' class='form-control my-1'  value='Rs.<%=balance %>' readonly required>
              <input type='number' class='form-control my-1' name='checkno' placeholder='Write Check Number' required>
              <input type='number' class='form-control my-1' name='amount' placeholder='Write Amount' max='<%=balance %>' required>
             <button type='submit' name='withdrawOther' class='btn btn-success btn-bloc btn-sm my-1'> Withdraw</button>
             </form>
            </div>
          </div>
          <%
		}

		String qr2 = "select * from useraccounts where accountNo = '"+otherNo+"'";
		Statement st2 = con.createStatement();
		ResultSet rs2 = st2.executeQuery(qr2);
		 if(rs2.next()){
			 useraccount = "useraccount";
			String acccountNo = rs2.getString("accountNo");
			String uid = rs2.getString("id");
			String name = rs2.getString("name");
			//String bankName = rs2.getString("bankName");
			String balance = rs2.getString("balance");
			%>
			<div class='row'>
            <div class='col'>
            
              Account No.
              <input type='text' value='<%=accountNo %>' name='otherNo' class='form-control ' readonly required>
              Account Holder Name.
              <input type='text' class='form-control' value='<%=name %>' readonly required>
              Account Holder Bank Name.
              <input type='text' class='form-control' value='Bank' readonly required>
              Bank Balance
              <input type='text' class='form-control my-1'  value='Rs.<%=balance %>' readonly required>
               
            
            </div>
            <div class='col'>
              Transaction Process.
              <form method='POST' action="cashier_index.jsp">
              <input type="hidden" name="withdraw" value="withdraw"> 
              <input type='hidden' value='<%=accountNo %>' name='accountNo' class='form-control ' required>
              <input type='hidden' value='<%=uid %>' name='userId' class='form-control ' required>
              <input type='number' class='form-control my-1' name='checkno' placeholder='Write Check Number' required>
              <input type='number' class='form-control my-1' name='amount' placeholder='Write Amount for withdraw' max='$row2[balance]' required>
             <button type='submit' name='' class='btn btn-primary btn-bloc btn-sm my-1'> Withdraw</button></form>
             
             <form method='POST' action="cashier_index.jsp"> 
             <input type="hidden" name="deposit" value="deposit">
              <input type='hidden' value='<%=accountNo %>' name='accountNo' class='form-control ' required>
              <input type='hidden' value='<%=uid %>' name='userId' class='form-control ' required>
             <input type='number' class='form-control my-1' name='checkno' placeholder='Write Check Number' required>
              <input type='number' class='form-control my-1' name='amount' placeholder='Write Amount for deposit'  required>

             <button type='submit' name='' class='btn btn-success btn-bloc btn-sm my-1'> Deposit</button></form>
            </div>
          </div>
          <%
    }

		
		if(useraccount == null && otheraccount  == null){
            out.println( "<div class='alert alert-success w-50 mx-auto'>Account No. "+accountNo+" Does not exist</div>");
        }
    }
    %>
   
  </div>
  <div class="card-footer text-muted">
   <%="Bank"%>
  </div>
</div>
  </div>
  
</div>
</body>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>
</html>