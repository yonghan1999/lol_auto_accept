enum JsonApiEventType {
  create(value: "Create"),
  update(value: "Update"),
  delete(value: "Delete"),
  unknown(value: "Unknown");

  final String value;

  const JsonApiEventType({required this.value});

  static JsonApiEventType fromString(String str) {
    for (var value in JsonApiEventType.values) {
      if(str == value.value) {
        return value;
      }
    }
    return JsonApiEventType.unknown;
  }
}