import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:test_2/authBloc/auth_bloc.dart';
import 'package:test_2/authBloc/auth_event.dart';
import 'package:test_2/authBloc/auth_state.dart';
import 'package:test_2/device.dart';
import 'package:test_2/devices_details.dart';
import 'package:test_2/loginscreen.dart';
import 'package:test_2/map.dart';

class MenuPrincipal extends StatefulWidget {
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {

  


  //markers for google map


  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
        Icon(Icons.directions_car_filled_outlined)
        ],
        backgroundColor: Colors.black,
        title: Text(
          'véhicule',
          style: TextStyle(
            fontSize: 22.0,
            color: Colors.white,
          ),
        ),
      ),
      drawer: Drawer(
        child:

            //
            BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated) {
              // Navigate to the sign in screen when the user Signs Out
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            }
          },
          child:

              //

              ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Emkatech.com'),
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
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.r9BAjRO-ijr6Dh6Nzw_9rgHaDV?pid=ImgDet&rs=1'),
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.directions_car_filled_outlined),
                title: Text('véhicule'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MenuPrincipal()));
                },
              ),
              ListTile(
                leading: Icon(Icons.smartphone),
                title: Text('carte'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyMap()));
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('exit'),
                onTap: () async {
                  BlocProvider.of<AuthBloc>(context).add(SignOutRequested());
                },
              ),
            ],
          ),
        ),
      ),
      body: device() ,
         floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const DeviceDetails(car: null, update: false)));
        },
        child: const Icon(Icons.add),
      ),
    );
  }



  
}
