package kr.or.dm.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dm.model.dao.DmDao;
import kr.or.dm.model.vo.DirectMessage;

@Service
public class DmService {
	@Autowired
	private DmDao dao;

	public ArrayList<DirectMessage> selectDmList(String memberId) {
		
		return dao.selectDmList(memberId);
	}

	public int sendMsg(String memberId, String target, String msgContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("target", target);
		map.put("msgContent", msgContent);
		int result = dao.sendMsg(map);
		return result;
	}
}
