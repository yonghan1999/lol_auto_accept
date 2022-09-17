import 'ownership.dart';

class Champion {

  bool active;
  String alias;
  String banVoPath;
  String baseLoadScreenPath;
  String baseSplashPath;
  bool botEnabled;
  String chooseVoPath;
  List<dynamic> disabledQueues;
  bool freeToPlay;
  int id;
  String name;
  Ownership ownership;
  int purchased;
  bool rankedPlayEnabled;
  List<String> roles;
  String squarePortraitPath;
  String stingerSfxPath;
  String title;

	Champion.fromJsonMap(Map<String, dynamic> map): 
		active = map["active"],
		alias = map["alias"],
		banVoPath = map["banVoPath"],
		baseLoadScreenPath = map["baseLoadScreenPath"],
		baseSplashPath = map["baseSplashPath"],
		botEnabled = map["botEnabled"],
		chooseVoPath = map["chooseVoPath"],
		disabledQueues = map["disabledQueues"],
		freeToPlay = map["freeToPlay"],
		id = map["id"],
		name = map["name"],
		ownership = Ownership.fromJsonMap(map["ownership"]),
		purchased = map["purchased"],
		rankedPlayEnabled = map["rankedPlayEnabled"],
		roles = List<String>.from(map["roles"]),
		squarePortraitPath = map["squarePortraitPath"],
		stingerSfxPath = map["stingerSfxPath"],
		title = map["title"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['active'] = active;
		data['alias'] = alias;
		data['banVoPath'] = banVoPath;
		data['baseLoadScreenPath'] = baseLoadScreenPath;
		data['baseSplashPath'] = baseSplashPath;
		data['botEnabled'] = botEnabled;
		data['chooseVoPath'] = chooseVoPath;
		data['disabledQueues'] = disabledQueues;
		data['freeToPlay'] = freeToPlay;
		data['id'] = id;
		data['name'] = name;
		data['ownership'] = ownership.toJson();
		data['purchased'] = purchased;
		data['rankedPlayEnabled'] = rankedPlayEnabled;
		data['roles'] = roles;
		data['squarePortraitPath'] = squarePortraitPath;
		data['stingerSfxPath'] = stingerSfxPath;
		data['title'] = title;
		return data;
	}
}
