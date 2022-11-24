// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'guest.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GuestList _$GuestListFromJson(Map<String, dynamic> json) {
  return _GuestList.fromJson(json);
}

/// @nodoc
mixin _$GuestList {
  List<Guest>? get guests => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestListCopyWith<GuestList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestListCopyWith<$Res> {
  factory $GuestListCopyWith(GuestList value, $Res Function(GuestList) then) =
      _$GuestListCopyWithImpl<$Res, GuestList>;
  @useResult
  $Res call({List<Guest>? guests});
}

/// @nodoc
class _$GuestListCopyWithImpl<$Res, $Val extends GuestList>
    implements $GuestListCopyWith<$Res> {
  _$GuestListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guests = freezed,
  }) {
    return _then(_value.copyWith(
      guests: freezed == guests
          ? _value.guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuestListCopyWith<$Res> implements $GuestListCopyWith<$Res> {
  factory _$$_GuestListCopyWith(
          _$_GuestList value, $Res Function(_$_GuestList) then) =
      __$$_GuestListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Guest>? guests});
}

/// @nodoc
class __$$_GuestListCopyWithImpl<$Res>
    extends _$GuestListCopyWithImpl<$Res, _$_GuestList>
    implements _$$_GuestListCopyWith<$Res> {
  __$$_GuestListCopyWithImpl(
      _$_GuestList _value, $Res Function(_$_GuestList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? guests = freezed,
  }) {
    return _then(_$_GuestList(
      guests: freezed == guests
          ? _value._guests
          : guests // ignore: cast_nullable_to_non_nullable
              as List<Guest>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GuestList implements _GuestList {
  const _$_GuestList({final List<Guest>? guests}) : _guests = guests;

  factory _$_GuestList.fromJson(Map<String, dynamic> json) =>
      _$$_GuestListFromJson(json);

  final List<Guest>? _guests;
  @override
  List<Guest>? get guests {
    final value = _guests;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GuestList(guests: $guests)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GuestList &&
            const DeepCollectionEquality().equals(other._guests, _guests));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_guests));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuestListCopyWith<_$_GuestList> get copyWith =>
      __$$_GuestListCopyWithImpl<_$_GuestList>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestListToJson(
      this,
    );
  }
}

abstract class _GuestList implements GuestList {
  const factory _GuestList({final List<Guest>? guests}) = _$_GuestList;

  factory _GuestList.fromJson(Map<String, dynamic> json) =
      _$_GuestList.fromJson;

  @override
  List<Guest>? get guests;
  @override
  @JsonKey(ignore: true)
  _$$_GuestListCopyWith<_$_GuestList> get copyWith =>
      throw _privateConstructorUsedError;
}

Guest _$GuestFromJson(Map<String, dynamic> json) {
  return _Guest.fromJson(json);
}

/// @nodoc
mixin _$Guest {
  String get name => throw _privateConstructorUsedError;
  bool? get hasFriend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GuestCopyWith<Guest> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GuestCopyWith<$Res> {
  factory $GuestCopyWith(Guest value, $Res Function(Guest) then) =
      _$GuestCopyWithImpl<$Res, Guest>;
  @useResult
  $Res call({String name, bool? hasFriend});
}

/// @nodoc
class _$GuestCopyWithImpl<$Res, $Val extends Guest>
    implements $GuestCopyWith<$Res> {
  _$GuestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hasFriend = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasFriend: freezed == hasFriend
          ? _value.hasFriend
          : hasFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GuestCopyWith<$Res> implements $GuestCopyWith<$Res> {
  factory _$$_GuestCopyWith(_$_Guest value, $Res Function(_$_Guest) then) =
      __$$_GuestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, bool? hasFriend});
}

/// @nodoc
class __$$_GuestCopyWithImpl<$Res> extends _$GuestCopyWithImpl<$Res, _$_Guest>
    implements _$$_GuestCopyWith<$Res> {
  __$$_GuestCopyWithImpl(_$_Guest _value, $Res Function(_$_Guest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? hasFriend = freezed,
  }) {
    return _then(_$_Guest(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      hasFriend: freezed == hasFriend
          ? _value.hasFriend
          : hasFriend // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Guest implements _Guest {
  const _$_Guest({required this.name, this.hasFriend});

  factory _$_Guest.fromJson(Map<String, dynamic> json) =>
      _$$_GuestFromJson(json);

  @override
  final String name;
  @override
  final bool? hasFriend;

  @override
  String toString() {
    return 'Guest(name: $name, hasFriend: $hasFriend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Guest &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.hasFriend, hasFriend) ||
                other.hasFriend == hasFriend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, hasFriend);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GuestCopyWith<_$_Guest> get copyWith =>
      __$$_GuestCopyWithImpl<_$_Guest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GuestToJson(
      this,
    );
  }
}

abstract class _Guest implements Guest {
  const factory _Guest({required final String name, final bool? hasFriend}) =
      _$_Guest;

  factory _Guest.fromJson(Map<String, dynamic> json) = _$_Guest.fromJson;

  @override
  String get name;
  @override
  bool? get hasFriend;
  @override
  @JsonKey(ignore: true)
  _$$_GuestCopyWith<_$_Guest> get copyWith =>
      throw _privateConstructorUsedError;
}
