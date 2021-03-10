package com.gls.winter;

import java.util.List;

import com.gls.winter.page.Pagination;

public interface BoardService {
	public int insertBoard(BoardVO vo);
	public int deleteBoard(int seq);
	public int updateBoard(BoardVO vo);
	public BoardVO getBoard(int seq);
	public List<BoardVO> getBoardList(Pagination pagination);
	public int getBoardListCnt(); // throws Exception; // 총 게시글 개수 확인

}
