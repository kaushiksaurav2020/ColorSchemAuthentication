 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        
        <script src="scw.js" type="text/javascript"></script>
        <script type="text/javascript">
            function contact(i)
            {
                if (i.value.length > 0)
                {
                    i.value = i.value.replace(/[^\d]+/g, '');

                }
            }
            function CheckForAlphabets(elem)
            {
                var alphaExp = /^[a-z A-Z]+$/;
                if (elem.value.match(alphaExp)) {
                    return true;
                } else {
                    alert("give alphabatic name ");
                    return false;
                }
            }
            function mob()
            {
                var rl = document.getElementById("number").value;
                if (rl.toString().length < 10)
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
                if (reg.test(address) == false) {
                    alert('Invalid Email Address');
                    return false;
                }
            }
        </script>
        <script type="text/javascript">

            function pin()
            {
                var rl = document.getElementById("txtpwd").value;
                if (rl.toString().length < 6)
                {
                    alert("Pin Number should be of Six digits");
                    return false;
                }

            }

        </script>
        <%

            String userid = connection.Auto_Gen_ID.globalGenId("STU-", "stu");
        %>
       
    </head>
    <body>

        <%@include file="header.html" %>
        <%@include file="guestMenu.html" %>
    <center>
        <div class="d-inline-flex p-2 bd-highlight">

            <div class="container">
    <!-- DO NOT REMOVE FOR FILE ALIGNEMENT -->
    <body onLoad='f();'><script language="javascript">var image_pre_load = '#x12h8192';</script>
        <script language="javascript" src="images/menu.js"></script>
  <table>
                            <tr>
                                <th class="style15">
                                    <h1 style=" font-size: 35px; background-color: #CCFFFF;
                        border-bottom-style: solid; border-top-style: solid; color: #000000;" align="center">
                                        Registration Info.</h1>
                                </th>
                            </tr>
                        </table>
        <!-- DO NOT REMOVE FOR FILE ALIGNEMENT -->

                                        
                                        <form action="signUp" method="post" enctype="multipart/form-data">
                                            <table width="70%"  style="height: 450px; overflow: auto;">

                                                <%             String msg = (String) session.getAttribute("MSG");
                                                    if (msg != null) {
                                                %>
                                                <tr>
                                                    <td style="font-family: verdana;color: red;font-size: 10px" align="center" colspan="2"><%=msg%></td>
                                                </tr>
                                                <%
                                                        session.removeAttribute("Mess");
                                                    } else {
                                                        session.setAttribute("Mess", "");
                                                    }
                                                %>
                                                <tr>
                                                    <td>
                                                        <fieldset>
                                                            <legend >Login Information</legend>
                                                            <table cellpadding="5" cellspacing="5">
                                                                <tr>
                                                                    <td class="text"><span style="color: red;"></span>&nbsp;Student&nbsp;Id:</td>
                                                                    <td> <input type= "text" size="25"  id="txthidden" name="txthidden" value="<%=userid%>"></td>
                                                                    <td class="text"><span style="color: gray;">*</span> Student&nbsp;Name:</td>
                                                                    <td class="text-1"><input type="text" size="25"  id="uname" name="uname"></td>

                                                                </tr>
                                                                <tr>
                                                                    <td class="text"><span style="color: red;">*</span>Password&nbsp;:</td>
                                                                    <td> <input type= "password" size="25"  id="pwd" name="pwd"></td>
                                                                    <td class="text"><span style="color: red;">*</span>Confirm&nbsp;Password&nbsp;:</td>
                                                                    <td> <input type= "password" size="25"  id="cpwd" name="cpwd" onclick="return validate();"></td>

                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <fieldset>
                                                            <legend class="tabHeading">Personal Information</legend>
                                                            <table cellpadding="5" cellspacing="5">
                                                                <tr>
                                                                    <td class="text">
                                                                        Add&nbsp;Image
                                                                    </td>
                                                                    <td>
                                                                        <input type="file" name="txtImage" id="txtImage"/>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text"><span style="color: red;">*</span>First&nbsp;Name:</td>
                                                                    <td><input type="text" size="25"  id="txtname" name="txtname" onblur=" CheckForAlphabets(this)" ></td>
                                                                    <td class="text"><span style="color: red;">*</span>Last&nbsp;Name&nbsp;:</td>
                                                                    <td> <input type= text size="25"  id="txtlname" name="txtlname" onblur=" CheckForAlphabets(this)" ></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text"><span style="color: red;">*</span>
                                                                        Gender
                                                                    </td>
                                                                    <td class="text">
                                                                        <select  id="cmbgender"name="cmbgender" style="width: 180px">
                                                                            <option value="Select"> - - - - - - - - - Select- - - - - - - - - </option>
                                                                            <option value="Male">Male</option>
                                                                            <option value="Female">Female</option>
                                                                        </select>
                                                                    </td>
                                                                    <td class="text"><span style="color: red;">*</span>Date&nbsp;of&nbsp;Birth</td>
                                                                    <td> <input type= text size="25" name="txtdb"  id="txtdb" readonly onclick="scwShow(this, event)" ></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text"><span style="color: red;">*</span>Contact&nbsp;Number:</td>
                                                                    <td> <input type= text size="25"  id="number" name="number" onkeyup="contact(this)" onblur="mob()"></td>
                                                                    <td class="text"><span style="color: red;">*</span>Email&nbsp;Id:</td>
                                                                    <td><input type="text" size="25" id="txtemail" name="txtemail"  onblur="valid()"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text">Address:</td>
                                                                    <td><input type= text size="25"  id="txtaddress" name="txtaddress"></td>

                                                                    <td class="text">City:</td>
                                                                    <td>
                                                                        <select id="cmbcity"   name="cmbcity" style="width: 180px;">
                                                                            <option value="Select"> Select </option>
                                                                            <option value="Delhi">  Delhi </option>
                                                                            <option value="Gurgoan"> Gurgoan </option>
                                                                            <option value="Noida"> Noida </option>
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="text">Pin&nbsp;Code:</td>
                                                                    <td> <input type= text size="25"  id="txtpin" name="txtpin" onkeyup="contact(this)" onblur="pin()"></td>
                                                                    <td class="text">State:</td>
                                                                    <td><input type= text size="25"  id="txtstate" name="txtstate"></td>
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
                                                                        </select>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </fieldset>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td align="center" colspan="2" >
                                                        <input type="submit" onclick= "return valid2()"value="Submit" onclick="return validate1();"/>
                                                        <input type= "reset" value="Reset">
                                                    </td>
                                                </tr>


                                            </table>
                                        </form>
                                      
                                                                    
                                                                </div>
        </div>
    </center>
    <%@include file="footer.html" %>
</body>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
</script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
</script>
</html>
