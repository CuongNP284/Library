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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import prj301library.Books.BookDAO;
import prj301library.Books.BookDTO;

/**
 *
 * @author phucu
 */
public class UserBookController extends HttpServlet {

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
            String keyword = request.getParameter("keyword");
            if (keyword == null) {
                keyword = "";
            }
            String sortCol = request.getParameter("colSort");

            BookDAO bookDAO = new BookDAO();

            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("usersession") == null) {
                response.sendRedirect("userlogin.jsp");
                return;
            }
            if (action == null || action.equals("list")) {//lists

                BookDAO dao = new BookDAO();
                List<BookDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("userbooklist", list);

                request.getRequestDispatcher("/user_booklist.jsp").forward(request, response);

            } else if (action.equals("details")) {//details

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                BookDTO book = null;
                if (id != null) {
                    book = bookDAO.load(id);
                }

                request.setAttribute("userbook", book);//object
                RequestDispatcher rd = request.getRequestDispatcher("user_bookdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("addCart")) {
                int bookID = 0;
                try {
                    bookID = Integer.parseInt(request.getParameter("bookID"));
                } catch (Exception e) {
                    log("Parameter bookID has wrong format!");
                }

                int userID = 0;
                try {
                    userID = Integer.parseInt(request.getParameter("userID"));
                } catch (Exception e) {
                    log("Parameter userID has wrong format!");
                }

//                    BookDTO book = null;
//                    if(bookID != null){
//                        book = bookDAO.addbooktocart(userID, bookID);
//                    }
                try {
                    bookDAO.addbooktocart(userID, bookID);
                    log("added");
                } catch (Exception e) {
                    log("Parameter error!");
                }
                request.getRequestDispatcher("home_page.jsp").forward(request, response);

            } else if (action.equals("showcart")) {
                int userID = 0;
                try {
                    userID = Integer.parseInt(request.getParameter("userID"));
                } catch (Exception e) {
                    log("Parameter userID has wrong format!");
                }

                BookDAO dao = new BookDAO();
                List<BookDTO> listcart = dao.listCart(userID);
                request.setAttribute("listcart", listcart);

                request.getRequestDispatcher("usercart.jsp").forward(request, response);
                
            } else if (action.equals("return")) {
                int bookID = 0;
                try {
                    bookID = Integer.parseInt(request.getParameter("bookID"));
                } catch (Exception e) {
                    log("Parameter userID has wrong format!");
                }
                BookDAO dao = new BookDAO();
                boolean check = dao.returnBook(bookID);
                if (check == true) {
                    int userID = 0;
                    try {
                        userID = Integer.parseInt(request.getParameter("userID"));
                    } catch (Exception e) {
                        log("Parameter userID has wrong format!");
                    }

                    List<BookDTO> listcart = dao.listCart(userID);
                    request.setAttribute("listcart", listcart);

                    request.getRequestDispatcher("usercart.jsp").forward(request, response);
                }
                request.getRequestDispatcher("home_page.jsp").forward(request, response);
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
