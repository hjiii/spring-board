package first.prjdoo.common.controller;

import java.util.Iterator;
import java.util.Map.Entry;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
 
import first.prjdoo.common.common.CommandMap;
 
@Controller
public class TestController {
    
    Logger log = LoggerFactory.getLogger(this.getClass());
    
    @RequestMapping(value="/testMapArgumentResolver.do")
    public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("");
      
        if(commandMap.isEmpty() == false){
            Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
            Entry<String,Object> entry = null;
            while(iterator.hasNext()){
                entry = iterator.next();
                System.out.println("ddddddddd");
                log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
            }
        }
        return mv;
    }
 
}

