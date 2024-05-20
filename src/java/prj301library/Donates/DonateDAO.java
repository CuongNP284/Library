package prj301library.Donates;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301library.Books.BookDTO;
import prj301library.utils.DBUtils;

public class DonateDAO {

    public List<DonateDTO> list(String keyword, String sortCol) {
        List<DonateDTO> list = new ArrayList<DonateDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select dntID, userID, bookName, bookAuthor, bookLanguage, created_date, status from DonateOrders ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE bookName like ? or userID like ?";
            }

            if (sortCol != null && !sortCol.isEmpty()) {
                sql += " ORDER BY " + sortCol + " ASC ";
            }

            PreparedStatement stmt = con.prepareStatement(sql);

            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(1, "%" + keyword + "%");
                stmt.setString(2, "%" + keyword + "%");
            }
            ResultSet rs = stmt.executeQuery();
            if (rs != null) {
                while (rs.next()) {

                    int dntid = rs.getInt("dntID");
                    int userid = rs.getInt("userID");
                    String bookname = rs.getString("bookName");
                    String bookauthor = rs.getString("bookAuthor");
                    String booklanguage = rs.getString("bookLanguage");
                    
                    String created_date = rs.getString("created_date");
                    String status = rs.getString("status");

                    DonateDTO donate = new DonateDTO();
                    donate.setDonateid(dntid);
                    donate.setUserid(userid);
                    donate.setBookname(bookname);
                    donate.setBookauthor(bookauthor);
                    donate.setBooklanguage(booklanguage);
                 
                    donate.setCreated_date(created_date);
                    donate.setStatus(status);

                    list.add(donate);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public DonateDTO load(int id) {

        String sql = " select dntID, userID, bookName, bookAuthor, bookLanguage, created_date, status from DonateOrders where dntID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int dntid = rs.getInt("dntID");
                int userid = rs.getInt("userID");
                String bookname = rs.getString("bookName");
                String bookauthor = rs.getString("bookAuthor");
                String booklanguage = rs.getString("bookLanguage");
                
                String created_date = rs.getString("created_date");
                String status = rs.getString("status");

                DonateDTO donate = new DonateDTO();
                donate.setDonateid(dntid);
                donate.setUserid(userid);
                donate.setBookname(bookname);
                donate.setBookauthor(bookauthor);
                donate.setBooklanguage(booklanguage);
               
                donate.setCreated_date(created_date);
                donate.setStatus(status);

                return donate;
            }
        } catch (SQLException ex) {
            System.out.println("Query Plan error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public Integer insert(DonateDTO donate) {
        String sql = "insert into DonateOrders (userID, bookName, bookAuthor, bookLanguage, created_date, status) values(?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, donate.getUserid());
            ps.setString(2, donate.getBookname());
            ps.setString(3, donate.getBookauthor());
            ps.setString(4, donate.getBooklanguage());
            ps.setString(5, donate.getCreated_date());
            ps.setString(6, donate.getStatus());

            ps.executeUpdate();
            conn.close();
            return donate.getDonateid();
        } catch (SQLException ex) {
            System.out.println("Insert Donate Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    /*
    Update student and return Id
     */
    public boolean update(DonateDTO donate) {
        String sql = " UPDATE DonateOrders SET userID = ?, bookName = ?, bookAuthor = ?, bookLanguage = ?, created_date = ?, status = ? WHERE dntID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, donate.getUserid());
            ps.setString(2, donate.getBookname());
            ps.setString(3, donate.getBookauthor());
            ps.setString(4, donate.getBooklanguage());
            ps.setString(5, donate.getCreated_date());
            ps.setString(6, donate.getStatus());
            ps.setInt(7, donate.getDonateid());

            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Update Donate Order error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
}
