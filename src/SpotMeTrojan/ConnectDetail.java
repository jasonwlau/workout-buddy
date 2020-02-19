package SpotMeTrojan;

public class ConnectDetail {
	private String sender;
	private String day;
	private String time;
	private String interest;
	public ConnectDetail(String sender, String day, String time, String interest) {
		super();
		this.sender = sender;
		this.day = day;
		this.time = time;
		this.interest = interest;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
}