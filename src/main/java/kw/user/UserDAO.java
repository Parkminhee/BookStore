package kw.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public void createUser(UserVO userVO) {
		sqlSession.insert("user.createUser", userVO);
	}
	
	public UserVO retrieveUser(String id) {
		return sqlSession.selectOne("user.retrieveUser", id);
	}
	
	public List<Map<String, String>> retrieveUserList(){
		return sqlSession.selectList("user.retrieveUserList");
	}
	
	public List<Map<String, String>> retrievePostByDong(Map<String, String> param){
		return sqlSession.selectList("user.retrievePostByDong", param);
	}
	
	public boolean loginCheck(String id, String pw) {
		boolean check = false;
		HashMap<String, String> hashMap = new HashMap<String, String>();
		hashMap.put("id", id);
		hashMap.put("pw", pw);
		
		String email = sqlSession.selectOne("user.loginCheck", hashMap);
		
		if(email != null) {
			check = true;
		}
		
		return check;
	}
	
	public UserVO retrieveSessionInfo(String id) {
		return sqlSession.selectOne("user.retrieveSessionInfo", id);
	}
	
	public void updateUser(UserVO userVO) {
		sqlSession.update("user.updateUser", userVO);
	}
}
