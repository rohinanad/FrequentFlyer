<%@page import="java.sql.*"%>
<%
    String pass_id=request.getParameter("pid");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select Flights.flight_id, Flights.flight_miles, Flights.destination, Passengers.pass_id From Flights Join Passengers On Passengers.pass_id = Flights.pass_id where Passengers.pass_id =" + pass_id );
    String output="";
    while(rs.next()){
        output+= rs.getObject("flight_id").toString() + ":" + rs.getObject("flight_miles").toString() + ":" +rs.getObject("destination").toString() + "#";
    }
    con.close();
    out.print(output);
    %>