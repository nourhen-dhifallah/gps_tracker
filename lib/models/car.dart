import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
class Car with _$Car {

  factory Car( {
    String? id ,
    String? name ,
    String? model ,
    double? lat ,
    double? long ,
    double? imei ,
    double? serie 
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
   factory Car.fromDocument(DocumentSnapshot doc) =>
      Car.fromJson(doc.data() as Map<String, dynamic>)
          .copyWith(id: doc.id);
}



