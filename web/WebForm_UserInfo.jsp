 
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("name") == null) {
        response.sendRedirect("Login.jsp");
    }%>
<!DOCTYPE html>
<html>
    <style type="text/css">
        .style3
        {
            height: 220px;
        }
        .style4
        {
            width: 112px;
        }

        .style5
        {
            width: 92px;
        }

    </style>

    <body> 
        <%

            String context = config.getServletContext().getRealPath("/");
            String imagePath = context + "/UploadedImage";
            String username = request.getParameter("name");
            String userid = "";
            String fname = "";
            String lname = "";
            String gender = "";
            String dob = "";
            String cno = "";
            String email = "";
            String add = "";
            String city = "";
            String pin = "";
            String state = "";
            String country = "";
            String imgname = "";
            String[] ColorAlphabet = new String[8];
            Connection con = null;
            PreparedStatement pst = null;
            ResultSet rst = null;
            String query = "";
            try {
                ///for color pass
                for (int i = 0; i < 8; i++) {
                    con = connection.Connect.makeCon();
                    query = "SELECT * from ColorRatingTable where username ='" + username + "' AND ColorRating ='" + (i + 1) + "' order by ColorRating ASC";
                    System.out.println(query);
                    pst = con.prepareStatement(query);
                    rst = pst.executeQuery();
                    if (rst.next()) {

                        ColorAlphabet[i] = rst.getString("coloralphabet");

                    }
                    query = "";
                    con.close();
                    pst.close();
                    rst.close();
                }

                String colorpassString = ColorAlphabet[0] + ColorAlphabet[1] + ColorAlphabet[2] + ColorAlphabet[3] + ColorAlphabet[4] + ColorAlphabet[5] + ColorAlphabet[6] + ColorAlphabet[7];

                con = connection.Connect.makeCon();
                 query = "select * from signup where uname ='" + username + "'";

                pst = con.prepareStatement(query);
                rst = pst.executeQuery();
                if (rst.next()) {

                    userid = rst.getString(1);

                    fname = rst.getString(4);
                    lname = rst.getString(5);
                    gender = rst.getString(6);
                    dob = rst.getString(7);
                    cno = rst.getString(8);
                    email = rst.getString(9);
                    add = rst.getString(10);
                    city = rst.getString(11);
                    pin = rst.getString(12);
                    state = rst.getString(13);
                    country = rst.getString(14);
                    imgname = rst.getString("image");
                }
                con.close();

        %>



        <form action="ColorGrid.jsp" method="post">

            <div  style="width: 1350px; float: none; ">
                <table style="width: 1270px"><tr><th>
                    <h1 style="width: 1350px; height: 44px; font-size:35px; background-color: #CCFFFF; border-bottom-style: solid; border-top-style: solid; color: #000000; margin-bottom: 35px;" 
                        align=center >User Details</h1></th></tr></table>
            </div>
            <div style="float:left;width:39%; height: 247px;">


                <table style="width:99%; height:254px;">
                    <tr><td style="font-family:Arial;font-Size:large; font-weight: bold; text-align: center;" 
                            class="style4">User Name:</td><td class="style5">

                            <input id="Text1" type="text" value='<%=username%>'  readonly="readonly"   style="font-family: 'readonlycomic Sans MS'; font-size: large; font-weight: bold; color: #0000CC" />



                        </td></tr>

                    <tr><td style="font-family:Arial;font-Size:large; text-align: center; font-weight: bold;" 
                            class="style4">Email:</td><td class="style5">
                            <input id="Text1" type="text" value='<%=email%>'  readonly="readonly" style="font-family: 'comic Sans MS'; font-size: large; font-weight: bold; color: #0000CC" />
                        </td></tr>

                    <tr><td style="font-family:Arial;font-Size:large; font-weight: bold; text-align: center;" 
                            class="style4">Mobile No:</td><td class="style5">
                            <input id="Text1" type="text" value='<%=cno%>' readonly="readonly" style="font-family: 'comic Sans MS'; font-size: large; font-weight: bold; color: #0000CC" />
                        </td></tr>

                    <tr><td style="font-family:Arial;font-Size:large; font-weight: bold; text-align: center;" 
                            class="style4">Color Code:</td><td class="style5">
                            <input id="Text1" type="text" value='<%=colorpassString%>'  readonly="readonly" style="font-family: 'comic Sans MS'; font-size: large; font-weight: bold; color: #0000CC" />
                        </td></tr>

                    <tr><td style="font-family:Arial;font-Size:large; font-weight: bold; text-align: center;" 
                            class="style4">Location:</td><td class="style5">
                            <input id="Text1" type="text" value='<%=country%>' readonly="readonly" style="font-family: 'comic Sans MS'; font-size: large; font-weight: bold; color: #0000CC" />
                        </td></tr>
                </table>

                <input type="submit" value="Next"  />

            </div>
            <table style="width: 182px; height: 220px"><tr><td class="style3">
                        <img  src="UploadedImage/<%=imgname%>" style="height: 211px;width: 177px;" /></td></tr>
            </table>
            <%
                } catch (Exception ex) {
                }
            %>
        </form>
    </body>
</html>
