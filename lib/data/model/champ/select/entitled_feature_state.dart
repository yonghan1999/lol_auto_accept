
class EntitledFeatureState {

  int additionalRerolls;
  List<dynamic> unlockedSkinIds;

	EntitledFeatureState.fromJsonMap(Map<String, dynamic> map): 
		additionalRerolls = map["additionalRerolls"],
		unlockedSkinIds = map["unlockedSkinIds"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['additionalRerolls'] = additionalRerolls;
		data['unlockedSkinIds'] = unlockedSkinIds;
		return data;
	}
}
