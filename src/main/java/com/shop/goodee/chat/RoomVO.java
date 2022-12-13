package com.shop.goodee.chat;

import lombok.Data;

@Data
public class RoomVO {
	
	private int roomNumber;
	private String roomName;
	
	@Override
	public String toString() {
		return "Room [roomNumber=" + roomNumber + ", roomName=" + roomName + "]";
	}

}
