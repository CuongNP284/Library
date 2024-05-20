/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj301library.Books.BookDTO;
import prj301library.Donates.DonateDAO;
import prj301library.Donates.DonateDTO;

/**
 *
 * @author phucu
 */
public class UserDonateController extends HttpServlet {

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
            String action = request.getParameter("action");
            String keyword = request.getParameter("keyword");
            String userID = request.getParameter("userID");
            if (keyword == null) {
                keyword = "";
            }
            String sortCol = request.getParameter("colSort");

            DonateDAO donateDAO = new DonateDAO();
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usersession") == null) {
                response.sendRedirect("userlogin.jsp");
                return;
            }
            if (action == null || action.equals("list")) {//lists

                DonateDAO dao = new DonateDAO();
                List<DonateDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("donatelist", list);

                request.getRequestDispatcher("/user_donatelist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                DonateDTO donate = null;
                if (id != null) {
                    donate = donateDAO.load(id);
                }

                request.setAttribute("donate", donate);//object
                RequestDispatcher rd = request.getRequestDispatcher("user_donatedetails.jsp");
                rd.forward(request, response);

            }else if (action.equals("create")) {//create
                DonateDTO donate = new DonateDTO();
                request.setAttribute("donate", donate);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("user_donateedit.jsp");
                rd.forward(request, response);

            }else if (action.equals("insert")) {//insert
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                int userid = 0;
                try {
                    userid = Integer.parseInt(request.getParameter("userID"));
                } catch (NumberFormatException ex) {
                    log("Parameter userID has wrong format.");
                }
                String bookName = request.getParameter("bookName");
                String bookAuthor = request.getParameter("bookAuthor");
                String bookLanguage = request.getParameter("bookLanguage");
                String created_date = request.getParameter("created_date");
                String status = request.getParameter("status");
                int bookQuantity = 0;
                try {
                    bookQuantity = Integer.parseInt(request.getParameter("bookQuantity"));
                } catch (NumberFormatException ex) {
                    log("Parameter bookQuantity has wrong format.");
                }
                DonateDTO donate = new DonateDTO();
                donate.setBookname(bookName);
                donate.setBookauthor(bookAuthor);
                donate.setBooklanguage(bookLanguage);
                donate.setUserid(userid);
                donate.setCreated_date(created_date);
                donate.setStatus(status);
                donate.setBookQuantity(bookQuantity);

                donateDAO.insert(donate);
                request.setAttribute("donate", donate);
                RequestDispatcher rd = request.getRequestDispatcher("user_donatedetails.jsp");
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
