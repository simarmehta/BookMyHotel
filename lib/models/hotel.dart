import 'package:flutter/cupertino.dart';

class Hotel {
  String location;
  String name;
  int availrooms;
  int price;
  int rating;
  String url;
  String key;
  String room_url;

  Hotel({
    required this.location,
    required this.name,
    required this.price,
    required this.rating,
    required this.availrooms,
    required this.url,
    required this.key,
    required this.room_url
  });
}
