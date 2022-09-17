
class Actions {

  int actorCellId;
  int championId;
  bool completed;
  int id;
  bool isAllyAction;
  bool isInProgress;
  String type;

	Actions.fromJsonMap(Map<String, dynamic> map): 
		actorCellId = map["actorCellId"],
		championId = map["championId"],
		completed = map["completed"],
		id = map["id"],
		isAllyAction = map["isAllyAction"],
		isInProgress = map["isInProgress"],
		type = map["type"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['actorCellId'] = actorCellId;
		data['championId'] = championId;
		data['completed'] = completed;
		data['id'] = id;
		data['isAllyAction'] = isAllyAction;
		data['isInProgress'] = isInProgress;
		data['type'] = type;
		return data;
	}
}
