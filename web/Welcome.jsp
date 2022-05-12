 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>

        <%@include file="header.html" %>

    <center>
        <%
            if (session.getAttribute("name") == null) {
                response.sendRedirect("Login.jsp");
            }%>
        <div class="d-inline-flex p-2 bd-highlight">

            <div class="container">
                <div style="align:center;">
                     <div class="row"> <a href="logout.jsp"  style="Font-Size:Large; text-align: right;">LogOut</a></div>
                <div class="row">
                    <h1 style=" font-size: 35px; font-weight: bold; background-color: #CCFFFF; border-top-style: solid; border-bottom-style: solid;" 
                        align="center">Welcome to full access control panel</h1><br />
                </div>
                <table align="center">
                    <tr><td class="style2"><b>
                                <span >Hi !  </span></b></td>
                        <td class="style1">
                            <span > <%=session.getAttribute("name")%> </span>  </td><td class="style6">
                        </td>
                        <td class="style5">
                            <img src="images/success.jpg"/>
                        </td></tr>

                    <tr><td class="style4"></td><td class="style3">&nbsp&nbsp                        
                        </td></tr>
                </table>
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
