import 'dart:async';
import 'dart:math';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/driver.dart';
import '../config/app_config.dart';

class RideSimulationService {
  static Future<Driver> assignRandomDriver(List<Driver> drivers) async {
    await Future.delayed(const Duration(seconds: 2));
    final random = Random();
    return drivers[random.nextInt(drivers.length)];
  }

  static Stream<LatLng> simulateDriverMovement(
    LatLng start,
    LatLng end, {
    int steps = 30,
    Duration stepDuration = const Duration(milliseconds: 300),
  }) async* {
    double latStep = (end.latitude - start.latitude) / steps;
    double lngStep = (end.longitude - start.longitude) / steps;
    for (int i = 1; i <= steps; i++) {
      await Future.delayed(stepDuration);
      yield LatLng(
        start.latitude + latStep * i,
        start.longitude + lngStep * i,
      );
    }
  }
}
