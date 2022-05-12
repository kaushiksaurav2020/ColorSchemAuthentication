<%@page import="Sendmail.SendMailSSL"%>
<%  String email = request.getParameter("txtemail");
    String result = "";
    if (!"".equalsIgnoreCase(email.toString())) {
        result = SendMailSSL.Sendpassword(email);
%>
<label style="font-weight:bold;margin:0 0 0.2em;"><%= result%></label>   
<%}
%> 