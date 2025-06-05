import 'package:google_maps_flutter/google_maps_flutter.dart';

enum RideType { basic, comfort, xl }

enum RideStatus {
  searching,
  driverAssigned,
  driverArrived,
  inProgress,
  completed,
  cancelled,
}

class Ride {
  final String id;
  final String userId;
  final String? driverId;
  final LatLng pickup;
  final LatLng dropoff;
  final DateTime createdAt;
  final DateTime? completedAt;
  final double distance;
  final double fare;
  final RideType type;
  final RideStatus status;
  final String? driverName;
  final String? carModel;
  final String? carPlate;

  Ride({
    required this.id,
    required this.userId,
    this.driverId,
    required this.pickup,
    required this.dropoff,
    required this.createdAt,
    this.completedAt,
    required this.distance,
    required this.fare,
    required this.type,
    required this.status,
    this.driverName,
    this.carModel,
    this.carPlate,
  });

  factory Ride.fromJson(Map<String, dynamic> json) {
    return Ride(
      id: json['id'] as String,
      userId: json['userId'] as String,
      driverId: json['driverId'] as String?,
      pickup: LatLng(
        json['pickup']['latitude'] as double,
        json['pickup']['longitude'] as double,
      ),
      dropoff: LatLng(
        json['dropoff']['latitude'] as double,
        json['dropoff']['longitude'] as double,
      ),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] != null
          ? DateTime.parse(json['completedAt'] as String)
          : null,
      distance: json['distance'] as double,
      fare: json['fare'] as double,
      type: RideType.values.firstWhere(
        (e) => e.toString() == 'RideType.${json['type']}',
      ),
      status: RideStatus.values.firstWhere(
        (e) => e.toString() == 'RideStatus.${json['status']}',
      ),
      driverName: json['driverName'] as String?,
      carModel: json['carModel'] as String?,
      carPlate: json['carPlate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'driverId': driverId,
      'pickup': {'latitude': pickup.latitude, 'longitude': pickup.longitude},
      'dropoff': {'latitude': dropoff.latitude, 'longitude': dropoff.longitude},
      'createdAt': createdAt.toIso8601String(),
      'completedAt': completedAt?.toIso8601String(),
      'distance': distance,
      'fare': fare,
      'type': type.toString().split('.').last,
      'status': status.toString().split('.').last,
      'driverName': driverName,
      'carModel': carModel,
      'carPlate': carPlate,
    };
  }

  Ride copyWith({
    String? id,
    String? userId,
    String? driverId,
    LatLng? pickup,
    LatLng? dropoff,
    DateTime? createdAt,
    DateTime? completedAt,
    double? distance,
    double? fare,
    RideType? type,
    RideStatus? status,
    String? driverName,
    String? carModel,
    String? carPlate,
  }) {
    return Ride(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      driverId: driverId ?? this.driverId,
      pickup: pickup ?? this.pickup,
      dropoff: dropoff ?? this.dropoff,
      createdAt: createdAt ?? this.createdAt,
      completedAt: completedAt ?? this.completedAt,
      distance: distance ?? this.distance,
      fare: fare ?? this.fare,
      type: type ?? this.type,
      status: status ?? this.status,
      driverName: driverName ?? this.driverName,
      carModel: carModel ?? this.carModel,
      carPlate: carPlate ?? this.carPlate,
    );
  }
}
