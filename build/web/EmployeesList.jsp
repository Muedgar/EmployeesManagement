<%-- 
    Document   : EmployeesList
    Created on : 6 Mar 2022, 08:00:45
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employees List</title>
    </head>
    <body>
        <%
   try{
       //DriverManager.registerDriver(new org.postgresql.Driver());
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeesDB?autoReconnect=true&useSSL=false","root","ibaraza23798");
     Statement st = con.createStatement();
     ResultSet rs= st.executeQuery("select * from employees4");
     %>
     <table border="1" >
         <thead>
             <tr>
                 <td>Employee ID</td>
                 <td>Employee Name</td>
                 <td>Date of birth</td>
                 <td>Gender</td>
                 <td>Salary</td>
                 <td>Bonus</td>
             </tr>
         </thead>
         <tbody>
             <% while(rs.next()){ %>
             <tr>
                 <td><% out.println(rs.getString(1)); %></td>
                 <td><% out.println(rs.getString(2)); %></td>
                 <td><% out.println(rs.getString(3)); %></td>
                 <td><% out.println(rs.getString(4)); %></td>
                 <td><% out.println(rs.getString(5)); %></td>
                 <td><% out.println(rs.getString(6)); %></td>
             </tr>
             <%}%>
         </tbody>
     </table>
     <%
   }catch(Exception ex){
       out.println("Error"+ex.getMessage());
   }
%><br>
<br>
<br>
<br>
<form action="EmployeesReg.jsp" method="GET">
            <input type="submit" value="Insert New Employee"/>
        </form>
    </body>
</html>
