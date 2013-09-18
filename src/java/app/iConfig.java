package app;

/**
 *
 * @author admin
 */
public class iConfig {

    private String dbServer;
    private String dbUser;
    private String dbPsw;
    private String dbPort;
    private String dbDatabase;
    private String tplTitle;
    private String driver;
    private String jdbc;

    private void iConfig(){
        this.setDados();
    }

    private void setDados(){
        this.dbDatabase="financas";
        this.dbUser="root";
        this.dbServer="localhost";
        this.dbPort="3306";
        this.dbPsw="";
        this.tplTitle="";
        this.driver="com.mysql.jdbc.Driver";
        this.jdbc="jdbc:mysql://localhost/javascript";
                    
    }

    public String getDatabase(){
        return this.dbDatabase;
    }

    public String getUser(){
        return this.dbUser;
    }

    public String getPSW(){
        return this.dbPsw;
    }

    public String getDriver(){
        return this.driver;
    }

    public String getJdbc(){
        return this.jdbc;
    }

}
