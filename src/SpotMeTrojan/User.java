package SpotMeTrojan;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class User {
	public String username;
	public int photoID;
	public Map<String, String> time = new HashMap<String, String>();
	public Vector<String> interest = new Vector<String>();
	public String email;
	public String location;
	
	
	public String getUsername() {
		return username;
	}


	public int getPhotoID() {
		return photoID;
	}


	public Map<String, String> getTime() {
		return time;
	}


	public Vector<String> getInterest() {
		return interest;
	}


	public String getEmail() {
		return email;
	}


	public String getLocation() {
		return location;
	}


	public User(String username, int photoID, String email, String location, Map<String, String>time, Vector<String> interest) {
		this.username = username;
		this.photoID = photoID;
		this.email = email;
		this.time = time;
		this.interest = interest;
		this.location = location;
	}
	

	
}
