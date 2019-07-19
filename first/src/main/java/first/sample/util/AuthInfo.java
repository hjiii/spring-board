package first.sample.util;

//회원 정보 세션 유지
public class AuthInfo {
  
  private String id;
  private String name;
  private int admin;
private String password;
private String email;
  
  public AuthInfo(String id, String name, int admin, String password, String email) {
      this.id = id;
      this.name = name;
      this.admin = admin;
      this.password =password;
      this.email = email;
  }
  
  public String getId() {
      return id;
  }
  public void setId(String id) {
      this.id = id;
  }
  public String getName() {
      return name;
  }
  public void setName(String name) {
      this.name = name;
  }
  public int getAdmin() {
      return admin;
  }
  public void setAdmin(int admin) {
      this.admin = admin;
  }

public String getPassword() {
	return password;
}

public void setPassword(String password) {
	this.password = password;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

}

