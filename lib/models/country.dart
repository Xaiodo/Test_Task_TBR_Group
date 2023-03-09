class Country {
  final String name;
  final List<String> callingCodes;
  final String flag;

  Country({
    required this.name,
    required this.callingCodes,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      callingCodes: List<String>.from(json['callingCodes']),
      flag: json['flags']['svg'],
    );
  }
}
