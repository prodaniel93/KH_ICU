package com.kh.icu.common.scheduling;

import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.kh.icu.common.socket.AlramHandler;
import com.kh.icu.common.socket.Sessions;
import com.kh.icu.party.model.service.PartyService;
import com.kh.icu.party.model.vo.Party;

@Component
public class PartyDateScheduler {
	
	@Autowired
	private PartyService partyService;
	
	
	@Autowired
	private AlramHandler alramHandler;
	

	
	@Scheduled(cron = "0 */10 * * * *")
	public void partyDateCheck() {
		List<Party> p = partyService.partyList();
		LocalDate today = LocalDate.now();
		ArrayList<Party> oneWeek = new ArrayList<Party>();
		
		System.out.println("=========파티 날짜 조회 시작=========");
		for(int i=0; i < p.size(); i++) {
			LocalDate endDate = p.get(i).getEndDate().toLocalDate();
			if(endDate.isEqual(today) || endDate.isBefore(today)) {
				partyService.endParty(p.get(i).getPaNo());
				System.out.println(p.get(i).getPaNo()+"번 파티 기한 종료");
			}
			else{
				Period pe = Period.between(today, endDate);
				System.out.println(p.get(i).getPaNo()+"번 파티 기한 : " +pe.getDays()+"일");
				if(pe.getDays() == 7 && p.get(i).getJoinNum() > 0) {
					oneWeek.add(p.get(i));
					for(int j=0; j < oneWeek.size(); j++) {
						int sendId = oneWeek.get(j).getPaName();
						String sendNickname = oneWeek.get(j).getPaMemNickname();
						String receiveNickname = oneWeek.get(j).getMemNickname();
						int receiveId = oneWeek.get(j).getMemNo();
						int paNo =  oneWeek.get(j).getPaNo();
						String message = "endParty,"+ sendId + ","  + sendNickname + ","  + receiveNickname + "," + receiveId + "," + paNo;
						System.out.println(message);
						TextMessage msg = new TextMessage(message);
						
						WebSocketSession receiveSession = Sessions.userSessions.get(receiveNickname);
						
						try {
							alramHandler.handleTextMessage(receiveSession, msg);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}					
					}					
					
				}
				
			}
		}
		System.out.println("일주일 남은 파티 : " +oneWeek);
		System.out.println("=========파티 날짜 조회 끝=========");

	}
}
