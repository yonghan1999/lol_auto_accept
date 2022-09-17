
class Timer {

  int adjustedTimeLeftInPhase;
  int internalNowInEpochMs;
  bool isInfinite;
  String phase;
  int totalTimeInPhase;

	Timer.fromJsonMap(Map<String, dynamic> map): 
		adjustedTimeLeftInPhase = map["adjustedTimeLeftInPhase"],
		internalNowInEpochMs = map["internalNowInEpochMs"],
		isInfinite = map["isInfinite"],
		phase = map["phase"],
		totalTimeInPhase = map["totalTimeInPhase"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = <String, dynamic>{};
		data['adjustedTimeLeftInPhase'] = adjustedTimeLeftInPhase;
		data['internalNowInEpochMs'] = internalNowInEpochMs;
		data['isInfinite'] = isInfinite;
		data['phase'] = phase;
		data['totalTimeInPhase'] = totalTimeInPhase;
		return data;
	}
}
