<%@page import="java.sql.*"%>
<%
    String pass_id=request.getParameter("pid");
    String award_id=request.getParameter("awardid");
    DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
    String url="jdbc:oracle:thin:@artemis.vsnet.gmu.edu:1521/vse18c.vsnet.gmu.edu";
    Connection con=DriverManager.getConnection(url,"rnaderi","jumivofe");
    Statement stmt=con.createStatement();
    ResultSet rs=stmt.executeQuery("Select Awards.a_description, Awards.points_required, Passenger_redeem_award.redemption_date, Exchange_centers.center_name From Passenger_redeeem_award Join Awards on Passenger_redeem_award.award_id = Awards.award_id Join Passengers on Passenger_redeem_award.pass_id = Passengers.pass_id Join Exchange_centers on Passenger_redeem_award.center_id = Exchange_center.center_id Where Passenger_redeem_award.award_id = " + award_id +" and Passenger_redeem_awards.pass_id = " + pass_id );
    String output="";
    while(rs.next()){
        output+= rs.getObject("a_description") + ":" + rs.getObject("quantity")+":"+rs.getObject("redemption_date") + ":" + rs.getObject("center_name") + "#";
    }
    con.close();
    out.print(output);
    %>