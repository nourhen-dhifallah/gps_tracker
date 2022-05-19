import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_2/models/car.dart';

class CarRepository {


  Stream<List<Car>?> getCars ()    {
 final doc =   FirebaseFirestore.instance.collection("cars").snapshots() ;
   

   
   return doc.map((QuerySnapshot snapshots) {
   return   snapshots.docs.map((e) => Car.fromDocument(e)).toList();
    });
 }



}
