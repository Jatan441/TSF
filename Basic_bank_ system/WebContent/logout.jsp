<%@page errorPage="error.jsp" %>
<%
session.invalidate();
response.sendRedirect("index.jsp");
%>