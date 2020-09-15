package kw.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Resource(name="userDAO")
	private UserDAO userDAO;
	
	public void createUser(UserVO userVO) {
		userDAO.createUser(userVO);
	}
	
	public UserVO retrieveUser(String id) {
		return userDAO.retrieveUser(id);
	}
	
	public List<Map<String, String>> retrieveUserList(){
		return userDAO.retrieveUserList();
	}
	
	public List<Map<String, String>> retrievePostByDong(Map<String, String> param){
		return userDAO.retrievePostByDong(param);
	}
	
	public boolean loginCheck(String id, String pw) {
		return userDAO.loginCheck(id, pw);
	}
	
	public UserVO retrieveSessionInfo(String id) {
		return userDAO.retrieveSessionInfo(id);
	}
	
	public void updateUser(UserVO userVO) {
		userDAO.updateUser(userVO);
	}
}
