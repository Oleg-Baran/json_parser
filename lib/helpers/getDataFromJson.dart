// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/services.dart';
import '../models/lessons.dart';

class DataResponse {
  Future<List<LessonsItem>> getLessonItemsFromJsonFile() async {
    List<LessonsItem> fromJson = [];
    final String response =
        await rootBundle.loadString('assets//mock/lessons.json');
    final decodeJson = json.decode(response);
    Lessons lessonsList = Lessons.fromJson(decodeJson);
    fromJson.addAll(lessonsList.lessons!);
    return fromJson;
  }
}
