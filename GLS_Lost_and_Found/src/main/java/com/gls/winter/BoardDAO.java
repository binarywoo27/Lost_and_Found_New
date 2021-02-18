package com.gls.winter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO {
	
	@Autowired
	SqlSession sqlSession;
	
	public int insertBoard(BoardVO vo) {
		int result = sqlSession.insert("Board.insertBoard", vo);
		return result;
	}
	public int updateBoard(BoardVO vo) {
		int result = sqlSession.update("Board.updateBoard", vo);
		return result;
	}
	public int deleteBoard(int seq) {
		int result = sqlSession.delete("Board.deleteBoard", seq);
		return result;
	}
	public BoardVO getBoard(int seq) {
		return sqlSession.selectOne("Board.getBoard", seq);
	}
	public List<BoardVO> getBoardList() {
		return sqlSession.selectList("Board.getBoardList");
	}
	

}






