/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Books;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301library.utils.DBUtils;

/**
 *
 * @author phucu
 */
public class BookDAO {

    public List<BookDTO> list(String keyword, String sortCol) {
        List<BookDTO> list = new ArrayList<BookDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select bookID, bookName, bookAuthor, bookType, bookLanguage from Books ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE bookName like ? or bookType like ? or bookLanguage like ? or bookAuthor like ?";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
                stmt.setString(3, "%" + keyword + "%");
                stmt.setString(4, "%" + keyword + "%");

            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int bookid = rs.getInt("bookID");
                    String bookname = rs.getString("bookName");
                    String bookauthor = rs.getString("bookAuthor");
                    String booktype = rs.getString("bookType");
                    String booklanguage = rs.getString("bookLanguage");

                    BookDTO book = new BookDTO();
                    book.setBookid(bookid);
                    book.setBookname(bookname);
                    book.setBookauthor(bookauthor);
                    book.setBooktype(booktype);
                    book.setBooklanguage(booklanguage);

                    list.add(book);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public BookDTO load(int id) {

        String sql = "select bookID, bookName, bookAuthor, bookType, bookLanguage from Books where bookID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int bookid = rs.getInt("bookID");
                String bookname = rs.getString("bookName");
                String bookauthor = rs.getString("bookAuthor");
                String booktype = rs.getString("bookType");
                String booklanguage = rs.getString("bookLanguage");

                BookDTO book = new BookDTO();
                book.setBookid(bookid);
                book.setBookname(bookname);
                book.setBookauthor(bookauthor);
                book.setBooktype(booktype);
                book.setBooklanguage(booklanguage);

                return book;
            }
        } catch (SQLException ex) {
            System.out.println("Query Plan error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(BookDTO book) {
        String sql = "INSERT INTO Books(bookName, bookAuthor, bookType, bookLanguage) VALUES (?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, book.getBookname());
            ps.setString(2, book.getBookauthor());
            ps.setString(3, book.getBooktype());
            ps.setString(4, book.getBooklanguage());

            ps.executeUpdate();
            conn.close();
            return book.getBookid();
        } catch (SQLException ex) {
            System.out.println("Insert Book error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    /*
    Update student and return Id
     */
    public boolean update(BookDTO book) {
        String sql = "UPDATE Books SET bookName = ?, bookAuthor = ?, bookType = ?, bookLanguage = ? WHERE bookID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, book.getBookname());
            ps.setString(2, book.getBookauthor());
            ps.setString(3, book.getBooktype());
            ps.setString(4, book.getBooklanguage());
            ps.setInt(5, book.getBookid());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Book error!" + ex.getMessage());
            ex.printStackTrace();
        }   
        return false;
    }

    /*
    Delete student 
     */
    public boolean delete(int id) {
        String sql = "DELETE Books WHERE bookID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete book error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public boolean addbooktocart(int userID, int bookID) {
        String sql = "UPDATE Books SET borrowedStatus = 'true', userID=? WHERE bookID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, bookID);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Add book error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }

    public boolean deletecart(int id) {
        String sql = "UPDATE Books SET borrowedStatus = 'false' WHERE bookID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete book error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
    
    public List<BookDTO> listofadmin() {
        List<BookDTO> list = new ArrayList<BookDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select * from Books where borrowedStatus = 'true' " ;
            

            PreparedStatement stmt = con.prepareStatement(sql);

            
               
            
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int userid = rs.getInt("userID");
                    int bookid = rs.getInt("bookID");
                    String bookname = rs.getString("bookName");
                    String bookauthor = rs.getString("bookAuthor");

                    BookDTO book = new BookDTO();
                    book.setUserID(userid);
                    book.setBookid(bookid);
                    book.setBookname(bookname);
                    book.setBookauthor(bookauthor);

                    list.add(book);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    
    
    public List<BookDTO> listCart(int userID) {
        List<BookDTO> list = new ArrayList<BookDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select * from Books where userID = ?";
            

            PreparedStatement stmt = con.prepareStatement(sql);

            
                stmt.setInt(1, userID);
                

            
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int bookid = rs.getInt("bookID");
                    String bookname = rs.getString("bookName");
                    String bookauthor = rs.getString("bookAuthor");
                    String booktype = rs.getString("bookType");
                    String booklanguage = rs.getString("bookLanguage");

                    BookDTO book = new BookDTO();
                    book.setBookid(bookid);
                    book.setBookname(bookname);
                    book.setBookauthor(bookauthor);
                    book.setBooktype(booktype);
                    book.setBooklanguage(booklanguage);

                    list.add(book);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    
    
    public boolean  returnBook(int bookID) {

        try {
            Connection con = DBUtils.getConnection();
            String sql = " UPDATE Books SET borrowedStatus = 'null', userID=null WHERE bookID = ?";
            

            PreparedStatement stmt = con.prepareStatement(sql);

            
                stmt.setInt(1, bookID);
                

            
            ResultSet rs = stmt.executeQuery();
            
            

            con.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    
}
