import 'package:lol_auto_accept/data/model/champ/select/actions.dart';
import 'package:lol_auto_accept/data/model/champ/select/their_team.dart';

import 'bans.dart';
import 'chat_details.dart';
import 'entitled_feature_state.dart';
import 'my_team.dart';
import 'timer.dart';

class ChampSelectInfo {

  List<List<Actions>> actions;
  bool allowBattleBoost;
  bool allowDuplicatePicks;
  bool allowLockedEvents;
  bool allowRerolling;
  bool allowSkinSelection;
  Bans bans;
  List<dynamic> benchChampionIds;
  bool benchEnabled;
  int boostableSkinCount;
  // ChatDetails chatDetails;
  int counter;
  EntitledFeatureState entitledFeatureState;
  int gameId;
  bool hasSimultaneousBans;
  bool hasSimultaneousPicks;
  bool isCustomGame;
  bool isSpectating;
  int localPlayerCellId;
  int lockedEventIndex;
  List<MyTeam> myTeam;
  int recoveryCounter;
  int rerollsRemaining;
  bool skipChampionSelect;
  // List<TheirTeam> theirTeam;
  Timer timer;
  List<dynamic> trades;

	ChampSelectInfo.fromJsonMap(Map<String, dynamic> map):
		actions = List<List<Actions>>.from((map["actions"] as List).map<List<Actions>>((it) {
			List<Actions> tmp = List.empty(growable: true);
			it as List;
			for (var value in it) {
				tmp.add(Actions.fromJsonMap(value));
			}
			return tmp;
		})),
		allowBattleBoost = map["allowBattleBoost"],
		allowDuplicatePicks = map["allowDuplicatePicks"],
		allowLockedEvents = map["allowLockedEvents"],
		allowRerolling = map["allowRerolling"],
		allowSkinSelection = map["allowSkinSelection"],
		bans = Bans.fromJsonMap(map["bans"]),
		benchChampionIds = map["benchChampionIds"],
		benchEnabled = map["benchEnabled"],
		boostableSkinCount = map["boostableSkinCount"],
		// chatDetails = ChatDetails.fromJsonMap(map["chatDetails"]),
		counter = map["counter"],
		entitledFeatureState = EntitledFeatureState.fromJsonMap(map["entitledFeatureState"]),
		gameId = map["gameId"],
		hasSimultaneousBans = map["hasSimultaneousBans"],
		hasSimultaneousPicks = map["hasSimultaneousPicks"],
		isCustomGame = map["isCustomGame"],
		isSpectating = map["isSpectating"],
		localPlayerCellId = map["localPlayerCellId"],
		lockedEventIndex = map["lockedEventIndex"],
		myTeam = List<MyTeam>.from(map["myTeam"].map((it) => MyTeam.fromJsonMap(it))),
		recoveryCounter = map["recoveryCounter"],
		rerollsRemaining = map["rerollsRemaining"],
		skipChampionSelect = map["skipChampionSelect"],
		// theirTeam = List<TheirTeam>.from(map["theirTeam"].map((it) => TheirTeam.fromJsonMap(it))),
		timer = Timer.fromJsonMap(map["timer"]),
		trades = map["trades"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['actions'] = actions.map((e) {
		  List<Map<String, dynamic>> tmp = List.empty(growable: true);
			for (var element in e) {
				tmp.add(element.toJson());
			}
			return tmp;
		},).toList();
		data['allowBattleBoost'] = allowBattleBoost;
		data['allowDuplicatePicks'] = allowDuplicatePicks;
		data['allowLockedEvents'] = allowLockedEvents;
		data['allowRerolling'] = allowRerolling;
		data['allowSkinSelection'] = allowSkinSelection;
		data['bans'] = bans.toJson();
		data['benchChampionIds'] = benchChampionIds;
		data['benchEnabled'] = benchEnabled;
		data['boostableSkinCount'] = boostableSkinCount;
		// data['chatDetails'] = chatDetails.toJson();
		data['counter'] = counter;
		data['entitledFeatureState'] = entitledFeatureState.toJson();
		data['gameId'] = gameId;
		data['hasSimultaneousBans'] = hasSimultaneousBans;
		data['hasSimultaneousPicks'] = hasSimultaneousPicks;
		data['isCustomGame'] = isCustomGame;
		data['isSpectating'] = isSpectating;
		data['localPlayerCellId'] = localPlayerCellId;
		data['lockedEventIndex'] = lockedEventIndex;
		data['myTeam'] = myTeam.map((v) => v.toJson()).toList();
		data['recoveryCounter'] = recoveryCounter;
		data['rerollsRemaining'] = rerollsRemaining;
		data['skipChampionSelect'] = skipChampionSelect;
		// data['theirTeam'] = theirTeam.map((v) => v.toJson()).toList();
		data['timer'] = timer.toJson();
		data['trades'] = trades;
		return data;
	}
}
