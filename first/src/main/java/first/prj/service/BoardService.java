package first.prj.service;

import java.util.List;
import java.util.Map;

import first.prjdoo.common.common.CommandMap;

public interface BoardService {
    List<Map<String, Object>> selectBoardList(CommandMap commandMap);
    void insertBoard(CommandMap commandMap);
    void insertReply(CommandMap commandMap);
    List<Map<String, Object>> viewReplyDetail(Map<String, Object> map);

    Map<String, Object> viewBoardDetail(Map<String, Object> map);
    Map<String, Object> selectBoardDetail(Map<String, Object> map);
    Map<String, Object> selectReplyDetail(Map<String, Object> map);

    void updateBoard(Map<String, Object> map);
    void updateReply(Map<String, Object> map);

    void deleteBoard(Map<String, Object> map);
    void deleteReply(Map<String, Object> map);

    List<Map<String, Object>> selectBoardList(Criteria cri);
    int countBoardListTotal();

}
