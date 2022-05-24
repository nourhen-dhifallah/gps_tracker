// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Car _$CarFromJson(Map<String, dynamic> json) {
  return _Car.fromJson(json);
}

/// @nodoc
mixin _$Car {
  String? get id => throw _privateConstructorUsedError;
  set id(String? value) => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  set name(String? value) => throw _privateConstructorUsedError;
  String? get model => throw _privateConstructorUsedError;
  set model(String? value) => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  set lat(double? value) => throw _privateConstructorUsedError;
  double? get long => throw _privateConstructorUsedError;
  set long(double? value) => throw _privateConstructorUsedError;
  double? get imei => throw _privateConstructorUsedError;
  set imei(double? value) => throw _privateConstructorUsedError;
  double? get serie => throw _privateConstructorUsedError;
  set serie(double? value) => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  set userId(String? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CarCopyWith<Car> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CarCopyWith<$Res> {
  factory $CarCopyWith(Car value, $Res Function(Car) then) =
      _$CarCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? name,
      String? model,
      double? lat,
      double? long,
      double? imei,
      double? serie,
      String? userId});
}

/// @nodoc
class _$CarCopyWithImpl<$Res> implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._value, this._then);

  final Car _value;
  // ignore: unused_field
  final $Res Function(Car) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? model = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? imei = freezed,
    Object? serie = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      imei: imei == freezed
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as double?,
      serie: serie == freezed
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$$_CarCopyWith(_$_Car value, $Res Function(_$_Car) then) =
      __$$_CarCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? name,
      String? model,
      double? lat,
      double? long,
      double? imei,
      double? serie,
      String? userId});
}

/// @nodoc
class __$$_CarCopyWithImpl<$Res> extends _$CarCopyWithImpl<$Res>
    implements _$$_CarCopyWith<$Res> {
  __$$_CarCopyWithImpl(_$_Car _value, $Res Function(_$_Car) _then)
      : super(_value, (v) => _then(v as _$_Car));

  @override
  _$_Car get _value => super._value as _$_Car;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? model = freezed,
    Object? lat = freezed,
    Object? long = freezed,
    Object? imei = freezed,
    Object? serie = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$_Car(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      model: model == freezed
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: lat == freezed
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      long: long == freezed
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as double?,
      imei: imei == freezed
          ? _value.imei
          : imei // ignore: cast_nullable_to_non_nullable
              as double?,
      serie: serie == freezed
          ? _value.serie
          : serie // ignore: cast_nullable_to_non_nullable
              as double?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Car implements _Car {
  _$_Car(
      {this.id,
      this.name,
      this.model,
      this.lat,
      this.long,
      this.imei,
      this.serie,
      this.userId});

  factory _$_Car.fromJson(Map<String, dynamic> json) => _$$_CarFromJson(json);

  @override
  String? id;
  @override
  String? name;
  @override
  String? model;
  @override
  double? lat;
  @override
  double? long;
  @override
  double? imei;
  @override
  double? serie;
  @override
  String? userId;

  @override
  String toString() {
    return 'Car(id: $id, name: $name, model: $model, lat: $lat, long: $long, imei: $imei, serie: $serie, userId: $userId)';
  }

  @JsonKey(ignore: true)
  @override
  _$$_CarCopyWith<_$_Car> get copyWith =>
      __$$_CarCopyWithImpl<_$_Car>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CarToJson(this);
  }
}

abstract class _Car implements Car {
  factory _Car(
      {String? id,
      String? name,
      String? model,
      double? lat,
      double? long,
      double? imei,
      double? serie,
      String? userId}) = _$_Car;

  factory _Car.fromJson(Map<String, dynamic> json) = _$_Car.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  String? get model => throw _privateConstructorUsedError;
  @override
  double? get lat => throw _privateConstructorUsedError;
  @override
  double? get long => throw _privateConstructorUsedError;
  @override
  double? get imei => throw _privateConstructorUsedError;
  @override
  double? get serie => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CarCopyWith<_$_Car> get copyWith => throw _privateConstructorUsedError;
}
