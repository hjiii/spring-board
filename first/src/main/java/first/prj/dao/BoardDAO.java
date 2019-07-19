package first.prj.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import first.common.dao.AbstractDAO;
import first.prj.service.Criteria;
import first.prjdoo.common.common.CommandMap;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.selectBoardList", commandMap);
	}

	public void insertBoard(CommandMap commandMap) {
		// TODO Auto-generated method stub
		insert("board.insertBoard", commandMap.getMap());
	}

	public void insertReply(CommandMap commandMap) {
		// TODO Auto-generated method stub
		insert("board.insertReply", commandMap.getMap());
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("board.detailBoard", map);
	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> detailReply(Map<String, Object> map) { // TODO Auto-generated method stub
		return (Map<String, Object>) selectOne("board.detailReply", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> replyBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>) selectList("board.replyBoard", map);
	}

	public void updateHitBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateHitBoard", map);
	}

	public void updateBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateBoard", map);
	}

	public void updateReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.updateReply", map);
	}

	public void deleteBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteBoard", map);
	}

	public void deleteReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		update("board.deleteReply", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Criteria cri) {
		return (List<Map<String, Object>>) selectList("board.selectBoardList", cri);
	}

	public int countBoardList() {
		return (Integer) selectOne("board.countBoardList");
	}

}
