/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Donates;

/**
 *
 * @author phucu
 */
public class DonateDTO {
    private int donateid;
    private int userid;
    private String bookname;
    private String bookauthor;
    private String booklanguage;
    private int bookQuantity;
    private String created_date;
    private String status;

    public String getBookauthor() {
        return bookauthor;
    }

    public void setBookauthor(String bookauthor) {
        this.bookauthor = bookauthor;
    }

    public String getBooklanguage() {
        return booklanguage;
    }

    public void setBooklanguage(String booklanguage) {
        this.booklanguage = booklanguage;
    }

    
    
    public int getDonateid() {
        return donateid;
    }

    public void setDonateid(int donateid) {
        this.donateid = donateid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public int getBookQuantity() {
        return bookQuantity;
    }

    public void setBookQuantity(int bookQuantity) {
        this.bookQuantity = bookQuantity;
    }



    public String getCreated_date() {
        return created_date;
    }

    public void setCreated_date(String created_date) {
        this.created_date = created_date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
