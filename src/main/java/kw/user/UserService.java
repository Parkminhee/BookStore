package kw.user;

import java.util.List;
import java.util.Map;

public interface UserService {
	public void createUser(UserVO userVO);
	public UserVO retrieveUser(String id);
	public List<Map<String, String>> retrieveUserList();
	public List<Map<String, String>> retrievePostByDong(Map<String, String> param);
	public boolean loginCheck(String id, String pw);
	public UserVO retrieveSessionInfo(String id);
	public void updateUser(UserVO userVO);
}
