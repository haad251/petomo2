package com.ejo.petwalk.dao;


import java.util.ArrayList;
import java.util.List;

import com.ejo.petwalk.vo.FileVO;
import com.ejo.petwalk.vo.ReservationVO;
import com.ejo.petwalk.vo.SitterVO;

public interface SitterMapper {
	
	public int updateSitter(SitterVO sitter);
	public SitterVO selectOneSitter(String st_id);
	public ArrayList<SitterVO> selectAllSitter(); // 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쏙옙 Manager占쏙옙 占쏙옙占� sitter占쏙옙 占쏙옙占쏙옙占� 占쏙옙占쏙옙占쏙옙 占쏙옙 占쏙옙占쏙옙求占� 占쌨쇽옙占쏙옙 
	public int insertSitterImage(FileVO sitterFile);
	public int deleteSitterImage(SitterVO sitter);
    public SitterVO loginSitter(SitterVO sitter);
	public int insertSitter(SitterVO sitter);
	public FileVO selectSitterProfileImg(SitterVO sitter);
	public int updateSitterCheck(SitterVO sitter);//시터의 활동 가능 여부 업데이트 
	
	/*KMJ-[Sitter] 통계에 관련된 메소드*/
	// 시터 아이디로 모든 예약을 뽑아오는 메소드
	public List<ReservationVO> selectResBySitterId(String st_id);
	public List<ReservationVO> selectDateFormatResBySitterId(String st_id);

}
