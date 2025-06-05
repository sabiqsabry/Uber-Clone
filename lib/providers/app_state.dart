import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';
import '../models/ride.dart';
import '../models/driver.dart';
import '../config/app_config.dart';

class AppState extends ChangeNotifier {
  bool _isLoading = true;
  bool _isLoggedIn = false;
  User? _currentUser;
  Ride? _currentRide;
  List<Ride> _rideHistory = [];
  List<Driver> drivers = [];

  bool get isLoading => _isLoading;
  bool get isLoggedIn => _isLoggedIn;
  User? get currentUser => _currentUser;
  Ride? get currentRide => _currentRide;
  List<Ride> get rideHistory => _rideHistory;

  AppState() {
    _initialize();
  }

  Future<void> _initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    if (_isLoggedIn) {
      final userJson = prefs.getString('user_data');
      if (userJson != null) {
        _currentUser = User.fromJson(json.decode(userJson));
      }
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> login(String phoneNumber) async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _currentUser = User(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      phoneNumber: phoneNumber,
    );

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('is_logged_in', true);
    await prefs.setString('user_data', json.encode(_currentUser!.toJson()));

    _isLoggedIn = true;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoading = true;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    _currentUser = null;
    _currentRide = null;
    _rideHistory = [];
    _isLoggedIn = false;
    _isLoading = false;
    notifyListeners();
  }

  void setCurrentRide(Ride ride) {
    _currentRide = ride;
    notifyListeners();
  }

  void addRideToHistory(Ride ride) {
    _rideHistory.insert(0, ride);
    notifyListeners();
  }

  void setDrivers(List<Driver> list) {
    drivers = list;
    notifyListeners();
  }

  void completeRide() {
    if (_currentRide != null) {
      _rideHistory.add(_currentRide!);
      _currentRide = null;
      notifyListeners();
    }
  }
}
