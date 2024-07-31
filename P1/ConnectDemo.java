package P1;
import java.sql.*;

public class ConnectDemo {
	public static Connection con;
	public static Statement stmt;
	public static void connect() {
		try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/todo", "root", "tiger");
	stmt = con.createStatement();
		}
		catch(Exception e) {
			
			}
		}
}