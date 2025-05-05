class IndustryIdentifier {
  final String? identifier;
  final String? type;

  IndustryIdentifier({this.identifier, this.type});
//تحويل من json الى كائن  dart
  factory IndustryIdentifier.fromJson(Map<String, dynamic> json) =>
      IndustryIdentifier(
        identifier: json['identifier'],
        type: json['type'],
      );

  Map<String , dynamic>toJson()=> {
    'identifier' : identifier ,
    'type' : type
  };
}
