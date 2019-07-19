package first.prj.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import first.prj.dao.BoardDAO;
import first.prjdoo.common.common.CommandMap;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
    
    Logger log = LoggerFactory.getLogger(this.getClass());
    
    @Resource(name="boardDAO")
    private BoardDAO boardDAO;
 
    @Override
    public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
        // TODO Auto-generated method stub
        return boardDAO.selectBoardList(commandMap);
    }
    @Override
    public void insertBoard(CommandMap commandMap) {
        // TODO Auto-generated method stub
        boardDAO.insertBoard(commandMap);
    }
    public void insertReply(CommandMap commandMap) {
        // TODO Auto-generated method stub
        boardDAO.insertReply(commandMap);
    }

    @Override
    public Map<String, Object> viewBoardDetail(Map<String, Object> map) {
        // TODO Auto-generated method stub
        boardDAO.updateHitBoard(map);
        Map<String, Object> detail = boardDAO.detailBoard(map);
        return detail;
    }

    @Override
    public List<Map<String, Object>> viewReplyDetail(Map<String, Object> map) {
        return boardDAO.replyBoard(map);
       
    }
    

    @Override
    public Map<String, Object> selectBoardDetail(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return boardDAO.detailBoard(map);
    }
    
    @Override
    public Map<String, Object> selectReplyDetail(Map<String, Object> map) {
        // TODO Auto-generated method stub
        return boardDAO.detailReply(map);
    }
    
    
    @Override
    public void updateBoard(Map<String, Object> map) {
        // TODO Auto-generated method stub
        boardDAO.updateBoard(map);
    }

    @Override
    public void updateReply(Map<String, Object> map) {
        // TODO Auto-generated method stub
        boardDAO.updateReply(map);
    }
    @Override
    public void deleteBoard(Map<String, Object> map) {
        // TODO Auto-generated method stub
        boardDAO.deleteBoard(map);
    }
    
    @Override
    public void deleteReply(Map<String, Object> map) {
        // TODO Auto-generated method stub
        boardDAO.deleteReply(map);
    }
    
    @Override
    public List<Map<String, Object>> selectBoardList(Criteria cri) {
        return boardDAO.selectBoardList(cri);
    }
    @Override
    public int countBoardListTotal() {
        return boardDAO.countBoardList();
    }

}


