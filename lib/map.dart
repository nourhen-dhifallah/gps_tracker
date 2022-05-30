import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_2/data/repositories/car_repository.dart';
import 'package:test_2/models/car.dart';

class MyMap extends StatelessWidget {
   GoogleMapController? mapController;
   Car? car;
   MyMap({Key? key, this.mapController, this.car}) : super(key: key);
var myMenuItems = <String>[
    'type de carte',
    'paramétres',
  ];

  void onSelect(item) {
    switch (item) {
      case 'type de carte ':
        print('type de carte cliked');
        break;

      case 'paramétres':
        print('paramétres clicked');
        break;
    }
  }
  @override
  Widget build(BuildContext context) {
    const LatLng showLocation = const LatLng(35.709729, 10.678795);
    return Scaffold(
        appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: onSelect,
              itemBuilder: (BuildContext context) {
                return myMenuItems.map((String choice) {
                  return PopupMenuItem<String>(
                    child: Text(choice),
                    value: choice,
                  );
                }).toList();
              })
        ],
        backgroundColor: Colors.black,
        title: Text(
          'carte',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
      ),
      body: StreamBuilder<List<Car>?>(
          stream: CarRepository().getCars(),
          builder: (context, snapshot) {
            return GoogleMap(
              //Map widget from google_maps_flutter package
              zoomGesturesEnabled: true, //enable Zoom in, out on map
              initialCameraPosition: CameraPosition(
                //innital position in map
                target: showLocation, //initial position
                zoom: 15.0, //initial zoom level
              ),
              markers: getmarkers(
                  snapshot.data, showLocation), //markers to show on map
    
              mapType: MapType.terrain, //map type
              onMapCreated: (controller) {
                //method called when map is created
              
                  mapController = controller;
               
              },
            );
          }),
    );
  }

  Set<Marker> getmarkers(List<Car>? cars, LatLng showLocation) {
    //markers to place on map
    if (cars != null) {
      Set<Marker> markers = new Set();
      cars.forEach((element) {
        markers.add(Marker(
          //add second marker
          markerId: MarkerId(showLocation.toString()),
          position: LatLng(element.srcLat ?? 35.713143,
              element.srclong ?? 10.670656), //position of marker
          infoWindow: InfoWindow(
            //popup info
            title: element.name,
            snippet: element.model,
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      });

      return markers;
    } else {
      return <Marker>{};
    }
  }
}
