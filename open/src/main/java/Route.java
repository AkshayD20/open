
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Route extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sql = "INSERT INTO public.route(source, destination)VALUES (?, ?);";
		List dataList = new ArrayList();
		demoDatabase db = new demoDatabase();
		try {
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, request.getParameter("source"));
			pst.setString(2, request.getParameter("destination"));
			pst.executeUpdate();
			if (pst != null) {
				request.setAttribute("result", "Route add is successfull.");
				request.getRequestDispatcher("routeDetails.jsp").forward(request, response);

			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
