package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClientDao;
import model.Client;


public class ClientController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String INSERT_OR_EDIT = "/client.jsp";
	private static String LIST_CLIENT = "/listClient.jsp";
	private ClientDao dao;

	public ClientController() {
		super();
		dao = new ClientDao();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			dao.deleteClient(clientId);
			forward = LIST_CLIENT;
			request.setAttribute("clients", dao.getAllClients());
		} else if (action.equalsIgnoreCase("edit")) {
			forward = INSERT_OR_EDIT;
			int clientId = Integer.parseInt(request.getParameter("clientId"));
			Client client = dao.getClientById(clientId);
			request.setAttribute("client", client);
		} else if (action.equalsIgnoreCase("listClient")) {
			forward = LIST_CLIENT;
			request.setAttribute("clients", dao.getAllClients());
		} else {
			forward = INSERT_OR_EDIT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		Client client = new Client();
		client.setFirstName(request.getParameter("firstName"));
		client.setLastName(request.getParameter("lastName"));
		client.setCountry(request.getParameter("country"));
		
		String clientId = request.getParameter("clientId");
		
		if (clientId == null || clientId.isEmpty()) {
			dao.addClient(client);
		} else {
			client.setClientId(Integer.parseInt(clientId));
			dao.updateClient(client);
		}
		RequestDispatcher view = request.getRequestDispatcher(LIST_CLIENT);
		request.setAttribute("clients", dao.getAllClients());
		view.forward(request, response);
	}
}