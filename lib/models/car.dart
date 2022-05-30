import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@unfreezed
class Car with _$Car {

  factory Car( {
    String? id ,
    String? name ,
    String? model ,
    double? srcLat ,
    double? srclong ,
    double? desLat,
    double? deslong,
    double? imei ,
    double? serie ,
    String? userId ,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
   factory Car.fromDocument(DocumentSnapshot doc) =>
      Car.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(id: doc.id);
}



