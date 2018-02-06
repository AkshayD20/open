

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addBusRoute extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "INSERT INTO public.b2_r2(bid, rid, cno, dno, seat2, date)VALUES (?, ?, ?, ?, ?, ?);";
		demoDatabase db = new demoDatabase();
		
		try {
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setInt(1, Integer.parseInt(request.getParameter("bno")));
			pst.setInt(2, Integer.parseInt(request.getParameter("rno")));
			pst.setInt(3, Integer.parseInt(request.getParameter("cno")));
			pst.setInt(4, Integer.parseInt(request.getParameter("dno")));
			pst.setString(5, request.getParameter("seat"));
			pst.setString(6, request.getParameter("bdate"));
			pst.executeUpdate();
			if (pst != null) {
				request.setAttribute("result", "Bus-Route add is successfull.");
				request.getRequestDispatcher("busRouteDetails.jsp").forward(request, response);

			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
