class AppConfig {
  static const String googleMapsApiKey = 'YOUR_API_KEY_HERE';

  // App-wide constants
  static const String appName = 'RideNow';
  static const String appVersion = '1.0.0';

  // API endpoints (for future use)
  static const String baseUrl = 'https://api.ridenow.com';

  // Shared preferences keys
  static const String userTokenKey = 'user_token';
  static const String userPhoneKey = 'user_phone';
  static const String isLoggedInKey = 'is_logged_in';

  // Mock data
  static const List<String> mockDriverNames = [
    'John Smith',
    'Sarah Johnson',
    'Michael Brown',
    'Emily Davis',
    'David Wilson',
  ];

  static const List<String> mockCarModels = [
    'Toyota Camry',
    'Honda Accord',
    'Tesla Model 3',
    'Ford Mustang',
    'BMW 3 Series',
  ];
}
