//Model of guest
class Guest {
  final String name;
  final bool? hasFriend;

  const Guest({required this.name, this.hasFriend});

  factory Guest.fromJson(Map<String, dynamic> json) {
    return Guest(name: json['name'], hasFriend: json['hasFriend']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['hasFriend'] = this.hasFriend;
    return data;
  }
}
