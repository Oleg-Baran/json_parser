import "dart:io";
import 'dart:math';
import 'dart:convert';

import '../models/guest/guest.dart';

class GuestFileService {
  // Generate name
  String _getRandomString() {
    String chars = "AliceBoneyRobenCostaRiko";
    String rs = String.fromCharCodes(Iterable.generate(
        7, (_) => chars.codeUnitAt(Random().nextInt(chars.length))));
    return rs;
  }

  //Create GuestList
  Map<String, Object> _guestMap() {
    List guestList = [];
    for (int i = 0; i < Random().nextInt(21); i++) {
      Map<String, dynamic> guestJson =
          Guest(name: _getRandomString(), hasFriend: Random().nextBool())
              .toJson();
      guestList.add(guestJson);
    }
    Map<String, Object> guestsToMap = {"guests": guestList};
    return guestsToMap;
  }

  // Create json and write to file .json
  Future<void> writeGuestsToJsonFile() async {
    File file = File("./lib/json/guests.json");
    String toJson = json.encode(_guestMap());
    await file.writeAsString(toJson);
  }

  //Decode Json & get Guest List
  Future<List<Guest>> readGuestsFromJsonFile() async {
    List<Guest> fromJson = [];
    File file = File("./lib/json/guests.json");
    final getJson = await file.readAsString();
    final decodeJson = json.decode(getJson);
    GuestList guestList = GuestList.fromJson(decodeJson);
    //print(guestList.guests);
    fromJson.addAll(guestList.guests!);
  return fromJson;
  }
}
