
class ChatDetails {

  String chatRoomName;
  Object chatRoomPassword;

	ChatDetails.fromJsonMap(Map<String, dynamic> map): 
		chatRoomName = map["chatRoomName"],
		chatRoomPassword = map["chatRoomPassword"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['chatRoomName'] = chatRoomName;
		data['chatRoomPassword'] = chatRoomPassword;
		return data;
	}
}
