package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Client;
import utils.DbUtils;

public class ClientDao {

	private Connection connection;

    public ClientDao() {
        connection = DbUtils.getConnection();
    }

    public void addClient(Client client) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO clients(firstname,lastname,country) VALUES (?, ?, ? )");
            
            preparedStatement.setString(1, client.getFirstName());
            preparedStatement.setString(2, client.getLastName());
            preparedStatement.setString(3, client.getCountry());
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NullPointerException e) {
        	
        }
    }

    public void deleteClient(int clientId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("DELETE FROM clients WHERE clientId=?");

            preparedStatement.setInt(1, clientId);
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void updateClient(Client client) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("UPDATE clients SET firstname=?, lastname=?, country=?" +
                            "WHERE clientId=?");

            preparedStatement.setString(1, client.getFirstName());
            preparedStatement.setString(2, client.getLastName());
            preparedStatement.setString(3, client.getCountry());
            preparedStatement.setInt(4, client.getClientId());
            
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Client> getAllClients() {
        List<Client> clients = new ArrayList<Client>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("SELECT * FROM clients");
            while (rs.next()) {
                Client client = new Client();
                client.setClientId(rs.getInt("clientId"));
                client.setFirstName(rs.getString("firstname"));
                client.setLastName(rs.getString("lastname"));
                client.setCountry(rs.getString("country"));
                clients.add(client);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return clients;
    }

    public Client getClientById(int clientId) {
        Client client = new Client();
        try {
            PreparedStatement preparedStatement = connection.
                    prepareStatement("SELECT * FROM clients WHERE clientId=?");
            
            preparedStatement.setInt(1, clientId);
            
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                client.setClientId(rs.getInt("clientId"));
                client.setFirstName(rs.getString("firstname"));
                client.setLastName(rs.getString("lastname"));
                client.setCountry(rs.getString("country"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return client;
    }
	
}
