<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
 <%
if(session.getAttribute("name")==null) {
    //response.sendRedirect("Login.jsp");
}%>

      <%@page import="java.sql.*" %>
             <script src="scw.js" type="text/javascript"></script>
    <%
            String userid = (String) session.getAttribute("STU");

            String msg = (String) session.getAttribute("MSG");
%>
 <script type="text/javascript">
            function contact(i)
            {
                if(i.value.length>0)
                {
                    i.value = i.value.replace(/[^\d]+/g, '');

                }
            }
            function CheckForAlphabets(elem)
            {
                var alphaExp = /^[a-z A-Z]+$/;
                if(elem.value.match(alphaExp)){
                    return true;
                }else{
                    alert("give alphabatic name ");
                    return false;
                }
            }
            function mob()
            {
                var rl=document.getElementById("number").value;
                if(rl.toString().length<10)
                {
                    alert("Contact No. should be of ten digits");
                    return false;
                }

            }
        </script>
        <script type="text/javascript">
            function valid() {
                //alert('calling');
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                // var address = document.forms[form_id].elements[txtemail_id].value;
                var address = document.getElementById('txtemail').value;
                if(reg.test(address) == false) {
                    alert('Invalid Email Address');
                    return false;
                }
            }
        </script>
          <script type="text/javascript">

                 function pin()
            {
                var rl=document.getElementById("txtpwd").value;
                if(rl.toString().length<6)
                {
                    alert("Pin Number should be of Six digits");
                    return false;
                }

            }

        </script>
    
<meta name="description" content="Happy Family" />
<meta name="keywords" content="Happy Family" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>

<!-- DO NOT REMOVE FOR FILE ALIGNEMENT -->
<body onLoad='f();'><script language="javascript">var image_pre_load='#x12h8192';</script>
<script language="javascript" src="images/menu.js"></script>

<!-- DO NOT REMOVE FOR FILE ALIGNEMENT -->
<div id="wrapper">
  <div class="header">
    <div class="floatleft head2">
      <div id="wrapper2">
        <!-- header -->
        <div class="header">
          <div class="headertop"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft logo"><a href="index.html" title="Home"><img src="images/a3.gif" alt="Home" border="0" /></a></div>
          <div class="floatleft head2"><img src="images/" alt="" border="0" /></div>

        </div>
        <div class="header"><img src="images/educational.jpg" alt="" height="200px" width="882px;"  border="0" /></div>
        <div class="topmenu">
          <div class="floatleft white"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft black"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft grey"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft deepblue"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft menucontainergreen">
            <div class="floatleft menucontainerdeepblue">

              <div class="floatleft lightblue"><img src="images/spacer.gif" alt="" border="0" /></div>
              <div class="floatleft menucontainerlightblue">
                <div>
               <%@include file="user.html" %>
                </div>

              </div>
              <div class="floatleft lightblue"><img src="images/spacer.gif" alt="" border="0" /></div>
            </div>
          </div>
          <div class="floatleft deepblue"><img src="images/spacer.gif" alt="" border="0" /></div>

          <div class="floatleft grey"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft black"><img src="images/spacer.gif" alt="" border="0" /></div>
          <div class="floatleft white"><img src="images/spacer.gif" alt="" border="0" /></div>
        </div>
        <!-- /header -->
        <!-- middlecontent -->
        <div class="middlecontentwhite">
          <div class="middlecontentblack">
            <div class="middlecontentgrey">

              <div class="middlecontent">
                <div class="middlecontenttopbg"><img src="images/spacer.gif" alt="" border="0" /></div>
                <div class="spacerdiv"><img src="images/spacer.gif" alt="" border="0" /></div>
                <div class="left"><img src="images/spacer.gif" alt="" border="0" /></div>

              
             <form action="editMyAccount" method="post">
                        <table width="60%"  style="height: 450px; overflow: auto;" cellpadding="5" cellspacing="5">

                                <tr>
                <td class="text" colspan="1">
                    You are Welcome Mr.&nbsp;&nbsp;&nbsp;&nbsp;


                    <h2><%=userid%></h2>
                </td>

            </tr>

            <%
                        String imgpath = (String) session.getAttribute("IMG");
            %>
            <tr>
                <td>
                    <img src="UploadedImage/<%=imgpath%>" height="100x" width="100px;"/>
                </td>
            </tr>
                                <tr>
                                    <td>
                                        <fieldset>
                                            <legend class="text">Personal Information</legend>
                                            <table cellpadding="5" cellspacing="5" width="100%">
                                                <%
                                                            if (msg != null) {
                                                %>
                                                <tr>
                                                    <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="4"><%=msg%></td>
                                                </tr>
                                                <%
                                                                session.removeAttribute("MSG");
                                                            } else {
                                                                session.setAttribute("MSG", "");
                                                            }
                                                %>
                                                <%
                                                            Connection con = null;
                                                            PreparedStatement pst = null;
                                                            ResultSet rst = null;
                                                            try {
                                                                con = connection.Connect.makeCon();
                                                                String query = "select * from signup where uname ='" + userid + "'";
                                                                pst = con.prepareStatement(query);
                                                                rst = pst.executeQuery();
                                                                while (rst.next()) {

                                                                    String user_id = rst.getString(1);

                                                                    String fname = rst.getString(4);
                                                                    String lname = rst.getString(5);
                                                                    String gender = rst.getString(6);
                                                                    String dob = rst.getString(7);
                                                                    String cno = rst.getString(8);
                                                                    String email = rst.getString(9);
                                                                    String add = rst.getString(10);
                                                                    String city = rst.getString(11);
                                                                    String pin = rst.getString(12);
                                                                    String state = rst.getString(13);
                                                                    String country = rst.getString(14);


                                                %>


                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>First Name:</td>
                                                    <td>
                                                        <input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" value="<%=fname%>">
                                                        <input type="hidden" name="hiduid" id="hiduid" value="<%=user_id%>">
                                                    </td>
                                                    <td class="text"><span style="color: red;">*</span>Last Name :</td>
                                                    <td><input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" value="<%=lname%>" ></td>
                                                </tr>
                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>
                                                        Gender
                                                    </td>
                                                    <td>
                                                        <select  id="cmbgender"name="cmbgender" style="width: 180px" >
                                                            <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                            <option value="Male">Male</option>
                                                            <option value="Female">Female</option>
                                                            <option value="<%=gender%>" selected><%=gender%></option>
                                                        </select>
                                                    </td>
                                                    <td class="text"><span style="color: red;">*</span>Date of Birth</td>
                                                    <td><input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this,event)" value="<%=dob%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text"><span style="color: red;">*</span>Contact Number:</td>
                                                    <td><input type= text size="25"  id="number" name="number" onkeyup="CheckForIntegers(this)" onblur="mob(this)" value="<%=cno%>"></td>
                                                    <td class="text"><span style="color: red;">*</span>Email Id:</td>
                                                    <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur=" mail()" value="<%=email%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text">Address:</td>
                                                    <td><input type= text size="25"  id="txtaddress" name="txtaddress" value="<%=add%>" ></td>

                                                    <td class="text">City:</td>
                                                    <td>
                                                        <select id="cmbcity"   name="cmbcity" style="width: 180px;">
                                                            <option value="Select"> Select </option>
                                                            <option value="Delhi">  Delhi </option>
                                                            <option value="Gurgoan"> Gurgoan </option>
                                                            <option value="Noida"> Noida </option>
                                                            <option value="<%=city%>" selected><%=city%></option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="text">Pin Code:</td>
                                                    <td> <input type= text size="25"  id="txtpin" name="txtpin" value="<%=pin%>"></td>
                                                    <td class="text">State:</td>
                                                    <td><input type= text size="25"  id="txtstate" name="txtstate" value="<%=state%>"></td>
                                                </tr>
                                                <tr>
                                                    <td class="text">Country:</td>
                                                    <td>
                                                        <select  id="cmbcountry"name="cmbcountry" style="width:180px">
                                                            <option value="Select">- - - - Select - - - - </option>
                                                            <option value="America">America</option>
                                                            <option value="Australia">Australia</option>
                                                            <option value="Africa">Africa</option>
                                                            <option value="Bangalore">Bangalore</option>
                                                            <option value="Bangkok">Bangkok</option>
                                                            <option value="India">India</option>
                                                            <option value="<%=country%>" selected><%=country%></option>
                                                        </select>
                                                    </td>
                                                </tr>
                                                <%

                                                                }
                                                            } catch (Exception e) {
                                                                e.printStackTrace();
                                                            }


                                                %>

                                                <tr><td>&nbsp;</td></tr>
 <tr>
                                                    <td align="center" colspan="4" >
                                                        <input type="submit" onclick= "return valid2()"value="Edit" class="button">
                                                        <input type="reset" value="Reset" class="button">
                                                    </td>
                                                </tr>
                                            </table>
                                        </fieldset>
                                    </td>
                                </tr>


                        </table>
                    </form>
                <div class="footerspacer"><img src="images/spacer.gif" alt="" border="0" /></div>
              </div>
            </div>
          </div>
        </div>
        <!-- /middlecontent -->
        <!-- footer  maintain license info in footer   -->
        <div class="footerwhite">

          <div class="footerblack">
            <div class="footergrey">
              <div class="footerlightgrey">
                <div class="innerfootercontent" style="text-align:right;">
                  <div style="margin-top:62px; margin-right:10px; color: green;">
                      <h3> Copyright &copy;Virtual Class Room</h3>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
<div class="footerbottom"><img src="images/spacer.gif" alt="" border="0" /></div>


</div>
</body>
</html>

