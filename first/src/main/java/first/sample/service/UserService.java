package first.sample.service;


import first.sample.util.AuthInfo;
import first.sample.util.LoginCommand;
import first.sample.util.RegisterRequest;
import first.sample.vo.UserVO;

public interface UserService {
	void register(RegisterRequest regReq) throws Exception;
    AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;

    public void modify(UserVO vo) throws Exception;
}
