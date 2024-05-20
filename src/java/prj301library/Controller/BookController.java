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
import prj301library.Books.BookDAO;
import prj301library.Books.BookDTO;

/**
 *
 * @author phucu
 */
public class BookController extends HttpServlet {

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
            if (session == null || session.getAttribute("adminsession") == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            if (action == null || action.equals("list")) {//lists

                BookDAO dao = new BookDAO();
                List<BookDTO> list = dao.list(keyword, sortCol);
                request.setAttribute("booklist", list);

                request.getRequestDispatcher("/booklist.jsp").forward(request, response);

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

                request.setAttribute("book", book);//object
                RequestDispatcher rd = request.getRequestDispatcher("bookdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("edit")) {//edit
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

                request.setAttribute("book", book);
                request.setAttribute("nextaction", "update");
                RequestDispatcher rd = request.getRequestDispatcher("bookedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("create")) {//create
                BookDTO book = new BookDTO();
                request.setAttribute("book", book);
                request.setAttribute("nextaction", "insert");
                RequestDispatcher rd = request.getRequestDispatcher("bookedit.jsp");
                rd.forward(request, response);

            } else if (action.equals("update")) {//update
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String bookName = request.getParameter("bookName");
                String bookAuthor = request.getParameter("bookAuthor");
                String bookType = request.getParameter("bookType");
                String bookLanguage = request.getParameter("bookLanguage");

                BookDTO book = null;
                if (id != null) {
                    book = bookDAO.load(id);
                }
                book.setBookname(bookName);
                book.setBookauthor(bookAuthor);
                book.setBooktype(bookType);
                book.setBooklanguage(bookLanguage);
                bookDAO.update(book);
                request.setAttribute("book", book);
                RequestDispatcher rd = request.getRequestDispatcher("bookdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("insert")) {//insert
                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }
                String bookName = request.getParameter("bookName");
                String bookAuthor = request.getParameter("bookAuthor");
                String bookType = request.getParameter("bookType"); 
                String bookLanguage = request.getParameter("bookLanguage");

                BookDTO book = new BookDTO();
                book.setBookid(id);
                book.setBookname(bookName);
                book.setBookauthor(bookAuthor);
                book.setBooktype(bookType);
                book.setBooklanguage(bookLanguage);

                bookDAO.insert(book);
                request.setAttribute("book", book);
                RequestDispatcher rd = request.getRequestDispatcher("bookdetails.jsp");
                rd.forward(request, response);

            } else if (action.equals("delete")) {//delete

                Integer id = null;
                try {
                    id = Integer.parseInt(request.getParameter("id"));
                } catch (NumberFormatException ex) {
                    log("Parameter id has wrong format.");
                }

                bookDAO.delete(id);

                List<BookDTO> list = bookDAO.list(keyword, sortCol);
                request.setAttribute("booklist", list);
                RequestDispatcher rd = request.getRequestDispatcher("booklist.jsp");
                rd.forward(request, response);
                
            }else if (action.equals("showadmincart")) {
                BookDAO dao = new BookDAO();
                List<BookDTO> listofadmin = dao.listofadmin();
                request.setAttribute("listcart", listofadmin);

                request.getRequestDispatcher("admincart.jsp").forward(request, response);
                
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
