import 'package:flutter/material.dart';
import 'package:test_2/data/repositories/car_repository.dart';
import 'package:test_2/devices_details.dart';
import 'package:test_2/loginscreen.dart';
import 'package:test_2/models/car.dart';

class device extends StatefulWidget {
  const device({Key? key}) : super(key: key);

  @override
  _deviceState createState() => _deviceState();
}

class _deviceState extends State<device> {
  final List<Map<String, dynamic>> _allUsers = [
    {"name": "véhicule N°1 "},
    {"name": "véhiculeN°2"},
    {"name": "véhicule N°3"},
    {"name": "véhicule N°4"},
  ];

  // This list holds the data for the list view
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  initState() {
    // at the beginning, all users are shown
    _foundUsers = _allUsers;
    super.initState();
  }

  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = _allUsers;
    } else {
      results = _allUsers
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (value) => _runFilter(value),
            decoration: const InputDecoration(
                labelText: 'Search', suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: StreamBuilder<List<Car>?>(
                  stream: CarRepository().getCars(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else {
                      if (snapshot.hasData) {
                        var cars = snapshot.data!;
                        return ListView.builder(
                            itemCount: cars.length,
                            itemBuilder: (context, index) {
                              var car = cars[index];
                              return Card(
                                key: ValueKey(car.serie),
                                color: Color.fromARGB(255, 78, 78, 76),
                                elevation: 4,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => DeviceDetails(
                                                car: car, update: true)));
                                  },

                                  title: Text(car.name ?? ""),
                                  // *  subtitle: Text(
                                  // *    '${_foundUsers[index]["id"].toString()}'),
                                ),
                              );
                            });
                      } else {
                        return const Text(
                          'No results found',
                          style: TextStyle(fontSize: 24),
                        );
                      }
                    }
                  })),
        ],
      ),
    );

    
  }
}
