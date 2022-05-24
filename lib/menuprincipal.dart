
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_2/authBloc/auth_bloc.dart';
import 'package:test_2/authBloc/auth_event.dart';
import 'package:test_2/authBloc/auth_state.dart';
import 'package:test_2/data/repositories/auth_repository.dart';
import 'package:test_2/data/repositories/car_repository.dart';
import 'package:test_2/device.dart';
import 'package:test_2/loginscreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:test_2/models/car.dart';



class  menuprincipal extends StatefulWidget
{
      _menuprincipalState createState() => _menuprincipalState();

}
class _menuprincipalState extends State<menuprincipal> {
  final databaseReference = FirebaseDatabase.instance.ref();
 
var myMenuItems = <String>[
     'type de carte',
     'paramétres',
  ]; 

void  onSelect(item) {
   switch (item) {
   case 'type de carte ':
      print('type de carte cliked');
   break;
      
   case 'paramétres':
       print('paramétres clicked');
   break;
    }
  }
  late GoogleMapController mapController; //contrller for Google map
  
  
   
  
   //markers for google map
  static const LatLng showLocation = const LatLng(35.709729, 10.678795); 

 @override



  void initState(){
    super.initState();
     
    
    
  }
  

 
  Widget build(BuildContext context) 
  {
   
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
                    })
                  .toList();
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

     drawer:   Drawer(
     child:  
     
     //
     BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
             Navigator.push(context,MaterialPageRoute(builder: (context)=>loginscreen()));

          }
        },
        child:

     //
     
      ListView(
     padding: EdgeInsets.zero,
     children: 
     [
               UserAccountsDrawerHeader(
     accountName:  Text ('Emkatech.com'),
     accountEmail: Text('Emkatechtunisia@gmail.com'),
     currentAccountPicture: CircleAvatar(
     child: ClipOval(
     child: Image.network(
  'https://scontent.ftun14-1.fna.fbcdn.net/v/t1.6435-9/148297159_240246320984043_5231837191306049136_n.png?_nc_cat=106&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=UUcqmQlobeEAX-XWQzZ&_nc_ht=scontent.ftun14-1.fna&oh=00_AT9lpPdkh2DGJnzm7_s8cGGzGT63JF6grMSsu0O51q8s9Q&oe=627D6785',
     fit: BoxFit.cover,
     width: 90.0,
     height: 90.0,

 ),
),
 ),
    decoration: BoxDecoration(
    color: Colors.blue,
    image: DecorationImage(
     fit: BoxFit.fill,
     image: NetworkImage('https://th.bing.com/th/id/OIP.r9BAjRO-ijr6Dh6Nzw_9rgHaDV?pid=ImgDet&rs=1'),
   ),
 ),
),

  ListTile(
leading: Icon(Icons.directions_car_filled_outlined),
title: Text('véhicule'),
onTap: (){

  Navigator.push(context,MaterialPageRoute(builder: (context)=>device()));
},


),
ListTile(
leading: Icon(Icons.smartphone),
title: Text('carte'),
onTap: (){
   Navigator.push(context,MaterialPageRoute(builder: (context)=>menuprincipal()));
},
),

ListTile(
leading: Icon(Icons.exit_to_app),
title: Text('exit'),
 onTap:  () async { 
 BlocProvider.of<AuthBloc>(context).add(
                             SignOutRequested()
    );              },
),
     ],
   ),
     ),
   ),


   
     body: StreamBuilder<List<Car>?>(
       stream: CarRepository().getCars(),
       builder: (context, snapshot) {
         return GoogleMap( //Map widget from google_maps_flutter package
           zoomGesturesEnabled: true, //enable Zoom in, out on map
           initialCameraPosition: CameraPosition( //innital position in map
           target: showLocation, //initial position
           zoom: 15.0, //initial zoom level
                        ),
           markers: getmarkers(snapshot.data), //markers to show on map
                         
          mapType: MapType.terrain, //map type
          onMapCreated: (controller) { //method called when map is created
          setState(() {
          mapController = controller; 
                          });
                        },
                      );
       }
     ),
 );    
  }
Future getData() async{
  var location = await databaseReference.child('device1').get();
  print(location.value);
  return location.value;
}
 Set<Marker> getmarkers(List<Car>? cars )
   {
    //markers to place on map
    if(cars !=null )
   
     {  Set<Marker> markers = new Set();
     cars.forEach((element) {
          markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(element.lat ?? 35.713143,element.long ?? 10.670656), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: element.name,
          snippet: element.model,
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));
     }) ;
     
    return markers ;
     }
     else 
    { return  <Marker>{};}
  
}
    
}

