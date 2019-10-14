package com.ejo.petwalk.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import com.ejo.petwalk.service.ReservationService;
import com.ejo.petwalk.service.SitterService;
import com.ejo.petwalk.vo.ChatVO;
import com.ejo.petwalk.vo.LocationVO;
import com.ejo.petwalk.vo.NotificationVO;

@Controller
public class SocketController {

	@Autowired
	ReservationService rsv;
	@Autowired
	SitterService ssv;
	
	@MessageMapping("/chats/{res_id}/inChat")
	@SendTo("/topic/chats/{res_id}")
	public ChatVO chatin(@DestinationVariable String res_id, ChatVO chat) throws Exception {
		rsv.insertChat(chat);
		Date time = new Date();
		SimpleDateFormat sdf2 =new SimpleDateFormat("MM/dd HH:mm");
		String chattime2 = sdf2.format(time);
		chat.setChat_date(chattime2);
		return chat;
	}
	
	@MessageMapping("/noti/{not_receiver}/resConfirm")
	@SendTo("/topic/noti/{not_receiver}")
	public NotificationVO resConfirm(NotificationVO noti,@DestinationVariable String not_receiver){
		SimpleDateFormat sdf =new SimpleDateFormat("MM/dd HH:mm");
		Date time = new Date();
		noti.setNot_time(sdf.format(time));
		noti.setNot_message(noti.getNot_sender()+"さんが予約を確定しました。");
		rsv.insertNoti(noti);

		String max = rsv.selectMaxNoti();
		noti.setNot_id(max);
		return noti;
	}
	
	@MessageMapping("/noti/{not_receiver}/resInsert")
	@SendTo("/topic/noti/{not_receiver}")
	public NotificationVO resInsert(NotificationVO noti,@DestinationVariable String not_receiver){
		SimpleDateFormat sdf =new SimpleDateFormat("MM/dd HH:mm");
		Date time = new Date();
		noti.setNot_time(sdf.format(time));
		noti.setNot_message(noti.getNot_sender()+"さんが予約しました。");
		rsv.insertNoti(noti);
		
		String max = rsv.selectMaxNoti();
		noti.setNot_id(max);
		return noti;
	}
	
	@MessageMapping("/noti/{not_receiver}/resCancel")
	@SendTo("/topic/noti/{not_receiver}")
	public NotificationVO resCancel(NotificationVO noti,@DestinationVariable String not_receiver){
		SimpleDateFormat sdf =new SimpleDateFormat("MM/dd HH:mm");
		Date time = new Date();
		noti.setNot_time(sdf.format(time));
		noti.setNot_message(noti.getNot_sender()+"さんが予約をキャンセルしました。");
		rsv.insertNoti(noti);
		
		String max = rsv.selectMaxNoti();
		noti.setNot_id(max);
		return noti;
	}
	
	
	@MessageMapping("/noti/{id}/selectNoti")
	@SendTo("/topic/noti/{id}/selectNoti")
	public ArrayList<NotificationVO> selectNoti(@DestinationVariable String id){
		return rsv.selectNotiUnreadAll(id);
	}
	
	@MessageMapping("/noti/{id}/upNoti")
	public void upNoti(@DestinationVariable String id,NotificationVO noti){
		rsv.updateNoti(noti);
	}
	
	@MessageMapping("/location/{res_id}/setLoc")
	@SendTo("/topic/location/{res_id}")
	public int setWalkingLoc(@DestinationVariable String res_id, LocationVO loc){
		return rsv.insertLoc(loc); 
	}
	
}
