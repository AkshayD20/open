

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
public class Bus extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String sql = "INSERT INTO public.bus(bno, btype, seat, price, dtime)VALUES (?, ?, ?, ?, ?);";
		demoDatabase db = new demoDatabase();
		try {
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, request.getParameter("bno"));
			pst.setString(2, request.getParameter("btype"));
			pst.setString(3, request.getParameter("seat"));
			pst.setString(4, request.getParameter("price"));
			pst.setString(5, request.getParameter("dtime"));
			pst.executeUpdate();
			if (pst != null) {
				request.setAttribute("result", "Bus add is successfull.");
				request.getRequestDispatcher("busDetails.jsp").forward(request, response);

			}
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
