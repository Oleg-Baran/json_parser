// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GuestList _$$_GuestListFromJson(Map<String, dynamic> json) => _$_GuestList(
      guests: (json['guests'] as List<dynamic>?)
          ?.map((e) => Guest.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_GuestListToJson(_$_GuestList instance) =>
    <String, dynamic>{
      'guests': instance.guests,
    };

_$_Guest _$$_GuestFromJson(Map<String, dynamic> json) => _$_Guest(
      name: json['name'] as String,
      hasFriend: json['hasFriend'] as bool?,
    );

Map<String, dynamic> _$$_GuestToJson(_$_Guest instance) => <String, dynamic>{
      'name': instance.name,
      'hasFriend': instance.hasFriend,
    };
