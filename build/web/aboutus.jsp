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
        <div class="container">
            <p><h1>About us</h1></p>
          
        <p style="font-size:16px; text-align:justify; padding:0% 2%;letter-spacing:0.05em;">The proposed system using new Authentication technique consists of 3 phases: registration phase, login phase and verification phase. During registration, user enters his password in first method or rates the colors in the second method. During login phase, the user has to enter the password based on the interface displayed on the screen. The system verifies the password entered by comparing with content of the password generated during registration.</p>
        <p style="font-size:16px; text-align:justify; padding:0% 2%;letter-spacing:0.05em;">
            1.	The Session passwords are passwords that are used only once</p>
        <p style="font-size:16px; text-align:justify; padding:0% 2%;letter-spacing:0.05em;">2.	The users input different passwords.</p>
 <p style="font-size:16px; text-align:justify; padding:0% 2%;letter-spacing:0.05em;">3.	The session passwords provide better security against dictionary and brute force attacks as password changes for every session.

        </p>
        
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
