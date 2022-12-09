class Lessons {
  List<LessonsItem>? lessons;
  Lessons({this.lessons});

  factory Lessons.fromJson(Map<String, dynamic> json) => Lessons(
        lessons: List<LessonsItem>.from(
            json["lessons"].map((x) => LessonsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (lessons != null) {
      data['lessons'] = lessons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LessonsItem {
  String? title;
  String? level;
  double? indicatorValue;
  int? price;
  String? content;
  bool? complete;
  bool? isChecked;

  LessonsItem({
    this.title,
    this.level,
    this.indicatorValue,
    this.price,
    this.content,
    this.complete = true,
    this.isChecked = false,
  });

  LessonsItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    level = json['level'];
    indicatorValue = json['indicatorValue'];
    price = json['price'];
    content = json['content'];
    complete = json['complete'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['title'] = title;
    data['level'] = level;
    data['indicatorValue'] = indicatorValue;
    data['price'] = price;
    data['content'] = content;
    data['complete'] = complete;
    data['isChecked'] = isChecked;
    return data;
  }
}
