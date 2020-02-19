package SpotMeTrojan;

public class ConnectDetailPro {
	public String sender;
	public String day;
	public String time;
	public String interest;
	public String email;
	public int photoID;
	
	public ConnectDetailPro(ConnectDetail cd, String email, int photoID) {
		
		this.sender = cd.getSender();
		this.day = cd.getDay();
		this.time = cd.getTime();
		this.interest = cd.getInterest();
		this.email = email;
		this.photoID = photoID;
	}
}
