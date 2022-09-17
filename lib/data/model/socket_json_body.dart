import 'package:lol_auto_accept/data/constant/json_api_event_type.dart';

class SocketJsonBody {
  dynamic data;
  JsonApiEventType eventType;
  String uri;

  SocketJsonBody(this.data, this.eventType, this.uri);


  SocketJsonBody.fromJsonMap(Map<String, dynamic> map):
        data = map["data"],
        eventType = JsonApiEventType.fromString(map["eventType"]),
        uri = map["uri"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['data'] = data;
    data['eventType'] = eventType.value;
    data['uri'] = uri;
    return data;
  }

  @override
  String toString() {
    return 'SocketJsonBody{data: $data, eventType: $eventType, uri: $uri}';
  }
}