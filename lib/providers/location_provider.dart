import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider extends ChangeNotifier {
  Position? _currentPosition;
  bool _isLoading = false;
  String? _error;

  Position? get currentPosition => _currentPosition;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchCurrentLocation() async {
    _isLoading = true;
    _error = null;
    notifyListeners();
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        _error = 'Location services are disabled.';
        _currentPosition = null;
        _isLoading = false;
        notifyListeners();
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          _error = 'Location permissions are denied.';
          _currentPosition = null;
          _isLoading = false;
          notifyListeners();
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        _error = 'Location permissions are permanently denied.';
        _currentPosition = null;
        _isLoading = false;
        notifyListeners();
        return;
      }
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        _error = 'Location request timed out. Using default location.';
        return Position(
          latitude: 37.3349,
          longitude: -122.0090,
          timestamp: DateTime.now(),
          accuracy: 1.0,
          altitude: 0.0,
          altitudeAccuracy: 1.0,
          heading: 0.0,
          headingAccuracy: 1.0,
          speed: 0.0,
          speedAccuracy: 1.0,
          isMocked: true,
        );
      });
      if (_currentPosition == null) {
        // Set a default location (e.g., Apple HQ)
        _currentPosition = Position(
          latitude: 37.3349,
          longitude: -122.0090,
          timestamp: DateTime.now(),
          accuracy: 1.0,
          altitude: 0.0,
          altitudeAccuracy: 1.0,
          heading: 0.0,
          headingAccuracy: 1.0,
          speed: 0.0,
          speedAccuracy: 1.0,
          isMocked: true,
        );
        _error ??= 'Using default location.';
      }
    } catch (e) {
      _error = 'Failed to get location: $e';
      _currentPosition = null;
    }
    _isLoading = false;
    notifyListeners();
  }
}
