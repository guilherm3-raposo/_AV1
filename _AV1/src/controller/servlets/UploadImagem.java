package controller.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.bd.dao.ProvaDAO;
import model.beans.ProvaBean;

/**
 * Servlet implementation class UploadImagem
 */
@WebServlet(name="UploadServlet", urlPatterns="/UploadServlet.html")
@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class UploadImagem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ProvaDAO provaDAO = new ProvaDAO();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadImagem() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			System.out.println(request.getParameter("idProva"));
			provaDAO.update(new ProvaBean(request.getParameter("idProva"), request.getParameter("img64")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/display.jsp").forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("/display.jsp").forward(request, response);
	}
}
