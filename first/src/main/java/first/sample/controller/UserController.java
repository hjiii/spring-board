package first.sample.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import first.common.exception.AlreadyExistingEmailException;
import first.common.exception.AlreadyExistingIdException;
import first.prj.service.BoardService;
import first.prjdoo.common.common.CommandMap;
import first.sample.service.UserService;
import first.sample.util.RegisterRequest;
import first.sample.util.RegisterRequestValidator;
import first.sample.vo.UserVO;

@Controller
public class UserController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="userService")
    private UserService userService;
    
   @RequestMapping(value="/user/register/step1.do")
   public String step1() throws Exception {
      return "/user/register/step1";
   }
   
   
    @RequestMapping(value="/user/register/step2.do")
    public ModelAndView step2(@RequestParam(value="agree", defaultValue="false") Boolean agree) throws Exception {
        if(!agree) {
            ModelAndView mv = new ModelAndView("/user/register/step1");
            return mv;
        }
        ModelAndView mv = new ModelAndView("/user/register/step2");
       mv.addObject("registerRequest", new RegisterRequest());
        return mv;
    }
    
    @Resource(name="userService")
    private UserService userSer;

    @RequestMapping(value="/user/register/step3.do", method=RequestMethod.POST)
    public ModelAndView step3(RegisterRequest regReq, Errors errors) throws Exception{
       
        new RegisterRequestValidator().validate(regReq, errors);
        ModelAndView mv = new ModelAndView();
        
        if(errors.hasErrors()) {
           mv.setViewName("/user/register/step2");
            return mv;
        }
        
        try {
            userSer.register(regReq);
            
        } catch (AlreadyExistingEmailException e) {
            errors.rejectValue("email", "duplicate", "이미 가입된 이메일입니다.");
            mv.setViewName("/user/register/step2");
            return mv;
            
        } catch (AlreadyExistingIdException e) {
            errors.rejectValue("id", "duplicate", "이미 가입된 아이디입니다.");
            mv.setViewName("/user/register/step2");
            return mv;
        }
        
        mv.setViewName("/user/register/step3");
        return mv;
    }


}
