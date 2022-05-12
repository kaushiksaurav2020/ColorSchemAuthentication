
package connection;
 
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sun.security.pkcs11.wrapper.Functions;

@WebServlet(name = "ColorGrid", loadOnStartup = 1, urlPatterns = {"/ColorGrid", "/Login", "/forgetColorCode"})
public class ColorGrid extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    String name = null;
    String opass = null;
    String npass = null;

    String SessionPassword[] = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        String upass = request.getParameter("txtSessionPassword");
        String username = (String) session.getAttribute("name");
        if (null != request.getParameter("button_fogetColorCode_clicked")) {
            {
                try {
                    out.write("buton forgetcolorcode clidcked");
                    String emailid = (String) session.getAttribute("email");
                    if (emailid != null) {
                        String mrespo = Sendmail.SendMailSSL.Sendpassword(emailid);
                        session.setAttribute("MSG", mrespo);
                        response.sendRedirect("ColorGrid.jsp");
                    }
                } catch (Exception ex) {
                    System.out.println(ex.toString());
                    session.setAttribute("MSG", ex.getMessage());
                }
            }
        } else if (null != request.getParameter("button_login_clicked")) {
            Object[] Rating = null;
            Rating[0] = session.getAttribute("Rating0");
            Rating[1] = session.getAttribute("Rating1");
            Rating[2] = session.getAttribute("Rating2");
            Rating[3] = session.getAttribute("Rating3");
            Rating[4] = session.getAttribute("Rating4");
            Rating[5] = session.getAttribute("Rating5");
            Rating[6] = session.getAttribute("Rating6");
            Rating[7] = session.getAttribute("Rating7");
            try {
                // if ((int)session("flag") == 1)
                {
                    for (int i = 0; i < 8; i = i + 2) {
                        Connection conn3 = Connect.makeCon();
                        String sql = "SELECT * FROM ColorGridTable WHERE UserName='" + username + "' AND ButtonName= '" + ("Button" + Rating[i] + Rating[i + 1]) + "'";
                        pst = con.prepareStatement(sql);
                        rs = pst.executeQuery();
                        if (rs.next()) {

                            SessionPassword[i] = rs.getString("ButtonValue");
                        }
                        conn3.close();
                    }

                    String OTP = SessionPassword[0] + SessionPassword[2] + SessionPassword[4] + SessionPassword[6];
                    

                    if (!"".equalsIgnoreCase(OTP) &&(!"".equalsIgnoreCase(upass))){
                        if(OTP == upass)
                        {
                        response.sendRedirect("Welcome.jsp");
                        }
                    } else {
                        session.setAttribute("MSG", "Invalid   Session Password");

                    }
                }
            } catch (Exception ex) {
                System.out.println(ex.toString());
            }
            //response.sendRedirect("Welcome.jsp?par="+request.getParameter("txtSessionPassword"));
        }

//else if(null != request.getParameter("button_c_clicked"))
//  // do 'C' stuff
//        
    }

}
