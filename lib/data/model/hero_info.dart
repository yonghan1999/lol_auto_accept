
class HeroInfo {

  int id;
  String name;
  String alias;
  String squarePortraitPath;
  List<String> roles;

	HeroInfo.fromJsonMap(Map<String, dynamic> map): 
		id = map["id"],
		name = map["name"],
		alias = map["alias"],
		squarePortraitPath = map["squarePortraitPath"],
		roles = List<String>.from(map["roles"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['id'] = id;
		data['name'] = name;
		data['alias'] = alias;
		data['squarePortraitPath'] = squarePortraitPath;
		data['roles'] = roles;
		return data;
	}

  @override
  String toString() {
    return 'HeroInfo{id: $id, name: $name, alias: $alias, squarePortraitPath: $squarePortraitPath, roles: $roles}';
  }
}
