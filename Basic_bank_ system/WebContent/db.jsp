<%@page import="java.sql.*"%>
<%
String ID = (String) session.getAttribute("id");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mybank","root","");

%>
<html>
<script type="text/javascript">
	$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
</script>
</html>