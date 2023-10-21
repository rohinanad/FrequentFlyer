<%@page import="java.sql.*"%>
<%
    String pass_id=request.getParameter("pid");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select award_id from Passenger_redeem_award where pass_id = " + pass_id );
    String output="";
    while(rs.next()){
        output+= rs.getObject("award_id") + "#";
    }
    con.close();
    out.print(output);
    %>