package controller.servlets;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bd.dao.ProvaDAO;
import model.beans.ProvaBean;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(name = "prova", urlPatterns = { "/prova" })
@MultipartConfig(maxFileSize = 16177215)
public class UploadServlet extends HttpServlet {
	private static ProvaDAO provaDAO = new ProvaDAO();
	private static ProvaBean prova = new ProvaBean();
	private static final long serialVersionUID = 1L;
	
	public static boolean fetchProva(HttpServletRequest request) throws SQLException, IOException {
		provaDAO.consulta(request.getParameter("nome"));
		request.setAttribute("nome", prova.getIdProva());
		request.setAttribute("data", prova.getData());
		request.setAttribute("questoes", prova.getQuestoes());
		request.setAttribute("observacoes", prova.getObservacoes());
		request.setAttribute("base64", prova.getBase64());
		System.out.println(prova.getData());
//		TODO RESOLVA-ME
		System.out.println(">>>>" + request.getAttribute("data") + "<<<<");
//		RESOLVA-ME
		return true;
	}

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UploadServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			try {
				fetchProva(request);
			} catch (SQLException e) {
				System.out.println(e);
			}
	}
	/**
	 * @throws IOException
	 * @throws ServletException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
				prova.setIdProva(request.getParameter("nome"));;
				prova.setQuestoes(request.getParameter("questoes"));;
				prova.setObservacoes(request.getParameter("observacoes"));;
				prova.setBase64(request.getParameter("base64"));
		try {
			boolean sucesso = provaDAO.insere(prova);
			if (sucesso) {
				
				fetchProva(request);
				request.getRequestDispatcher("/prova.jsp").forward(request, response);
		    }
			else{
				request.setAttribute("erro", ("Erro desconhecido"));
				request.getRequestDispatcher("/prova.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			System.out.println(e);
			request.getRequestDispatcher("/prova.jsp").forward(request, response);
		}
		
	}

}
