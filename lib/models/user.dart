class User {
  final String id;
  final String phoneNumber;
  final String? name;
  final String? email;
  final List<String> savedLocations;
  final List<String> rideHistory;

  User({
    required this.id,
    required this.phoneNumber,
    this.name,
    this.email,
    this.savedLocations = const [],
    this.rideHistory = const [],
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      savedLocations: List<String>.from(json['savedLocations'] ?? []),
      rideHistory: List<String>.from(json['rideHistory'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'phoneNumber': phoneNumber,
      'name': name,
      'email': email,
      'savedLocations': savedLocations,
      'rideHistory': rideHistory,
    };
  }

  User copyWith({
    String? id,
    String? phoneNumber,
    String? name,
    String? email,
    List<String>? savedLocations,
    List<String>? rideHistory,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      email: email ?? this.email,
      savedLocations: savedLocations ?? this.savedLocations,
      rideHistory: rideHistory ?? this.rideHistory,
    );
  }
}
