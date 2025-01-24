import 'dart:convert';

const GOOGLE_API_KEY = 'AIzaSyCieWtYNQEA3HepWdFJZhnD8TlMfXwrLmQ';

class LocationHelper {
  static get http => null;

  static String generateLocationPreviewImage(
      {required double latitude, required double longitude}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(
      double latitude, double longitude) async {
    // return 'https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=$GOOGLE_API_KEY';
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?$latitude,$longitude&key=$GOOGLE_API_KEY';

    final response = await http.get(Uri.parse(url));
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}
