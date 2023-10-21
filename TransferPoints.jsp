<%@page import="java.sql.*"%>
<%
    String source_pid=request.getParameter("spid");
    String destination_id=request.getParameter("dpid");
    String numberPoints=request.getParameter("npoints");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs1=stmt.executeQuery("Update Point_account Set Point_account.total_points = Point_account.total_points - "+numberPoints+" Where Point_account.pass_id =" + pass_id;
    ResultSet rs2 = stmt.executeQuery("Update Point_account Set Point_account.total_points = Point_account.total_points + " +numberPoints+" Where Point_account.pass_id =" + pass_id);
    output = numberPoints + " points successfully transferred!";
    con.close();
    out.print(output);
    %>