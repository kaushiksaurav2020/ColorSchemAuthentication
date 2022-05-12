 
package connection;

import Sendmail.SendMailSSL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
public class getServeletOtp extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    HttpSession session = request.getSession(true);    
    String text = "OTP Send successfull"; //message you will recieve 
    String username = session.getAttribute("name").toString();
    String otp = session.getAttribute("curotp").toString();
   
    PrintWriter out = response.getWriter();
    out.println(SendMailSSL.Sendpassword(username, otp));
          //  request.getRequestDispatcher("/ColorGrid.jsp").forward(request, response);
    }
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
 
}
