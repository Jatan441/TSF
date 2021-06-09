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
      <li class="nav-item active ">  <a class="nav-link" href="transfer.jsp">Funds Transfer</a></li>
      


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
    Funds Transfer
  </div>
  <div class="card-body">
      <form method="POST" action="transfer.jsp">
          <div class="alert alert-success w-50 mx-auto">
            <h5>New Transfer</h5>
            <input type="text" name="otherNumber" class="form-control " placeholder="Enter Receiver Account number" required>
            <button type="submit" name="get" class="btn btn-primary btn-bloc btn-sm my-1">Get Account Info</button>
          </div>
      </form>
      <% String otherno = request.getParameter("otherNumber");//1622827518
      if(otherno != null){
    	  
    	String useraccount = null;
      	String otheraccount = null;
      	String qr2 ="select * from useraccounts where accountNo = '"+otherno+"'";
        Statement st2 = con.createStatement();	   
        ResultSet rs2 = st2.executeQuery(qr2);
      
       if(rs2.next()){
    	  useraccount ="useraccount";
    	  //String accountNo = rs2.getString("accountNo");
    	  String holderName = rs2.getString("name");
    	  //String bankName = rs2.getString("bankName");
    	  String balance = rs2.getString("balance");
      %>
      	 			<div class='alert alert-success w-50 mx-auto'>
      			  <form method='POST' action="transfer.jsp">
                    <input type="hidden" value="transferself" name="transferself">
                    Account No.
                    <input type='text' value='<%=otherno %>' name='otherNo' class='form-control ' readonly required>
                    Account Holder Name.
                    <input type='text' class='form-control' value='<%=holderName %>' readonly required>
                    Account Holder Bank Name.
                    <input type='text' class='form-control' value='Bank' readonly required>
                    Enter Amount for transfer.
                    <input type='number' name='amount' class='form-control' min='1' max='<%=balance %>' required>
                    <button type='submit' name='' class='btn btn-primary btn-bloc btn-sm my-1'>Transfer</button>
                  </form>
                </div>
                
                
      
      <%
     
    	  }
     						  String qr1 ="select * from otheraccounts where accountNo = '"+otherno+"'";
                    	      Statement st1 = con.createStatement();
                    	      ResultSet rs1 = st1.executeQuery(qr1);
                    	      
                    	      if(rs1.next()){
                    	    	  otheraccount= "otheraccount";
                    	    	   Statement st3 = con.createStatement();
                    	    	  ResultSet rs3 = st3.executeQuery("select * from useraccounts where id = '"+id+"'");
                    	    	  rs3.next();
                    	    	  String accountNo = rs3.getString("accountNo"); //User account
                    	    	  String balance = rs3.getString("balance");
                    	    	  
                    	    	  String otherNo = rs1.getString("accountNo");
                    	    	  String holderName = rs1.getString("holderName");
                    	    	  String bankName = rs1.getString("bankName");
                    	    	  %>
                    	    	  <div class='alert alert-success w-50 mx-auto'>
                    	                  <form method='POST' action="transfer.jsp">
                    	                    <input type="hidden" name="transfer" value="transfer">
                    	                    <input type="hidden" name="accountNo" value="<%=accountNo%>">
                    	                    <input type="hidden" name="balance" value="<%=balance%>">
                    	                    Account No.
                    	                    <input type='text' value='<%=otherNo %>' name='otherNo' class='form-control ' readonly required>
                    	                    Account Holder Name.
                    	                    <input type='text' class='form-control' value='<%=holderName %>' readonly required>
                    	                    Account Holder Bank Name.
                    	                    <input type='text' class='form-control' value='<%=bankName %>' readonly required>
                    	                    Enter Amount for tranfer.
                    	                    <input type='number' name='amount' class='form-control' min='1' max='<%=balance %>' required>
                    	                    <button type='submit' name='' class='btn btn-primary btn-bloc btn-sm my-1'>Transfer</button>
                    	                  </form>
                    	                </div>
                    	     <% 
                    	      }
                    	    
                    	      if(useraccount == null && otheraccount == null){
                    	          out.println("<div class='alert alert-success w-50 mx-auto'>Account No. "+otherno+" Does not exist</div>");
                    	      }
    	  
      
      }
      %>
        <br>
    <h5>Transfer History</h5>
    
   
    
   <%			
  				
  				String accountNo =request.getParameter("accountNo"); //User account number
  				String balance =request.getParameter("balance");
    			String otherNo = request.getParameter("otherNo");
    			String amount =request.getParameter("amount");
    			String transfer = request.getParameter("transfer");
    			String transferSelf = request.getParameter("transferself");
  
    			 if (transferSelf != null )
    			   { 
    				 accountNo = (String) session.getAttribute("accountNo");
    				 
    				 if(accountNo.equals(otherNo)){
    				
    					 String qr = "insert into transaction (action,debit,other,userId) values (?,?,?,?)";
    					PreparedStatement ps = con.prepareStatement(qr);
    					 ps.setString(1,"transfer");
    					 ps.setString(2,amount);
    					 ps.setString(3,accountNo);
    					 ps.setInt(4,Integer.parseInt(id)); 
    					 int i = ps.executeUpdate();		 
    					 if(i != 0 ){
    						 out.println("<script>alert('Transfer Successfull');window.location.href='transfer.jsp'</script>");
    					 }
    				 }
    				 
    				 else{
        				 String qr = "Select * from useraccounts where accountNo = '"+accountNo+"'";//101079737
        				 Statement st = con.createStatement();
        				 ResultSet rs = st.executeQuery(qr);
        				 if(rs.next()){
        					
        					 balance = rs.getString("balance"); 
        					 int newBalance = Integer.parseInt(balance);
        					  int newAmount = Integer.parseInt(amount);
        					  newBalance = newBalance - newAmount;
        					  balance = Integer.toString(newBalance);
        					 qr = "update useraccounts set balance = ? where accountNo = ? ";
        					 PreparedStatement ps = con.prepareStatement(qr);
        					 ps.setString(1,balance);
        					 ps.setString(2,accountNo);
        					 ps.executeUpdate();
        					 
        					 qr = "Select * from useraccounts where accountNo = '"+otherNo+"'";
        					 Statement st2 = con.createStatement();
        					 ResultSet rs2 = st.executeQuery(qr);
        					 rs2.next();        					
        					 newBalance = Integer.parseInt(rs2.getString("balance"));
       					  	 newAmount = Integer.parseInt(amount);
       					  	 newBalance = newBalance + newAmount;
       					 	 balance = Integer.toString(newBalance);
        					 qr = "update useraccounts set balance = ? where accountNo = ? ";
        					 ps = con.prepareStatement(qr);
        					 ps.setString(1,balance);
        					 ps.setString(2,otherNo);
        					 ps.executeUpdate();
        					 
        					 qr = "insert into transaction (action,debit,other,userId) values (?,?,?,?)";
        					 ps = con.prepareStatement(qr);
        					 ps.setString(1,"transfer");
        					 ps.setString(2,amount);
        					 ps.setString(3,otherNo);
        					 ps.setInt(4,Integer.parseInt(id)); 
        					 int i = ps.executeUpdate();		 
        					 if(i != 0 ){
        						 out.println("<script>alert('Transfer Successfull');window.location.href='transfer.jsp'</script>");
        					 }
        					 
        				 }
        				
    			 	 
    			   }
    					  
		 
    }
    			  if (transfer != null)
    			   {
    				 
    					 String qr = "Select * from otheraccounts where accountNo = '"+otherNo+"'";
    					 Statement st = con.createStatement();
    					 ResultSet rs = st.executeQuery(qr);
    					 if(rs.next()){
    						 
    						
    						 int newBalance = Integer.parseInt(balance);
    						  int newAmount = Integer.parseInt(amount);
    						  newBalance = newBalance - newAmount;
    						  balance = Integer.toString(newBalance);
    						
    						 qr = "update useraccounts set balance = ? where accountNo = ? ";
    						 PreparedStatement ps = con.prepareStatement(qr);
    						 ps.setString(1,balance);
    						 ps.setString(2,accountNo);
    						 ps.executeUpdate();


    						 qr = "insert into transaction (action,debit,other,userId) values (?,?,?,?)";
    						 ps = con.prepareStatement(qr);
    						 ps.setString(1,"transfer");
    						 ps.setString(2,amount);
    						 ps.setString(3,otherNo);
    						 ps.setInt(4,Integer.parseInt(id));
    						 int i = ps.executeUpdate();		 
    						 
    						 if(i != 0 ){
    							 out.println("<script>alert('Transfer Successfull');window.location.href='transfer.jsp'</script>");
    						 }
    				 	 }
    					 else
    					 {
    						 out.println("not found");
    					 }
    			   }
     
   
 
   %>

  		  
  	<%String qr= "select * from transaction where userId = '"+id+"' order by date desc";
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery(qr);
    if(rs.next()){
  	  do{
  		  String action = rs.getString("action");
  		  String debit = rs.getString("debit");
  		  String credit = rs.getString("credit");
  		  String date = rs.getString("date"); 
  		  String other = rs.getString("other");
      
  		if (action.equals("transfer")) 
        {
          out.println("<div class='alert alert-warning'>Transfer have been made for  Rs."+debit+" from your account at "+date+" in  account no."+other+"</div>");
        }
  		if (action.equals("withdraw")) 
        {
          out.println("<div class='alert alert-secondary'>You withdraw Rs."+debit+" from your account at "+date+"</div>");
        }
  		if (action.equals("deposit")) 
        {
          out.println("<div class='alert alert-success'>You deposit Rs."+credit+" in your account at "+date+"</div>");
        }
  		if (action.equals("deduction")) 
        {
          out.println("<div class='alert alert-danger'>Deduction have been made for  Rs."+debit+" from your account at "+date+" in case of "+other+"</div>");
        }
  		    
  	  }
  	  while(rs.next());
    }
  	  else{
  		  out.println("<div class='alert alert-success'>You have no transaction made yet.</div>");
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