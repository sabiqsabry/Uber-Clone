import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class MapService {
  static Future<List<LatLng>> getRouteCoordinates(
    LatLng start,
    LatLng end,
    String apiKey,
  ) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      apiKey,
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(end.latitude, end.longitude),
    );
    if (result.points.isNotEmpty) {
      return result.points
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    }
    return [];
  }
}
