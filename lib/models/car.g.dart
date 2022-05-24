// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Car _$$_CarFromJson(Map<String, dynamic> json) => _$_Car(
      id: json['id'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      long: (json['long'] as num?)?.toDouble(),
      imei: (json['imei'] as num?)?.toDouble(),
      serie: (json['serie'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_CarToJson(_$_Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'lat': instance.lat,
      'long': instance.long,
      'imei': instance.imei,
      'serie': instance.serie,
      'userId': instance.userId,
    };
