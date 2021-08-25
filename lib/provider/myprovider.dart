import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latest_hotel/models/admin.dart';
import 'package:latest_hotel/models/hotel.dart';

class MyProvider with ChangeNotifier {
  List<Hotel> hotelList = [];
  late Hotel hotel1;

  Future<void> getHotels() async {
    List<Hotel> list = [];
    QuerySnapshot querySnapshot =
    await Firestore.instance.collection("hotels").getDocuments();
    querySnapshot.documents.forEach(
          (hoteldata) {
        hotel1 = Hotel(
          location: hoteldata.data["location"],
          name: hoteldata.data["name"],
          price: hoteldata.data["price"],
          rating: hoteldata.data["rating"],
          availrooms: hoteldata.data["availrooms"],
          url: hoteldata.data["url"],
          key: hoteldata.data["key"],
          room_url: hoteldata.data["room_url"],);

        list.add(hotel1);
      },
    );
    hotelList = list;
    notifyListeners();
  }

  List<Hotel> get getHotelList {
    return hotelList;
  }

  List<Admin> infoList = [];
  late Admin info1;

  Future<void> getInfo() async {
    List<Admin> list = [];
    QuerySnapshot querySnapshot =
    await Firestore.instance.collection("adminpage").getDocuments();
    querySnapshot.documents.forEach(
          (infodata) {
        info1 = Admin(
          name: infodata.data["name"],
          email: infodata.data["email"],
          date: infodata.data["date"],
          nights: infodata.data["nights"],
          number: infodata.data["number"],
          username: infodata.data["username"],
          rooms: infodata.data["rooms"]);

        list.add(info1);
      },
    );
    infoList = list;
    notifyListeners();
  }

  List<Admin> get getInfoList {
    return infoList;
  }

}
