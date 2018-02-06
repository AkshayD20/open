

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookTicket extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "INSERT INTO public.tickets(bno, source, destination, pid, date, dtime, price, sno, status)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
		demoDatabase db = new demoDatabase();
		try {
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, request.getParameter("bno"));
			pst.setString(2, request.getParameter("source"));
			pst.setString(3, request.getParameter("destination"));
			pst.setInt(4, Integer.parseInt(request.getParameter("pid")));
			pst.setString(5, request.getParameter("date"));
			pst.setString(6, request.getParameter("dtime"));
			pst.setString(7, request.getParameter("price"));
			pst.setString(8, request.getParameter("sno"));
			pst.setString(9, request.getParameter("status"));
			pst.executeUpdate();
			if (pst != null) {
				int as=Integer.parseInt(request.getParameter("as"))-1;
				System.out.println("As"+as);
				PreparedStatement pst1 = con.prepareStatement("UPDATE public.b2_r2 SET seat2='"+as+"' WHERE \"bid\"=? and \"rid\"=? and date=?;");
				pst1.setInt(1, Integer.parseInt(request.getParameter("bid")));
				pst1.setInt(2, Integer.parseInt(request.getParameter("rid")));
				pst1.setString(3, request.getParameter("date"));
				pst1.executeUpdate();
				request.setAttribute("bid", request.getParameter("bid"));
				request.setAttribute("rid", request.getParameter("rid"));
				request.setAttribute("as", request.getParameter("as"));
				request.setAttribute("result", "Ticket  is successfull Booked.");
				request.getRequestDispatcher("ticketDetails.jsp").forward(request, response);

			}

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
