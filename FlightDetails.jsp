<%@page import="java.sql.*"%>
<%
    String flight_id=request.getParameter("flightid");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select Flights.dept_datetime, Flights.arrival_datetime,Flights.flight_miles, Trips.trip_id, Trips.trip_miles From Flight_trips Join Flights on Flights.flight_id = Flight_trips.flight_id Join Trips On Trips.trip_id = Flight_trips.trip_id Where Flights.flight_id = " + flight_id);
    String output="";
    while(rs.next()){
        output+= rs.getObject("dept_datetime").toString() + "&" + rs.getObject("arrival_datetime").toString()+"&"+rs.getObject("flight_miles").toString() + "&" + rs.getObject("trip_id").toString() + "&" + rs.getObject("trip_miles").toString() + "#";
    }
    con.close();
    out.print(output);
    %>