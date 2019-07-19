package first.prj.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import first.prj.service.BoardService;
import first.prj.service.Criteria;
import first.prj.service.PageMaker;
import first.prjdoo.common.common.CommandMap;

@Controller
public class BoardController {
    
    Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="boardService")
    private BoardService boardService;
    

    @RequestMapping(value="/board/boardWrite.do")
    public String boardWrite() throws Exception {
        return "/user/board/boardWrite";
    }


    @RequestMapping(value="/board/boardInsert.do")
    public ModelAndView boardInsert(CommandMap commandMap) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/board/boardList.do");
        boardService.insertBoard(commandMap);
        return mav;
    }
    @RequestMapping(value="/board/boardDetail.do")
    public ModelAndView boardDetail(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("/user/board/boardDetail");
        Map<String, Object> detail = boardService.viewBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
 
        
        return mv;
    }

    @RequestMapping(value="/board/replyDetail.do")
    public ModelAndView replyDetail(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("/user/board/replyDetail");
        List<Map<String, Object>> list = boardService.viewReplyDetail(commandMap.getMap());
        mv.addObject("list",list);
        
        return mv;
    }
    
    @RequestMapping(value="/board/boardUpdate.do")
    public ModelAndView boardUpdate(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("/user/board/boardUpdate");
        Map<String, Object> detail = boardService.selectBoardDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        return mv;
    }


    @RequestMapping(value="/board/boardUpdate.do", method=RequestMethod.POST)
    public ModelAndView boardUpdatePOST(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("redirect:/board/boardDetail.do");
        mv.addObject("idx", commandMap.get("IDX"));
        boardService.updateBoard(commandMap.getMap());
        return mv;
    }
    
    @RequestMapping(value="/board/boardDelete.do")
    public ModelAndView boardDelete(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/board/boardList.do");
        boardService.deleteBoard(commandMap.getMap());
        return mv;
    }
    @RequestMapping(value="/board/replyDelete.do")
    public ModelAndView replyDelete(CommandMap commandMap) throws Exception {
        ModelAndView mv = new ModelAndView("redirect:/board/replyDetail.do");
        mv.addObject("idx", commandMap.get("idx"));

        boardService.deleteReply(commandMap.getMap());
        return mv;
    }
    @RequestMapping(value="/board/boardList.do")
    public ModelAndView openBoardList(Criteria cri) throws Exception {
        
    	
        ModelAndView mav = new ModelAndView("/user/board/boardList");
            
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.countBoardListTotal());
            
        List<Map<String,Object>> list = boardService.selectBoardList(cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
            
        return mav;
            
    }
    
    @RequestMapping(value="/board/boardList2.do")
    public ModelAndView openBoardList2(Criteria cri) throws Exception {
        
    	
        ModelAndView mav = new ModelAndView("/user/board/boardList2");
            
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        pageMaker.setTotalCount(boardService.countBoardListTotal());
            
        List<Map<String,Object>> list = boardService.selectBoardList(cri);
        mav.addObject("list", list);
        mav.addObject("pageMaker", pageMaker);
            
        return mav;
            
    }
    
    @RequestMapping(value="/ReplyInsert.do")
    public ModelAndView ReplyInsert(CommandMap commandMap) throws Exception {
        ModelAndView mav = new ModelAndView("redirect:/board/replyDetail.do");
        boardService.insertReply(commandMap);
        mav.addObject("idx", commandMap.get("idx"));

        return mav;
    }
    

    @RequestMapping(value="/board/replyModify.do")
    public ModelAndView replyUpdate(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("/user/board/replyModify");
        Map<String, Object> detail = boardService.selectReplyDetail(commandMap.getMap());
        mv.addObject("detail",detail);
        System.out.println("dddddddddddddddddd");
        return mv;
    }


    @RequestMapping(value="/board/replyModify.do", method=RequestMethod.POST)
    public ModelAndView replyUpdatePOST(CommandMap commandMap) throws Exception {
        
        ModelAndView mv = new ModelAndView("redirect:/board/replyDetail.do");
        mv.addObject("idx", commandMap.get("idx"));
        mv.addObject("ridx", commandMap.get("ridx"));
        System.out.println("dddddddddddddddddd");
        System.out.println(mv);

        boardService.updateReply(commandMap.getMap());
        return mv;
    }
}


