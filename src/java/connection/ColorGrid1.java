package connection;

import Sendmail.SendMailSSL;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ColorGrid1 extends HttpServlet {
 
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ColorGrid1</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ColorGrid1 at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    public static String getotp(String username, String[] Rating) {
        Connection con = null;
        ResultSet rs = null;
        PreparedStatement pst = null;
        String OTP = "";
        String SessionPassword[] = new String[8];
 
        try {

            Connection conn3 = null;
            String sql3 = "";
            String email="";
            // if ((int)session("flag") == 1)
            {
                for (int i = 0; i < 8; i = i + 2) {
                    conn3 = connection.Connect.makeCon();
                    sql3 = "SELECT * FROM ColorGridTable WHERE UserName='" + username + "' AND ButtonName= '" + ("Button" + Rating[i] + Rating[i + 1]) + "'";
                    pst = conn3.prepareStatement(sql3);
                    rs = pst.executeQuery();
                    if (rs.next()) {
 
                        SessionPassword[i] = rs.getString("ButtonValue");
                    }
                    sql3 = "";
                    Thread.sleep(100);
                    conn3.close();
                    rs.close();
                }

                OTP = SessionPassword[0] + SessionPassword[2] + SessionPassword[4] + SessionPassword[6];
                //sending opt
                
                
               // SendMailSSL.Sendpassword(username, OTP);

            }
        } catch (Exception ex) {
            System.out.println(ex.toString());

        }
        return OTP;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    Connection con = null;
    ResultSet rs = null;
    PreparedStatement pst = null;
    String name = null;
    String opass = null;
    String npass = null;

    String SessionPassword[] = new String[8];

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
            try {
                String[] Rating = new String[8];
                Rating[0] = session.getAttribute("Rating0").toString();
                Rating[1] = session.getAttribute("Rating1").toString();
                Rating[2] = session.getAttribute("Rating2").toString();
                Rating[3] = session.getAttribute("Rating3").toString();
                Rating[4] = session.getAttribute("Rating4").toString();
                Rating[5] = session.getAttribute("Rating5").toString();
                Rating[6] = session.getAttribute("Rating6").toString();
                Rating[7] = session.getAttribute("Rating7").toString();
                Connection conn3 = null;
                String sql3 = "";
                // if ((int)session("flag") == 1)
                {
                    for (int i = 0; i < 8; i = i + 2) {
                        conn3 = connection.Connect.makeCon();
                        sql3 = "SELECT * FROM ColorGridTable WHERE UserName='" + username + "' AND ButtonName= '" + ("Button" + Rating[i] + Rating[i + 1]) + "'";
                        pst = conn3.prepareStatement(sql3);
                        rs = pst.executeQuery();
                        if (rs.next()) {

                            SessionPassword[i] = rs.getString("ButtonValue");
                        }
                        sql3 = "";
                        Thread.sleep(100);
                        conn3.close();
                        rs.close();
                    }

                    String OTP = SessionPassword[0] + SessionPassword[2] + SessionPassword[4] + SessionPassword[6];
                    out.write(OTP);

                     
                        if(OTP.equalsIgnoreCase(upass))
                        {
                            session.setAttribute("MSG", "Successfull OTP ");
                        response.sendRedirect("Welcome.jsp");
                        }
                    else {
                        session.setAttribute("MSG", "Invalid   Session Password");

                    }
                }
            } catch (Exception ex) {
                System.out.println(ex.toString());
                out.write(ex.toString());
            }
            //response.sendRedirect("Welcome.jsp?par="+request.getParameter("txtSessionPassword"));
        }

//else if(null != request.getParameter("button_c_clicked"))
//  // do 'C' stuff
//        
    }

}
