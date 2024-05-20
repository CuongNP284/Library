/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prj301library.Admins;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import prj301library.utils.DBUtils;
public class AdminDAO {
    public AdminDTO login(String adminname, String password){
        AdminDTO admin = null;
        try {

            Connection con = DBUtils.getConnection();
            String sql = " Select adminID, adminName, adminFName From Admin ";
            sql += " WHERE adminName = ?  AND adminPassword = ?";

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, adminname);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs != null) {
                if (rs.next()) {

                    admin = new AdminDTO();
                    admin.setId(rs.getInt("adminID"));
                    admin.setAdminname(rs.getString("adminName"));
                    admin.setAdminfname(rs.getString("adminFName"));
                }
            }
            con.close();
        } catch (SQLException ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();

        }
        return admin;
    }
}
