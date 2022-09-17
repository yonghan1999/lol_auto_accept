
class MyTeam {

  String assignedPosition;
  int cellId;
  int championId;
  int championPickIntent;
  String entitledFeatureType;
  int selectedSkinId;
  int spell1Id;
  int spell2Id;
  int summonerId;
  int team;
  int wardSkinId;

	MyTeam.fromJsonMap(Map<String, dynamic> map): 
		assignedPosition = map["assignedPosition"],
		cellId = map["cellId"],
		championId = map["championId"],
		championPickIntent = map["championPickIntent"],
		entitledFeatureType = map["entitledFeatureType"],
		selectedSkinId = map["selectedSkinId"],
		spell1Id = map["spell1Id"],
		spell2Id = map["spell2Id"],
		summonerId = map["summonerId"],
		team = map["team"],
		wardSkinId = map["wardSkinId"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['assignedPosition'] = assignedPosition;
		data['cellId'] = cellId;
		data['championId'] = championId;
		data['championPickIntent'] = championPickIntent;
		data['entitledFeatureType'] = entitledFeatureType;
		data['selectedSkinId'] = selectedSkinId;
		data['spell1Id'] = spell1Id;
		data['spell2Id'] = spell2Id;
		data['summonerId'] = summonerId;
		data['team'] = team;
		data['wardSkinId'] = wardSkinId;
		return data;
	}
}
