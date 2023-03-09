class Country {
  final String name;
  final List<int> callingCodes;
  final String flag;

  Country({
    required this.name,
    required this.callingCodes,
    required this.flag,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'],
      callingCodes: json['callingCodes'],
      flag: json['flags']['svg'],
    );
  }
}
