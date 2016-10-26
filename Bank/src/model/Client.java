package model;

public class Client {

	private int clientId;
	private String firstName;
	private String lastName;
	private String country;

	public int getClientId() {
		return clientId;
	}

	public void setClientId(int clientId) {
		this.clientId = clientId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	@Override
	public String toString() {
		return "Client [clientId=" + this.clientId + ", firstName=" + this.firstName
				+ ", lastName=" + this.lastName + ", country="
				+ this.country + "]";
	}

}
