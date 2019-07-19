package first.sample.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import first.common.exception.AlreadyExistingEmailException;
import first.common.exception.AlreadyExistingIdException;
import first.common.exception.IdPasswordNotMatchingException;
import first.sample.dao.UserDAO;
import first.sample.util.AuthInfo;
import first.sample.util.LoginCommand;
import first.sample.util.RegisterRequest;
import first.sample.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource(name="userDAO")
    private UserDAO userDAO;
 
    @Override
    public void register(RegisterRequest regReq) throws Exception {
        UserVO email = userDAO.selectByEmail(regReq.getEmail());
        if(email!=null) {
            throw new AlreadyExistingEmailException(regReq.getEmail()+" is duplicate email.");
        }
        UserVO id = userDAO.selectById(regReq.getId());
        if(id!=null) {
            throw new AlreadyExistingIdException(regReq.getId()+" is duplicate id.");
        }
        userDAO.insertUser(regReq);
    }

    @Override
    public AuthInfo loginAuth(LoginCommand loginCommand) throws Exception {
        UserVO user = userDAO.selectById(loginCommand.getId());
        if(user == null) {
            throw new IdPasswordNotMatchingException();
        }
        if(!user.matchPassword(loginCommand.getPw())) {
            throw new IdPasswordNotMatchingException();
        }
        return new AuthInfo(user.getID(), user.getNAME(), user.getGRADE(), user.getPASSWORD(),user.getEMAIL());
    }

    
   @Override
   public void modify(UserVO vo) throws Exception{
	   userDAO.modify(vo);
   }
}
