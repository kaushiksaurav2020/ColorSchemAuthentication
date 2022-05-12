
<%@page import="Sendmail.SendMailSSL"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <script type="text/javascript">
            function Verify() {
                var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
                var emailObj = document.getElementById("txtemail");
                if (emailObj.value == null || emailObj.value == "") {
                    alert("Enter email Id");
                    emailObj.focus();
                    return false;
                } else if (!emailpattern.test(emailObj.value)) {
                    alert("please enter valid e-mail address")
                    emailObj.focus();
                    return false;
                } else {
                    return true;
                }
            }
        </script>
    </head>
    <body>

        <%@include file="header.html" %>
        <%@include file="guestMenu.html" %>
    <center>
        <div class="d-inline-flex p-2 bd-highlight">

            <div class="container">
                
            <h1 style=" font-size: 35px; font-weight: bold; background-color: #CCFFFF;" 
                align="center">Password Recovery</h1><br />

            <form   method="post"  onSubmit="return ValidateEmail()" action="forgetpassword.jsp"> 
                <table align="center">
                    <tr><td class="style2"><b>
                                <span >User Name: </span></b></td>
                        <td class="style1">
                            <input  ID="txtuname" type="text" name="txtuname"/></td><td class="style6">
                        </td>
                        <td class="style5">
                        </td></tr>
                    <tr><td class="style2"><b>
                                <span >Email ID:</span>
                            </b></td><td class="style1">
                            <input type="text" ID="txtemail" name="txtemail">
                        </td>
                        <td class="style6">
                        </td>
                        <td class="style5">
                        </td></tr>
                    <tr><td class="style4"></td><td class="style3">&nbsp&nbsp                        
                            <input type="submit" name="Send" id="btnsubmit" value="Send"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="reset" name="btnreset" id="btnreset" value="Reset"/></td></tr>
                </table>
                <%
                    if ("POST".equalsIgnoreCase(request.getMethod())) {
                        try {
                            String email = request.getParameter("txtemail");
                            String result = "";
                            if (!"".equalsIgnoreCase(email.toString())) {
                                result = SendMailSSL.Sendpassword(email);
                %>
                <label style="font-weight:bold;margin:0 0 0.2em;"><%= result%></label>   
                <%}
                } catch (Exception ex) {%>
                <label style="font-weight:bold;margin:0 0 0.2em;"><%=ex.toString()%></label>    
                <%}
                    }
                %> 

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
