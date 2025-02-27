import 'dart:io';

class Placelocation {
  final double latitude;
  final double longitude;
  final String? address;

  const Placelocation({
    required this.latitude,
    required this.longitude,
    this.address,
  });
}

class Place {
  final String id;
  final String title;
  final Placelocation location;
  final File image;

  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
