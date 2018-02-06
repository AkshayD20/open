

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Cancel extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql = "UPDATE public.tickets SET status=? WHERE \"tid\"=?;";
		demoDatabase db = new demoDatabase();
		try {
			
			Connection con = db.getConnection();
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, "Canceld");
			pst.setInt(2, Integer.parseInt(request.getParameter("tid")));
			pst.executeUpdate();
			if (pst != null) {
				String sql2="SELECT seat2 from b2_r2 where bid IN(select bid from bus WHERE bno='"+request.getParameter("bno")+"') and rid IN(select rid from route WHERE source='"+request.getParameter("source")+"' and destination='"+request.getParameter("des")+"') and date='"+request.getParameter("date")+"';";
				Statement st=con.createStatement();
				ResultSet as=st.executeQuery(sql2);
				String as1=null;
				while(as.next()){
					as1=as.getString(1);
				}
				System.out.println("out"+Integer.parseInt(as1)+1);
				int as2=Integer.parseInt(as1)+1;
				System.out.println("out2:-"+as2);
//				int as=Integer.parseInt(request.getParameter("as"))+1;
				PreparedStatement pst1 = con.prepareStatement("UPDATE public.b2_r2 SET seat2='"+as2+"' where bid IN(select bid from bus WHERE bno='"+request.getParameter("bno")+"') and rid IN(select rid from route WHERE source='"+request.getParameter("source")+"' and destination='"+request.getParameter("des")+"') and date='"+request.getParameter("date")+"';");
//				pst1.setInt(1, Integer.parseInt(request.getParameter("bid")));
//				pst1.setInt(2, Integer.parseInt(request.getParameter("rid")));
//				pst1.setString(3, request.getParameter("date"));
				pst1.executeUpdate();
				request.setAttribute("result", "ticket is successfully Canceld.");
				request.getRequestDispatcher("ticketDetails.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
