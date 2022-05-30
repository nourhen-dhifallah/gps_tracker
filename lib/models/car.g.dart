// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Car _$$_CarFromJson(Map<String, dynamic> json) => _$_Car(
      id: json['id'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      srcLat: (json['srcLat'] as num?)?.toDouble(),
      srclong: (json['srclong'] as num?)?.toDouble(),
      desLat: (json['desLat'] as num?)?.toDouble(),
      deslong: (json['deslong'] as num?)?.toDouble(),
      imei: (json['imei'] as num?)?.toDouble(),
      serie: (json['serie'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$_CarToJson(_$_Car instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'model': instance.model,
      'srcLat': instance.srcLat,
      'srclong': instance.srclong,
      'desLat': instance.desLat,
      'deslong': instance.deslong,
      'imei': instance.imei,
      'serie': instance.serie,
      'userId': instance.userId,
    };
