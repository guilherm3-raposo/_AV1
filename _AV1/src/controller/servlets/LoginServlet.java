package controller.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bd.dao.LoginDAO;
import model.beans.LoginBean;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(name = "login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
	LoginDAO loginDAO = new LoginDAO();
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try { 
			LoginBean user = new LoginBean(); 
			user.setUserName(request.getParameter("login")); 
			user.setPassword(request.getParameter("senha")); 
			if (loginDAO.consulta(user)) { 
				HttpSession session = request.getSession(true); 
				session.setAttribute("currentSessionUser",user); 
				response.sendRedirect("inicio.jsp"); 
			} else {
				request.getRequestDispatcher("/erro.jsp").forward(request, response);
			}
		} catch (Exception e) { 
		}
	}

}
