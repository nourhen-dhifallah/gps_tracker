import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_2/data/repositories/car_repository.dart';
import 'package:test_2/device.dart';
import 'package:test_2/models/car.dart';

class DeviceDetails extends StatefulWidget {
  final Car? car;

  final bool update;

  const DeviceDetails({Key? key, required this.car, this.update = false})
      : super(key: key);
  @override
  State<DeviceDetails> createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  var nomcontroller = TextEditingController();
  var imeicontroller = TextEditingController();
  var modelecontroller = TextEditingController();
  var seriecontroller = TextEditingController();
  Car newCar = Car();
  CarRepository repo = CarRepository();
  @override
  Widget build(BuildContext context) {
    if (widget.car !=null) {
      newCar = widget.car!;
    }
    return Scaffold(
      appBar: AppBar(
        title: (Text('caractéristique'.toString())),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const Text(
              'information  ',
              style: TextStyle(
                fontSize: 40.0,
                color: Color.fromARGB(137, 15, 14, 14),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            TextFormField(
              controller: nomcontroller..text = widget.car?.name ?? "",
              keyboardType: TextInputType.text,
              onChanged: (value) {
                newCar.name = value;
              },
              decoration: const InputDecoration(
                labelText: 'nom',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: imeicontroller
                ..text = widget.car?.imei?.toString() ?? "",
              keyboardType: const TextInputType.numberWithOptions(),
              onChanged: (value) {
                newCar.imei = double.parse(value);
              },
              decoration: const InputDecoration(
                labelText: 'imei',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            TextFormField(
              controller: modelecontroller..text = widget.car?.model ?? "",
              keyboardType: TextInputType.text,
              onChanged: (value) {
                newCar.model = value;
              },
              decoration: const InputDecoration(
                labelText: ' modele',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextFormField(
              controller: seriecontroller
                ..text = widget.car?.serie?.toString() ?? "",
              keyboardType: TextInputType.number,
              onChanged: (value) {
                newCar.serie = double.parse(value);
              },
              decoration: const InputDecoration(
                labelText: 'serie',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            isCurrentUser(widget.car?.userId ,widget.update)
                ? Container(
                    width: double.infinity,
                    color: const Color.fromARGB(255, 16, 17, 19),
                    child: MaterialButton(
                      onPressed: () {
                        newCar.userId = FirebaseAuth.instance.currentUser?.uid;
                        widget.update
                            ? repo.updateCar(newCar)
                            : repo.addCar(newCar);
                        Navigator.pop(context);
                      },
                      child: Text(
                        widget.update ? 'MODIFIER' : 'AJOUTER',
                        style: const TextStyle(
                          color: Colors.white60,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ]),
        ),
      ),
    );
  }

  bool isCurrentUser(String? userId , bool update) {
    return !update || FirebaseAuth.instance.currentUser?.uid == userId;
  }
}
