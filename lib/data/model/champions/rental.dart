
class Rental {

  int endDate;
  int purchaseDate;
  bool rented;
  int winCountRemaining;

	Rental.fromJsonMap(Map<String, dynamic> map): 
		endDate = map["endDate"],
		purchaseDate = map["purchaseDate"],
		rented = map["rented"],
		winCountRemaining = map["winCountRemaining"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['endDate'] = endDate;
		data['purchaseDate'] = purchaseDate;
		data['rented'] = rented;
		data['winCountRemaining'] = winCountRemaining;
		return data;
	}
}
