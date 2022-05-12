/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

 
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class cororRate extends HttpServlet {

    HttpSession session = null;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = "";
        try {
            session = request.getSession(true);
            //////////////
            username =(String) session.getAttribute("name");
            String[] ColorRating = new String[8];
            String[] ColorName = new String[8];
            String[] ColorID = new String[8];
            String[] ColorAlphabet = new String[8];
            

            ColorRating[0] = request.getParameter("Text9");
            ColorRating[1] = request.getParameter("Text10");
            ColorRating[2] = request.getParameter("Text11");
            ColorRating[3] = request.getParameter("Text12");
            ColorRating[4] = request.getParameter("Text13");
            ColorRating[5] = request.getParameter("Text14");
            ColorRating[6] = request.getParameter("Text15");
            ColorRating[7] = request.getParameter("Text16");

            ColorID[0] = session.getAttribute("ColorID0").toString();
            ColorID[1] = session.getAttribute("ColorID1").toString();
            ColorID[2] = session.getAttribute("ColorID2").toString();
            ColorID[3] = session.getAttribute("ColorID3").toString();
            ColorID[4] = session.getAttribute("ColorID4").toString();
            ColorID[5] = session.getAttribute("ColorID5").toString();
            ColorID[6] = session.getAttribute("ColorID6").toString();
            ColorID[7] = session.getAttribute("ColorID7").toString();

            ColorName[0] = session.getAttribute("ColorName0").toString();
            ColorName[1] = session.getAttribute("ColorName1").toString();
            ColorName[2] = session.getAttribute("ColorName2").toString();
            ColorName[3] = session.getAttribute("ColorName3").toString();
            ColorName[4] = session.getAttribute("ColorName4").toString();
            ColorName[5] = session.getAttribute("ColorName5").toString();
            ColorName[6] = session.getAttribute("ColorName6").toString();
            ColorName[7] = session.getAttribute("ColorName7").toString();

            ColorAlphabet[0] = session.getAttribute("ColorAlphabet0").toString();
            ColorAlphabet[1] = session.getAttribute("ColorAlphabet1").toString();
            ColorAlphabet[2] = session.getAttribute("ColorAlphabet2").toString();
            ColorAlphabet[3] = session.getAttribute("ColorAlphabet3").toString();
            ColorAlphabet[4] = session.getAttribute("ColorAlphabet4").toString();
            ColorAlphabet[5] = session.getAttribute("ColorAlphabet5").toString();
            ColorAlphabet[6] = session.getAttribute("ColorAlphabet6").toString();
            ColorAlphabet[7] = session.getAttribute("ColorAlphabet7").toString();

            int result = 0;
            if ("".equalsIgnoreCase(username.trim())) {
                response.sendRedirect("Login.jsp");
                return;
            }
            // if (null != request.getParameter("button_fogetColorCode_clicked")) {
             String sqlquery ="";
            for (int i = 0; i < 8; i++) {
                Connection con2 =connection.Connect.makeCon();
            PreparedStatement pst;
                pst = null;
                 sqlquery = "INSERT INTO ColorRatingTable(UserName,ColorID,ColorName,ColorAlphabet,ColorRating) VALUES (?,?,?,?,?)";
               System.out.println();
                 pst = con2.prepareStatement(sqlquery);
                pst.setString(1, username);
                pst.setString(2, ColorID[i]);
                pst.setString(3, ColorName[i]);
                pst.setString(4, ColorAlphabet[i]);
                pst.setString(5, ColorRating[i]);
                result = result + pst.executeUpdate();
                con2.close();
                pst.close();
                
               Thread.sleep(100);
               System.out.println(sqlquery);
               sqlquery="";
            }
            
            if (result >= 8) {
                session.setAttribute("MSG", "Color Rating Successfull");
                response.sendRedirect("WebForm_UserInfo.jsp?name=" + username);
            } else {
                session.setAttribute("MSG", "Inser problem");
                response.sendRedirect("ColorRating.jsp?name=" + username);

            }
        } catch (Exception ex) {
            session.setAttribute("MSG", ex.toString());
            System.out.println(ex.toString());
            response.sendRedirect("ColorRating.jsp?name=" + username);
        }
        //}

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet cororRate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet cororRate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

}
