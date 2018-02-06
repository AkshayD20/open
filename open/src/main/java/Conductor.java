

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Conductor extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="INSERT INTO public.conductor(cname, address, gender,phone,adhar)VALUES (?, ?, ?, ?, ?)";
		demoDatabase db=new demoDatabase();
		try {
			Connection con=db.getConnection();
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, request.getParameter("name"));
			pst.setString(2, request.getParameter("address"));
			pst.setString(3, request.getParameter("gender"));
			pst.setString(4, request.getParameter("phoneno"));
			pst.setString(5, request.getParameter("adhar"));
			pst.executeUpdate();
			if(pst!=null) {
				request.setAttribute("result", "Conductor add is successfull.");
				request.getRequestDispatcher("conductorDetails.jsp").forward(request, response);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
