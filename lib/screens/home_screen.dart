import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/location_provider.dart';
import '../widgets/search_bar.dart' as custom;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GoogleMapController? _mapController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<LocationProvider>(context, listen: false)
          .fetchCurrentLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);
    final position = locationProvider.currentPosition;
    final error = locationProvider.error;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (error != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, color: Colors.red, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      error,
                      style: const TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        locationProvider.fetchCurrentLocation();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            )
          else if (position != null)
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 15,
              ),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              onMapCreated: (controller) => _mapController = controller,
            )
          else
            const Center(child: CircularProgressIndicator()),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  custom.SearchBar(
                    controller: _searchController,
                    onTap: () {
                      // TODO: Open Google Places Autocomplete
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
