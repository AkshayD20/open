import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class demoDatabase {
	
	public Connection getConnection()throws Exception{
Class.forName("org.postgresql.Driver");	
Connection con=DriverManager.getConnection("jdbc:postgresql://localhost:5432/bookingdemo","postgres","root");
		if(con!=null) {
			System.out.println("Database Conected.....1");
		}
		return con;
	}
/*	public ResultSet getAllDetails(String tname) throws Exception {
		Connection con=getConnection();
		Statement st=con.createStatement();
		String sql="select * from '"+tname+"'";
		ResultSet rs=st.executeQuery(sql);
		return rs;
	}*/
}
