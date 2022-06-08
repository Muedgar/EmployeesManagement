<%-- 
    Document   : EmployeesReg
    Created on : 4 Mar 2022, 12:17:34
    Author     : mutanganaedgar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.io.*" %>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <form action="InsertEmployee.jsp" method="POST">
            ID :<input type="text" name="id"/><br><br>
            Name: <input type="text" name="name"/><br><br>
            
            <label for="dob">Date of Birth: </label><input type="date" id="bd" name="dob"><br><br>
            Gender: 
            <select name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select><br><br>
            Salary: <input type="text" name="salary"/><br>
            <br>
<br>
Bonus: <input type="text" name="bonus"/><br>
            <br>
<br>
            <input type="submit" value="Save"/>
        </form><br><br><br>
        
        
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
%>
<br>
<br>
<br>
    <form action="EmployeesList.jsp" method="GET">
            <input type="submit" value="View Employees List On Another Page"/>
        </form>
    </body>
</html>


