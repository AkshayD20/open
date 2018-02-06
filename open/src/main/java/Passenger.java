

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Passenger extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sql="INSERT INTO public.\"Passenger\"(\"pName\", \"pAddress\", \"pGender\", \"pEmail\", \"pPhoneNo\", \"pAdhar\", \"pUserName\", \"pPassword\")VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		demoDatabase db=new demoDatabase();
		String sql2="select * from dummy where padhar='"+request.getParameter("adhar")+"'";
		int flag=0;
		try {
			Connection con=db.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql2);
			while(rs.next()) {
				if(rs.getString(2).equals(request.getParameter("name"))&&rs.getString(3).equals(request.getParameter("address"))&&rs.getString(4).equals(request.getParameter("phoneno"))) {
					flag=1;
				}
			}
					
		} catch (Exception e) {
			System.out.println(e);
		}
		if(flag==1) {
		try {
			Connection con=db.getConnection();
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setString(1, request.getParameter("name"));
			pst.setString(2, request.getParameter("address"));
			pst.setString(3, request.getParameter("gender"));
			pst.setString(4, request.getParameter("email"));
			pst.setString(5, request.getParameter("phoneno"));
			pst.setString(6, request.getParameter("adhar"));
			pst.setString(7, request.getParameter("userName"));
			pst.setString(8, request.getParameter("pass"));
			pst.executeUpdate();
			if(pst!=null) {
				request.setAttribute("name", request.getParameter("name"));
				request.setAttribute("result", "Regitration is successfull.Now,Login with User Name and Password");
				request.getRequestDispatcher("index.jsp").forward(request, response);
				
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}else {
			request.setAttribute("result", "Regitration is not successfull.pls Enter Valid Details");
			request.getRequestDispatcher("registor.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
