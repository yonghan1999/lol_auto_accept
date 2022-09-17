import 'package:lol_auto_accept/data/model/champions/rental.dart';

class Ownership {

  bool freeToPlayReward;
  bool owned;
  Rental rental;

	Ownership.fromJsonMap(Map<String, dynamic> map): 
		freeToPlayReward = map["freeToPlayReward"],
		owned = map["owned"],
		rental = Rental.fromJsonMap(map["rental"]);

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['freeToPlayReward'] = freeToPlayReward;
		data['owned'] = owned;
		data['rental'] =rental.toJson();
		return data;
	}
}
