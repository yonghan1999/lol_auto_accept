
class Bans {

  List<dynamic> myTeamBans;
  int numBans;
  List<dynamic> theirTeamBans;

	Bans.fromJsonMap(Map<String, dynamic> map): 
		myTeamBans = map["myTeamBans"],
		numBans = map["numBans"],
		theirTeamBans = map["theirTeamBans"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['myTeamBans'] = myTeamBans;
		data['numBans'] = numBans;
		data['theirTeamBans'] = theirTeamBans;
		return data;
	}
}
