<%@page import="java.sql.*"%>
<%
    String pass_id=request.getParameter("pid");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select pass_id from Passengers where pass_id != " + pass_id);
    String output = "";
    while(rs.next()){
        output+= rs.getObject("pass_id").toString() + "#";
    }
    con.close();
    out.print(output);
    %>