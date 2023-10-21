<%@page import="java.sql.*"%>
<%
String pass_id=request.getParameter("pid");
DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("Select Passengers.pname, Point_account.total_points From Passengers Join Point_account On Point_account.pass_id = Passengers.pass_id where Passengers.pass_id="+ pass_id);
String result="";
while(rs.next()){
    result+=rs.getObject("pname")+":"+rs.getObject("total_points");
    }
con.close();
out.print(result);
%>