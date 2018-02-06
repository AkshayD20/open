
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getParameter("name").equals("admin") && request.getParameter("upass").equals("admin")) {
			HttpSession session = request.getSession();
			session.setAttribute("name", request.getParameter("name"));
			request.setAttribute("result", "Login successfull.");
			request.getRequestDispatcher("Aindex.jsp").forward(request, response);
		}
		demoDatabase db = new demoDatabase();
		String sql = "SELECT \"pId\", \"pName\", \"pAddress\", \"pGender\", \"pEmail\", \"pPhoneNo\", \"pAdhar\", \"pUserName\", \"pPassword\"\r\n" + 
				"	FROM public.\"Passenger\";";
		try {
			Connection con = db.getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			while (rs.next()) {

				if (request.getParameter("name").equals(rs.getString(8))
						&& request.getParameter("upass").equals(rs.getString(9))) {

					HttpSession session = request.getSession();
					session.setAttribute("name", request.getParameter("name"));
					session.setAttribute("id", rs.getString(1));
					request.setAttribute("result", "Login successfull.");
					request.getRequestDispatcher("Pindex.jsp").forward(request, response);
					

				}
			}
			request.setAttribute("result", "Please Enter the Valid Email address successfull.");
			request.getRequestDispatcher("index.jsp").forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
