<%-- 
    Document   : InsertEmployee
    Created on : 4 Mar 2022, 20:57:02
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="EmployeesReg.jsp" method="GET">
            <input type="submit" value="View Employees List"/>
        </form>
    </body>
</html>

<% // Inserting data in database.
  try{
    String id = request.getParameter("id");
    String nm = request.getParameter("name");
    
    String date = request.getParameter("dob");
    String gender = request.getParameter("gender");
    String salary = request.getParameter("salary");
    String bonus = request.getParameter("bonus");
    Integer sal = Integer.valueOf(salary);
    
    Double bon = Double.valueOf(bonus);
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeesDB?autoReconnect=true&useSSL=false","root","ibaraza23798");
    Statement st = con.createStatement();
    
        st.execute("insert into employees4 values('"+id+"','"+nm+"','"+date+"','"+gender+"','"+sal+"','"+bonus+"')");
        out.println("employee recorded");
    
      
  }catch(Exception ex){
    out.print(ex.getMessage());
    }
%>