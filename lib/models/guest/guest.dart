import 'package:freezed_annotation/freezed_annotation.dart';
part 'guest.freezed.dart';
part 'guest.g.dart';

@freezed
class GuestList with _$GuestList {
  const factory GuestList({List<Guest>? guests}) = _GuestList;

  factory GuestList.fromJson(Map<String, dynamic> json) => _$GuestListFromJson(json);
}

@freezed
class Guest with _$Guest {
  const factory Guest({required String name, bool? hasFriend}) = _Guest;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);
}

//   GuestList.fromJson(Map<String, dynamic> json) {
//     if (json['guests'] != null) {
//       guests = <Guest>[];
//       json['guests'].forEach((v) {
//         guests!.add(Guest.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (guests != null) {
//       data['guests'] = guests!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
