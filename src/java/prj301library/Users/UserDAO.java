/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import prj301library.Admins.AdminDTO;
import prj301library.Books.BookDTO;
import prj301library.Donates.DonateDTO;
import prj301library.utils.DBUtils;

/**
 *
 * @author phucu
 */
public class UserDAO {

    public UserDTO login(String username, String password) {
        UserDTO user = null;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " Select username, userFName, userID From Users ";
            sql += " WHERE username = ?  AND userPassword = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {

                    user = new UserDTO();
                    user.setUsername(rs.getString("username"));
                    user.setUserfname(rs.getString("userFName"));
                    user.setId(rs.getInt("userID"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return user;
    }

    public Integer insert(UserDTO user) {
        String sql = "INSERT INTO Users(userFName, userLName, userEmail, userContact, userName, userPassword) VALUES (?, ?, ?, ?, ?, ?)";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, user.getUserfname());
            ps.setString(2, user.getUserlname());
            ps.setString(3, user.getUseremail());
            ps.setString(4, user.getUsercontact());
            ps.setString(5, user.getUsername());
            ps.setString(6, user.getUserpassword());

            ps.executeUpdate();
            conn.close();
            return user.getId();
        } catch (SQLException ex) {
            System.out.println("Insert User error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public List<UserDTO> list(String keyword, String sortCol) {
        List<UserDTO> list = new ArrayList<UserDTO>();
        try {
            Connection con = DBUtils.getConnection();
            String sql = " select userID, userFName, userLName, userEmail, userContact, username, userpassword from Users ";
            if (keyword != null && !keyword.isEmpty()) {
                sql += " WHERE userFName like ? or userLName like ? or username like ? or userID like ?";
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

                    int userid = rs.getInt("userID");
                    String userfname = rs.getString("userFName");
                    String userlname = rs.getString("userLName");
                    String useremail = rs.getString("userEmail");
                    String usercontact = rs.getString("userContact");
                    String username = rs.getString("username");
                    String userpassword = rs.getString("userpassword");

                    UserDTO user = new UserDTO();

                    user.setId(userid);
                    user.setUserfname(userfname);
                    user.setUserlname(userlname);
                    user.setUseremail(useremail);
                    user.setUsercontact(usercontact);
                    user.setUsername(username);
                    user.setUserpassword(userpassword);

                    list.add(user);
                }
            }

            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }

    public UserDTO load(int id) {

        String sql = " select userID, userFName, userLName, userEmail, userContact, username, userpassword from Users where userID = ?";

        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                int userid = rs.getInt("userID");
                String userfname = rs.getString("userFName");
                String userlname = rs.getString("userLName");
                String useremail = rs.getString("userEmail");
                String usercontact = rs.getString("userContact");
                String username = rs.getString("username");
                String userpassword = rs.getString("userpassword");

                UserDTO user = new UserDTO();

                user.setId(userid);
                user.setUserfname(userfname);
                user.setUserlname(userlname);
                user.setUseremail(useremail);
                user.setUsercontact(usercontact);
                user.setUsername(username);
                user.setUserpassword(userpassword);

                return user;
            }
        } catch (SQLException ex) {
            System.out.println("Query Plan error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return null;
    }

    public boolean delete(int id) {
        String sql = "DELETE Users WHERE userID = ? ";
        try {

            Connection conn = DBUtils.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, id);

            ps.executeUpdate();
            conn.close();
            return true;
        } catch (SQLException ex) {
            System.out.println("Delete user error!" + ex.getMessage());
            ex.printStackTrace();
        }

        return false;
    }
}
