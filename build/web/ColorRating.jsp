<%@page import="utility.myArray"%>
<%@ page import="java.sql.*" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<%
    // if (session.getAttribute("name") == null) {
    // response.sendRedirect("Login.jsp");
    // }%>
<!DOCTYPE html>
<html>
    <script type="text/javascript">
        function chk() {
            //debugger;
            var allTextBoxes = [];
            for (var i = 9; i <= 16; i++) {
                var id = "Text" + i;
                var txtbox = document.getElementById(id);

                if (txtbox) {
                    
                    if (txtbox.value != null && txtbox.value.trim() == "" ) {
                        alert("Rating Number field cannot be empty/or Zero");
                        return false;
                    }                   
                    
                    allTextBoxes.push(txtbox.value);
                }
            }



            var sorted_arr = allTextBoxes.sort();

            for (var i = 0; i < allTextBoxes.length - 1; i++) {
                if (sorted_arr[i + 1] == sorted_arr[i]) {
                    alert("Please enter different value in each TextBox.");
                    return false;
                }
            }
        }


    </script>

    <style type="text/css">
        .style2 {
            height: 67px;
            width: 133px;
        }
        .style3
        {
            font-size: xx-large;
            font-weight: bold;
            height: 24px;
            width: 39px;
        }

        #Text
        {
            height: 91px;
        }


        .style4
        {
            height: 67px;
            width: 22px;
        }
        #Text10
        {
            width: 65px;
        }
        #Text11
        {
            width: 64px;
        }
        #Text12
        {
            width: 59px;
        }
        #Text13
        {
            width: 55px;
        }
        #Text14
        {
            width: 58px;
        }
        #Text15
        {
            width: 63px;
        }
        #Text16
        {
            width: 58px;
        }


        #Text9
        {
            width: 51px;
        }


        #Button1
        {
            width: 76px;
        }


    </style>
    <form id="form1" name="form1" method="post" action="cororRate">

        <div align="center">
            <h1 class="style3"  style="background-color: #CEFFFF; font-size: 35px; border-top-style: solid; border-bottom-style: solid; font-weight: bold; width: 1350px; height: 44px;">Color Rating Box</h1>
            <br />
            <br />
            <h2 align="center" style="color:red;">

                <%=session.getAttribute("MSG")%>
                <%
                    session.setAttribute("MSG", "");

                %>

            </h2>

            <br />
            <br />
            <table align="center" style="width: 843px">

                <tr><td class="style5"><b>
                            <span>Colors:</span></b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
                    <td class="style6" valign="top">

                        <%    // if (!"POST".equalsIgnoreCase(request.getMethod())) {
                            String[] fieldsToInclude = {"id", "name", "location"};
                            String[] ColorRating = new String[8];
                            String[] ColorName = new String[8];
                            String[] ColorID = new String[8];
                            String[] ColorAlphabet = new String[8];
                            Integer[] arr = new Integer[8];
                            try {
                                for (int i = 0; i < 8;) {
                                    Random rand = new Random();
//                               /1 + randomNumbers.nextInt(6);
                                    int randomNumber = rand.nextInt((8 + 1) - 1) + 1;

                                    if (myArray.contains(arr, randomNumber)) {

                                    } else {
                                        arr[i] = (randomNumber);
                                        i++;

                                    }

                                }
                                session.setAttribute("ColorID0", arr[0]);
                                session.setAttribute("ColorID1", arr[1]);
                                session.setAttribute("ColorID2", arr[2]);
                                session.setAttribute("ColorID3", arr[3]);
                                session.setAttribute("ColorID4", arr[4]);
                                session.setAttribute("ColorID5", arr[5]);
                                session.setAttribute("ColorID6", arr[6]);
                                session.setAttribute("ColorID7", arr[7]);
                                String sql = "";
                                //for display function
                                 Connection con = connection.Connect.makeCon();
                                for (int i = 0; i < 8; i++) {                                  

                                    sql = "SELECT * FROM ColorTable WHERE ColorID= " + arr[i] + "";
                                    // System.out.println(sql);
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery(sql);

                                    if (rs.next()) {
                                        ColorName[i] = rs.getString("colorname");
                                        ColorAlphabet[i] = rs.getString("coloralphabet");
                                    }
                                }
                                     con.close();
                                    session.setAttribute("ColorName0", ColorName[0]);
                                    session.setAttribute("ColorName1", ColorName[1]);
                                    session.setAttribute("ColorName2", ColorName[2]);
                                    session.setAttribute("ColorName3", ColorName[3]);
                                    session.setAttribute("ColorName4", ColorName[4]);
                                    session.setAttribute("ColorName5", ColorName[5]);
                                    session.setAttribute("ColorName6", ColorName[6]);
                                    session.setAttribute("ColorName7", ColorName[7]);

                                    session.setAttribute("ColorAlphabet0", ColorAlphabet[0]);
                                    session.setAttribute("ColorAlphabet1", ColorAlphabet[1]);
                                    session.setAttribute("ColorAlphabet2", ColorAlphabet[2]);
                                    session.setAttribute("ColorAlphabet3", ColorAlphabet[3]);
                                    session.setAttribute("ColorAlphabet4", ColorAlphabet[4]);
                                    session.setAttribute("ColorAlphabet5", ColorAlphabet[5]);
                                    session.setAttribute("ColorAlphabet6", ColorAlphabet[6]);
                                    session.setAttribute("ColorAlphabet7", ColorAlphabet[7]);
                                
                            } catch (Exception ee) {

                                System.out.println(ee.toString());
                            }

                        %>
                        <input id="Text1"  type="text" readonly="readonly" style="background-color: <%=ColorName[0]%>;"   class="style2" /></td> &nbsp <td class="style6">&nbsp;</td><td class="style6">
                        <input id="Text2" type="text"  readonly="readonly" style="background-color: <%=ColorName[1]%>;"  class="style2" /></td><td>&nbsp;</td><td>
                        <input id="Text3" type="text"  readonly="readonly" style="background-color: <%=ColorName[2]%>;"  class="style2" /></td><td>&nbsp;</td><td>
                        <input id="Text4" type="text"  readonly="readonly"  style="background-color: <%=ColorName[3]%>;" class="style2" /></td><td>&nbsp;</td><td>
                        <input id="Text5" type="text"  readonly="readonly"  style="background-color: <%=ColorName[4]%>;" class="style2" /></td><td>&nbsp;</td><td>
                        <input id="Text6" type="text"  readonly="readonly"  style="background-color: <%=ColorName[5]%>;" class="style2" /></td><td>&nbsp;</td><td>
                        <input id="Text7" type="text"  readonly="readonly" style="background-color: <%=ColorName[6]%>;"   class="style2" /></td><td>&nbsp;</td><td class="style5">
                        <input id="Text8" type="text"  readonly="readonly" style="background-color: <%=ColorName[7]%>;" class="style2" /></td>
                        <%//}%>
                <tr><td class="style5"><b>
                            <span  >Color Rating:</span></b></td>
                    <td class="style4">

                        <input id="Text9" name="Text9" type="text" style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" />



                    </td><td class="style6">
                        &nbsp;</td><td class="style6">


                        <input id="Text10" name="Text10" type="text"   style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td>
                        <input id="Text11" name="Text11" type="text"   style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td>
                        <input id="Text12" type="text" name="Text12"  style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td>
                        <input id="Text13" type="text" name="Text13"    style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td>
                        <input id="Text14" type="text"  name="Text14" style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td>
                        <input id="Text15" type="text" name="Text15"   style="height: 30px; border:solid;" onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td><td>
                        &nbsp;</td><td class="style5">
                        <input id="Text16" type="text" name="Text16"  style="height: 30px; border:solid;"  onkeypress="return /\d/.test(String.fromCharCode(((event || window.event).which || (event || window.event).which)));" 
                               MaxLength="1" TabIndex="1" /></td>
            </table>
            <br />
            <br /><br />


            <input  name="btn_next_clicked"  onclick= "return chk()" type="submit" value="  Next   " style="font-size: small;height:30px;  "  TabIndex="9" align="center"/>
        </div>

    </form>
</html>
