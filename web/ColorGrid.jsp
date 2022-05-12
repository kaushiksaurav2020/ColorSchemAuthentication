
<%@page import="utility.myArray"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    try {
        if (session.getAttribute("name") == null) {
            response.sendRedirect("Login.jsp");
        }
    } catch (Exception e) {
        response.sendRedirect("Login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <script>
            function moveNumbers(event) {


                var no = document.getElementById(event).value;
                var txt = document.getElementById("txtSessionPassword").value;
                txt = txt + no;
                if (txt.length <= 4)
                    document.getElementById("txtSessionPassword").value = txt;
            }
        </script>

        <style type="text/css">
            .style10
            {
                width: 88px;
            }
            .style11
            {
                width: 87px;
            }
            .style12
            {
                width: 85px;
            }
            .style13
            {
                width: 86px;
            }
            .style14
            {
                width: 56px;
            }
            .style15
            {
                width: 64px;
            }
            .style16
            {
                width: 62px;
            }
            .style17
            {
                width: 1377px;
            }
        </style>
    </head>
    <body> 
        <table>
            <tr> 
                <th >
                    <h1 align="center"  style="width: 1350px; height: 43px; background-color: #CEFFFF; font-family: 'Times New Roman', Times, serif; color: #000000; border-top-style: solid; border-bottom-style: solid; font-size: 35px;">Session Password Using 8x8 Grid</h1>
                    <a href="logout.jsp"  style="Font-Size:Large; text-align: right;">LogOut</a>
                    <p> <input type="button" value="Get OTP" id="btnotp"/></p>
                    <p> <div id="somediv"> </div></p>

                </th>
            </tr>

            <tr><td>  <tr><td colspan="4">  
                    <h2 align="center" style="color:red;">

                        <%             String msg = (String) session.getAttribute("MSG");
                            if (msg != null) {
                        %>
                        <%=msg%>

                        <%}
                            session.setAttribute("MSG", "");

                        %>

                    </h2></td></tr>
        </table>
        <%  String username = session.getAttribute("name").toString();
            Integer[] arr = new Integer[8];
            //rand naumber color gen
            for (int i = 0; i < 8;) {
                Random rand = new Random();

                int randomNumber = rand.nextInt((8 + 1) - 1) + 1;

                if (myArray.contains(arr, randomNumber)) {

                } else {
                    arr[i] = (randomNumber);
                    i++;

                }

            }
            //-------------------end the randam function
            //------------start showColorbox --fucntion-----
            int[] Rating = new int[8];

            String[] ColorName = new String[8];
            String sql = "";
            String sql2 = "";
            Connection con = null;
            con = connection.Connect.makeCon();
            Connection conn2 = null;
            Statement stmt2;
            ResultSet rs2;
            conn2 = connection.Connect.makeCon();
            for (int i = 0; i < 8; i++) {

                int id = arr[i];
                sql = "SELECT * FROM ColorTable WHERE ColorID='" + id + "'";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(sql);

                if (rs.next()) {
                    ColorName[i] = rs.getString("ColorName");
                    System.out.println(" ColorName =" + rs.getString("ColorName"));
                }

                sql2 = "SELECT * FROM ColorRatingTable WHERE UserName= '" + username + "' AND ColorName='" + ColorName[i] + "'";
                System.out.println("==" + sql2);
                stmt2 = conn2.createStatement();
                rs2 = stmt2.executeQuery(sql2);

                if (rs2.next()) {
                    Rating[i] = rs2.getInt("ColorRating");
                    System.out.print(" ColorRating =" + rs.getString("ColorRating"));

                }

                Thread.sleep(100);
            }
            con.close();
            conn2.close();

            ///------------------end the show colorboxfunction---------
            session.setAttribute("Rating0", Rating[0]);
            session.setAttribute("Rating1", Rating[1]);
            session.setAttribute("Rating2", Rating[2]);
            session.setAttribute("Rating3", Rating[3]);
            session.setAttribute("Rating4", Rating[4]);
            session.setAttribute("Rating5", Rating[5]);
            session.setAttribute("Rating6", Rating[6]);
            session.setAttribute("Rating7", Rating[7]);
        %>


        <table style="width: 999px" align="center"> 

            <tr>
                <td class="style10">
                    <input id="TextBox1" name="TextBox1" type="text"  style="background-color: <%=ColorName[0]%>; BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />

                </td><td>
                    <input id="Text2"  name="TextBox2" type="text"  style="background-color: <%=ColorName[1]%>; BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td class="style11">
                    <input id="Text3" name="TextBox3" type="text"  style="background-color: <%=ColorName[2]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td>
                    <input id="Text4"  name="TextBox4" type="text"  style="background-color: <%=ColorName[3]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td class="style12">
                    <input id="Text5" name="TextBox5"  type="text"  style="background-color: <%=ColorName[4]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td>
                    <input id="Text6"  name="TextBox6" type="text"  style="background-color: <%=ColorName[5]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td class="style13">
                    <input id="Text7"  name="TextBox7" type="text"  style="background-color: <%=ColorName[6]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>
                <td>
                    <input id="Text8"  name="TextBox8" type="text"  style="background-color: <%=ColorName[7]%>;BorderStyle:Solid ;Height:80px; Width:75px;"  readonly  />
                </td>

            </tr>
            <tr><td class="style10">

                    <span id="lable1" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[0]%></span>

                </td><td>
                    &nbsp <span id="lable2" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[1]%></span></td><td>
                    &nbsp <span id="lable3" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[2]%></span></td><td>
                    &nbsp <span id="lable4" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[3]%></span></td><td>
                    &nbsp <span id="lable5" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[4]%></span></td><td>
                    &nbsp <span id="lable6" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[5]%></span></td><td>
                    &nbsp <span id="lable7" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[6]%></span></td><td>
                    &nbsp <span id="lable8" style="font-family:Comic Sans MS;  Font-Size:Medium;"> <%= ColorName[7]%></span></td></tr>
        </table>
        <br />
        <%
            /// function start ButtonRandomValues-----------

            Random rnd = new Random();
            int nums;
            String[][] btn = new String[8][8];
            String[][] ButtonName = new String[8][8];

            ButtonName[0][0] = "Button11";
            ButtonName[4][0] = "Button51";
            ButtonName[0][1] = "Button12";
            ButtonName[4][1] = "Button52";
            ButtonName[0][2] = "Button13";
            ButtonName[4][2] = "Button53";
            ButtonName[0][3] = "Button14";
            ButtonName[4][3] = "Button54";
            ButtonName[0][4] = "Button15";
            ButtonName[4][4] = "Button55";
            ButtonName[0][5] = "Button16";
            ButtonName[4][5] = "Button56";
            ButtonName[0][6] = "Button17";
            ButtonName[4][6] = "Button57";
            ButtonName[0][7] = "Button18";
            ButtonName[4][7] = "Button58";

            ButtonName[1][0] = "Button21";
            ButtonName[5][0] = "Button61";
            ButtonName[1][1] = "Button22";
            ButtonName[5][1] = "Button62";
            ButtonName[1][2] = "Button23";
            ButtonName[5][2] = "Button63";
            ButtonName[1][3] = "Button24";
            ButtonName[5][3] = "Button64";
            ButtonName[1][4] = "Button25";
            ButtonName[5][4] = "Button65";
            ButtonName[1][5] = "Button26";
            ButtonName[5][5] = "Button66";
            ButtonName[1][6] = "Button27";
            ButtonName[5][6] = "Button67";
            ButtonName[1][7] = "Button28";
            ButtonName[5][7] = "Button68";

            ButtonName[2][0] = "Button31";
            ButtonName[6][0] = "Button71";
            ButtonName[2][1] = "Button32";
            ButtonName[6][1] = "Button72";
            ButtonName[2][2] = "Button33";
            ButtonName[6][2] = "Button73";
            ButtonName[2][3] = "Button34";
            ButtonName[6][3] = "Button74";
            ButtonName[2][4] = "Button35";
            ButtonName[6][4] = "Button75";
            ButtonName[2][5] = "Button36";
            ButtonName[6][5] = "Button76";
            ButtonName[2][6] = "Button37";
            ButtonName[6][6] = "Button77";
            ButtonName[2][7] = "Button38";
            ButtonName[6][7] = "Button78";

            ButtonName[3][0] = "Button41";
            ButtonName[7][0] = "Button81";
            ButtonName[3][1] = "Button42";
            ButtonName[7][1] = "Button82";
            ButtonName[3][2] = "Button43";
            ButtonName[7][2] = "Button83";
            ButtonName[3][3] = "Button44";
            ButtonName[7][3] = "Button84";
            ButtonName[3][4] = "Button45";
            ButtonName[7][4] = "Button85";
            ButtonName[3][5] = "Button46";
            ButtonName[7][5] = "Button86";
            ButtonName[3][6] = "Button47";
            ButtonName[7][6] = "Button87";
            ButtonName[3][7] = "Button48";
            ButtonName[7][7] = "Button88";

            //delte the exitign previous data of user
            try {
                con = connection.Connect.makeCon();
                String query = "DELETE FROM ColorGridTable WHERE UserName='" + username + "'";
                System.out.println("user id delied= " + query);
                PreparedStatement pst = con.prepareStatement(query);
                pst.execute(query);
                con.close();
            } catch (Exception ex) {
            }

            Connection con3 = null;
            Statement stmt3 = null;
            con3 = connection.Connect.makeCon();
            //delete first here 
            for (int i = 0; i < 8; i++) {
                for (int j = 0; j < 8; j++) {
                    Random rand = new Random();
                    int randomNumber = rand.nextInt((8 + 1) - 1) + 1;
                    // nums = rnd.Next(0, 10);
                    btn[i][j] = "" + randomNumber;
                    String query = "INSERT INTO ColorGridTable(UserName,ButtonName,ButtonValue) VALUES ('" + username + "','" + ButtonName[i][j] + "','" + btn[i][j] + "')";
                    stmt3 = con3.createStatement();
                    stmt3.executeUpdate(query);

                }

            }
            con.close();
            stmt3.close();

            //-------------end the buttonrandvalues-----
        %>

        <table align="center" border="2" width="25%" 
               style="font-family: 'Times New Roman', Times, serif">
            <tr>
                <td class="style14">

                    <div id="Button00" 
                         style="height: 30px; width: 60px; background-color: Green; vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        0</div>
                </td>
                <td class="style15">

                    <div id="Button01" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        1</div>
                </td>
                <td class="style16">
                    <div id="Button02" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        2 </div>
                </td>
                <td>
                    <div id="Button03" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        3 </div>
                </td>
                <td>
                    <div id="Button04" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center;border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        4 </div>
                </td>
                <td>
                    <div id="Button05" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        5 </div>
                </td>
                <td> <div id="Button06" 
                          style="height: 30px; width: 60px;  background-color: Pink; vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        6 </div></td>
                <td><div id="Button07" 
                         style="height: 30px; width: 60px; background-color: Pink;  text-align: center; vertical-align: middle; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        7</div>
                </td>
                <td>
                    <div id="Button08" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        8</div>
                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button10" 
                         style="height: 30px; width: 60px; background-color: Pink; vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        1</div>

                </td> <td height="30px" width="50px" >

                    <input id="Button11" name="Button11" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[0][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td> <td>
                    <input id="Button12" name="Button12" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td> <td>
                    <input id="Button13" name="Button13" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][2]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td> <td>
                    <input id="Button14" name="Button14" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td> <td>
                    <input id="Button15" name="Button15" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td> <td>
                    <input id="Button16" name="Button16" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td> <td>
                    <input id="Button17" name="Button17" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td> <td>
                    <input id="Button18" name="Button18" onclick="moveNumbers(this.id)" type="button" value='<%=btn[0][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>
            <tr>
                <td class="style14"> <div id="Button20"   style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        2</div>

                </td><td>
                    <input id="Button21" name="Button21" onclick="moveNumbers(this.id)" type="button" value='<%=btn[1][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button22" name="Button22" onclick="moveNumbers(this.id)" type="button" value='<%=btn[1][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button23" name="Button23" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[1][2]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button24" name="Button24" onclick="moveNumbers(this.id)" type="button" value='<%=btn[1][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button25" name="Button25"  onclick="moveNumbers(this.id)" type="button" value='<%=btn[1][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button26" name="Button26" onclick="moveNumbers(this.id)" type="button" value='<%=btn[1][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button27" name="Button27" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[1][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button28" name="Button28" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[1][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>
            <tr>
                <td class="style14">

                    <div id="Button30" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        3</div>

                </td><td>
                    <input id="Button31" name="Button31" onclick="moveNumbers(this.id)" type="button" value='<%=btn[2][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button32" name="Button32"  onclick="moveNumbers(this.id)" type="button" value='<%=btn[2][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button33" name="Button33" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[2][2]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button34" name="Button34" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[2][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button35" name="Button35" onclick="moveNumbers(this.id)" type="button" value='<%=btn[2][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button36" name="Button36" onclick="moveNumbers(this.id)" type="button" value='<%=btn[2][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button37" name="Button37" onclick="moveNumbers(this.id)"  type="button" value='<%=btn[2][6]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button38" name="Button38" onclick="moveNumbers(this.id)" type="button" value='<%=btn[2][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button40" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        4</div>
                </td><td>
                    <input id="Button41" name="Button41" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][0]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button42" name="Button42" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button43" name="Button43" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][2]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button44" name="Button44" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button45" name="Button45" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button46" name="Button46" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][5]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button47" name="Button47" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button48" name="Button48" onclick="moveNumbers(this.id)" type="button" value='<%=btn[3][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button50" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        5</div>

                </td><td>
                    <input id="Button51" name="Button51" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button52" name="Button52" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][1]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button53" name="Button53" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][2]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>

                    <input id="Button54" name="Button54" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button55" name="Button55" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button56" name="Button56" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button57" name="Button57" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button58" name="Button58" onclick="moveNumbers(this.id)" type="button" value='<%=btn[4][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button60" 
                         style="height: 30px; width: 60px; background-color: Pink;vertical-align: middle; text-align: center; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        6</div>

                </td><td>
                    <input id="Button61" name="Button61" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button62" name="Button62" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button63" name="Button63" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][2]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button64" name="Button64" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][3]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button65" name="Button65" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button66" name="Button66" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button67" name="Button67" onclick="moveNumbers(this.id)" type="button" value='<%=btn[5][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td><td>
                    <input id="Button68" name="Button68"  type="button" value='<%=btn[5][7]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>


                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button70" 
                         style="height: 30px; width: 60px; text-align: center; background-color: Pink; vertical-align: middle; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        7</div>
                </td><td>
                    <input id="Button71" name="Button71" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][0]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button72" name="Button72" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][1]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button73" name="Button73" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][2]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button74" name="Button74" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button75" name="Button75" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button76" name="Button76" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][5]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button77" name="Button77" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button78" name="Button78" onclick="moveNumbers(this.id)" type="button" value='<%=btn[6][7]%>' style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>
            <tr>
                <td class="style14">
                    <div id="Button80" 
                         style="height: 30px; width: 60px; background-color: Pink; text-align: center; vertical-align: middle; border-color: Black; border-style: solid; font-size: medium; font-weight: bold;">
                        8</div>

                </td><td>
                    <input id="Button81" name="Button81" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][0]%>'   style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button82" name="Button82" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][1]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button83" name="Button83" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][2]%>'   style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button84" name="Button84" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][3]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button85" name="Button85" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][4]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button86" name="Button86" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][5]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button87" name="Button87" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][6]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td><td>
                    <input id="Button88" name="Button88" onclick="moveNumbers(this.id)" type="button" value='<%=btn[7][7]%>'  style="font-weight: bold; font-family: 'Comic Sans MS'; font-size: small"/>

                </td>
            </tr>

        </table>
        <br />
        <form action="ColorGrid1" method="POST">

            <table align="center" style="width: 354px">
                <%
                    String[] Rating2 = new String[8];
                    Rating2[0] = session.getAttribute("Rating0").toString();
                    Rating2[1] = session.getAttribute("Rating1").toString();
                    Rating2[2] = session.getAttribute("Rating2").toString();
                    Rating2[3] = session.getAttribute("Rating3").toString();
                    Rating2[4] = session.getAttribute("Rating4").toString();
                    Rating2[5] = session.getAttribute("Rating5").toString();
                    Rating2[6] = session.getAttribute("Rating6").toString();
                    Rating2[7] = session.getAttribute("Rating7").toString();
                    //call to send opt on you mail
                    String opt = connection.ColorGrid1.getotp(username, Rating2);
                    session.setAttribute("curotp", opt);
                %>


                <tr><td>

                        <input id="txtSessionPassword" name="txtSessionPassword" type="text"   
                               MaxLength="4" style="font-weight: bold; font-size: large;visibility:false;  color: blue;width: 123px;"  />
                    </td>
                    <td>
                        <input  type="submit" name="button_login_clicked" value="Login"  style="font-weight: bold; font-size: small;height: 35px; width:60px;" align="left"   />

                    </td>
                    <td >

                        <!--
                                                    <input   type="submit" name="button_fogetColorCode_clicked" value="Forget Color Code"  style="font-weight: bold; font-size: small;height: 35px; width:150px;" />
                        -->
                    </td>
                </tr>
            </table>
        </form>

        <script src="http://code.jquery.com/jquery-latest.min.js"></script>
        <script>
                        $(document).ready(function () {
                            $('#btnotp').click(function () {

                                $.get('getServeletOtp', function (responseText) {
                                    $('#somediv').text(responseText);
                                });
                            });
                        });


                        $("#btnotp").click(function () {
                            $('#btnotp').attr("disabled", true);
                            $('#somediv').text('Wait...');

                            $.ajax({

                                url: 'getServeletOtp',
                                // data: {username: otp, otp: otp},

                                type: 'get',
                                cache: false,
                                success: function (data) {
                                    $('#btnotp').attr("disabled", false);
                                    $('#somediv').text(responseText);
                                },
                                error: function () {
                                    alert('error');
                                }
                            }
                            );
                        }
                        );
        </script>
    </body>

</html>
