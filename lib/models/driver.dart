class Driver {
  final String id;
  final String name;
  final String carModel;
  final String carPlate;
  final String phone;
  final String avatarUrl;

  Driver({
    required this.id,
    required this.name,
    required this.carModel,
    required this.carPlate,
    required this.phone,
    required this.avatarUrl,
  });

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
      id: json['id'] as String,
      name: json['name'] as String,
      carModel: json['carModel'] as String,
      carPlate: json['carPlate'] as String,
      phone: json['phone'] as String,
      avatarUrl: json['avatarUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'carModel': carModel,
      'carPlate': carPlate,
      'phone': phone,
      'avatarUrl': avatarUrl,
    };
  }
}
