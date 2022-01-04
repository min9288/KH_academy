package kr.or.dm.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dm.model.dao.DmDao;
import kr.or.dm.model.vo.DirectMessage;

@Service
public class DmService {
	@Autowired
	private DmDao dao;

	public ArrayList<DirectMessage> selectDmList(String memberId) {
		ArrayList<DirectMessage> list = dao.selectDmList(memberId);
		return list;
	}
	
	@Transactional
	public int sendDm(DirectMessage dm) {
		int result = dao.sendDm(dm);
		return result;
	}
	
	public int dmCount(String memberId) {
		return dao.dmCount(memberId);
	}
	@Transactional
	public int updateDm(int dmNo) {
		return dao.updateDm(dmNo);
	}
	@Transactional
	public int deleteMsg(int dmNo) {
		return dao.deleteMsg(dmNo);
	}
}
