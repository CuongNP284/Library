/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Books;

/**
 *
 * @author phucu
 */
public class BookDTO {
    private int bookid;
    private String bookname;
    private String bookauthor;
    private String booktype;
    private String booklanguage;
    private int userID;
    private String borrowedStatus;
    

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    
    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getBookauthor() {
        return bookauthor;
    }

    public void setBookauthor(String bookauthor) {
        this.bookauthor = bookauthor;
    }

    public String getBooktype() {
        return booktype;
    }

    public void setBooktype(String booktype) {
        this.booktype = booktype;
    }

    public String getBooklanguage() {
        return booklanguage;
    }

    public void setBooklanguage(String booklanguage) {
        this.booklanguage = booklanguage;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getBorrowedStatus() {
        return borrowedStatus;
    }

    public void setBorrowedStatus(String borrowedStatus) {
        this.borrowedStatus = borrowedStatus;
    }

    
}
