package first.sample.dao;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.sample.util.RegisterRequest;
import first.sample.vo.UserVO;

@Repository("userDAO")
public class UserDAO extends AbstractDAO {
	public UserVO selectByEmail(String email) {
		return (UserVO) selectOne("user.selectByEmail", email);
	}

	public UserVO selectById(String id) {
		return (UserVO) selectOne("user.selectById", id);
	}

	public void insertUser(RegisterRequest regReq) {
		insert("user.register", regReq);
	}
	
	
	public  void modify(UserVO vo) throws Exception {
		update("user.modify", vo);
	}
}
