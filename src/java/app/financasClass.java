package app;

import app.iConfig;
import java.sql.*;
import java.sql.Connection.*;
import java.sql.DriverManager.*;
import java.sql.Statement.*;
import java.sql.ResultSet.*;
import java.sql.SQLException.*;

public class financasClass extends iConfig {

    Connection conn;
    Statement stmt;
    ResultSet rs;
    String resp;
    boolean respBool;

    public String getComboMes() throws ClassNotFoundException, SQLException {
        try{
            iConfig config = new iConfig();
            Class.forName(config.getDriver());
            conn=DriverManager.getConnection(config.getJdbc(),config.getUser(),config.getPSW());
            stmt=conn.createStatement();
            this.rs=stmt.executeQuery("select id,descricao from financas.mes");
            while(this.rs.next()){
                this.resp="<option value='"+this.rs.getInt("id")+"'>"+this.rs.getString("descricao")+"</option>";
            }
        }catch(SQLException e){
            e.getMessage();
        }
        return this.resp;
    }

}
