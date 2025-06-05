# RideNow

A minimalist Uber clone built with Flutter, featuring a clean and modern UI with smooth transitions.

## Features

- 🚀 Splash screen with app logo
- 📱 Phone number login with OTP verification
- 🗺️ Interactive map with current location
- 🔍 Location search with autocomplete
- 🚗 Multiple ride type options
- 👨‍✈️ Driver search simulation
- 📍 Real-time ride tracking
- ⭐ Driver rating system
- 📜 Ride history
- 👤 User profile management

## Getting Started

### Prerequisites

- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Google Maps API Key

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/ridenow.git
cd ridenow
```

2. Install dependencies:
```bash
flutter pub get
```

3. Configure Google Maps API Key:
   - Get an API key from the [Google Cloud Console](https://console.cloud.google.com)
   - Enable Maps SDK for Android and iOS
   - Create a `.env` file in the root directory
   - Add your API key to the `.env` file:
     ```
     GOOGLE_MAPS_API_KEY=your_api_key_here
     ```
   - For iOS, update the API key in `ios/Runner/AppDelegate.swift`
   - For Android, add the API key to `android/app/src/main/AndroidManifest.xml`:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="${GOOGLE_MAPS_API_KEY}" />
     ```

4. Run the app:
```bash
flutter run
```

## Environment Setup

The app uses environment variables for sensitive configuration. Make sure to:

1. Never commit the `.env` file to version control
2. Keep your API keys secure
3. Create a `.env` file with the following structure:
```
GOOGLE_MAPS_API_KEY=your_api_key_here
```

## Project Structure

```
lib/
├── config/         # App configuration and constants
├── models/         # Data models
├── providers/      # State management
├── screens/        # UI screens
├── services/       # Business logic and API calls
└── widgets/        # Reusable UI components
```

## Dependencies

- provider: ^6.1.0
- google_maps_flutter: ^2.5.0
- geolocator: ^11.0.0
- shared_preferences: ^2.2.2
- flutter_polyline_points: ^1.0.0
- google_place: ^0.4.7
- http: ^0.13.6
- intl: ^0.18.1
- flutter_secure_storage: ^9.0.0
- flutter_dotenv: ^5.1.0

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Flutter team for the amazing framework
- Google Maps Platform for location services
- All contributors who have helped shape this project
