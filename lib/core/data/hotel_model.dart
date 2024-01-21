class Hotel {
  final String name;

  final String personNumber;

  final int id;

  Hotel({
    required this.name,
    required this.personNumber,
    required this.id,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
      personNumber: json['personNumber'],
      id: json['id'],
    );
  }
}
