<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>

        <%@include file="header.html" %>
        <%@include file="guestMenu.html" %>
    <center>
        <div class="d-inline-flex p-2 bd-highlight">

            <div class="container">
                <%
                    String str = null;
                    str = (String) session.getAttribute("MSG");
                    if (str != null) {
                %>
                <center><span style="font-size:large; font-weight: bold; color: green"><%=str%></span></center>
                    <%
                            session.removeAttribute("MSG");
                        } else {

                            session.setAttribute("MSG", "");
                        }

                    %>
                <legend>Login Page</legend>

                <form method="post" action="login">

                    <table style="width: 60%">



                        <tr>
                            <td class="style1" valign="top">
                                &nbsp;User&nbsp;Name&nbsp;
                            </td>
                            <td valign="top" align="">
                                <input type="text" name="uname" id="uname" size="20px" class="input-text"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="style1">
                                &nbsp;Password&nbsp;
                            </td>
                            <td align="">
                                <input type="password" name="txtpassword" id="txtpassword" size="20px" class="input-text"/>
                            </td>
                        </tr>
                        <%             String msg = (String) session.getAttribute("MSG");
                            if (msg != null) {
                        %>
                        <%
                                session.removeAttribute("MSG");
                            } else {
                                session.setAttribute("MSG", "");
                            }
                        %>
                        <tr>
                            <td class="style1">
                                &nbsp;</td>
                            <td align="">

                                <input type="submit" name="btnsubmit" id="btnsubmit" value="Login"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="reset" name="btnreset" id="btnreset" value="Reset"/></td>
                        </tr>



                    </table>

                    <div class="row">                           
                        <a href="forgetpassword.jsp">  |Forget Password |</a><a href="SignUp.jsp">| New User |</a>
                    </div>



                </form>  </center>
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
