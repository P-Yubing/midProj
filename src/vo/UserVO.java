package vo;

public class UserVO {
	
	private String userId;
	private String userPw;
	private String userName;
	private String userNName;
	private String userTel;
	private String userEmail;
	private String userBirth;
	private String userType;
	
	public UserVO() {
		
	}
	
	public UserVO(String userId) {
		
	}
	
	public UserVO(String userId, String userPw, String userName, String userNName, String userTel, String userEmail,
			String userBirth, String userType) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNName = userNName;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.userBirth = userBirth;
		this.userType = userType;
	}

	public UserVO(String userId, String userName, String userNName, String userTel, String userEmail, String userPw) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNName = userNName;
		this.userTel = userTel;
		this.userEmail = userEmail;
		this.userPw = userPw;

	}




	public String getUserId() {
		return userId;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getUserPw() {
		return userPw;
	}
	
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserNName() {
		return userNName;
	}
	
	public void setUserNName(String userNName) {
		this.userNName = userNName;
	}
	
	public String getUserTel() {
		return userTel;
	}
	
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	
	public String getUserEmail() {
		return userEmail;
	}
	
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	public String getUserBirth() {
		return userBirth;
	}
	
	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}
	
	public String getUserType() {
		return userType;
	}
	
	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userNName=" + userNName
				+ ", userTel=" + userTel + ", userEmail=" + userEmail + ", userBirth=" + userBirth + ", userType="
				+ userType + "]";
	}
	
	
	
}
