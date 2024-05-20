/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj301library.Books.BookDTO;
import prj301library.Users.UserDAO;
import prj301library.Users.UserDTO;

/**
 *
 * @author phucu
 */
public class UserLoginController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (action == null || action.equals("login")) {
                UserDAO dao = new UserDAO();
                UserDTO user = dao.login(username, password);

                if (user != null) {
                    HttpSession session = request.getSession(true);
                    session.setAttribute("usersession", user);
                    response.sendRedirect("home_page.jsp");
                } else {
                    request.setAttribute("error_user", "Username or password is incorrect! Please try again");
                    RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                    rd.forward(request, response);
                }
            } else if (action != null && action.equals("logout")) {
                HttpSession session = request.getSession(false);
                if (session != null) {
                    session.invalidate();
                }
                request.setAttribute("error_user", "Logout successfully");
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.forward(request, response);
            } else if (action.equals("create")) {//create
                UserDTO user = new UserDTO();
                request.setAttribute("user", user);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("user_edit.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String userFName = request.getParameter("userFName");
                String userLName = request.getParameter("userLName");
                String userEmail = request.getParameter("userEmail");
                String userName = request.getParameter("userName");
                String userPassword = request.getParameter("userPassword");
                String userContact = request.getParameter("userContact");

                UserDTO user = new UserDTO();
                user.setId(id);
                user.setUserfname(userFName);
                user.setUserlname(userLName);
                user.setUseremail(userEmail);
                user.setUsername(userName);
                user.setUserpassword(userPassword);
                user.setUsercontact(userContact);
                UserDAO userDAO = new UserDAO();
                userDAO.insert(user);
                
                request.setAttribute("user", user);
                RequestDispatcher rd = request.getRequestDispatcher("userlogin.jsp");
                rd.forward(request, response);

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
