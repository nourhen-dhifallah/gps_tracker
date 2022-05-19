import 'package:flutter/material.dart';
import 'package:test_2/device.dart';

class deviceDetails extends StatefulWidget {
   final String name;
   

const  deviceDetails ({ Key? key,required this.name }) : super(key: key);
  @override
  State<deviceDetails> createState() => _deviceDetailsState(name:name); 
  

}

class _deviceDetailsState extends State<deviceDetails> {
  var nomcontroller = TextEditingController();
  var imeicontroller = TextEditingController();
  var modelecontroller = TextEditingController();
   var seriecontroller = TextEditingController();
  late String name;
   _deviceDetailsState({required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text('caractéristique'.toString()
        )),
        backgroundColor: Colors.black,
        
       
        ),
        body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     'information  ',
                     style: TextStyle(
                       fontSize: 40.0,
                       color: Color.fromARGB(137, 15, 14, 14),
                       fontWeight: FontWeight.bold,
                     ),
                   ),
              
           SizedBox(
             height: 40.0,
           ),
           TextFormField(
             controller:nomcontroller ,
             keyboardType: TextInputType.emailAddress,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: 'nom',
               
               border: OutlineInputBorder(),
             ),
           ),
           SizedBox(
             height: 15.0,
           ),
           TextFormField(
             controller: imeicontroller,
             keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: 'imei',
               
               suffixIcon: Icon(
                 Icons.remove_red_eye,
               ),
               border: OutlineInputBorder(),
             ),
           ),
                     SizedBox(
             height: 15.0,
           ),
           TextFormField(
             controller: modelecontroller,
             keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: ' modele',
               
               
               border: OutlineInputBorder(),
             ),
           ),
           SizedBox(
             height: 20.0,
           ),
TextFormField(
             controller: seriecontroller,
             keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: 'serie',
               
              
               border: OutlineInputBorder(),
             ),
           ),
                     SizedBox(
             height: 15.0,
           ),

Container(
             width: double.infinity,
             color: Color.fromARGB(255, 16, 17, 19),
             child: MaterialButton(
               
              onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>device()));
               
               },
                
               child: Text(
                
                 'REGISTER',
                 style: TextStyle(
                   color: Colors.white60,
                    
                 ),
               ),
             ),
           ),


                 ]

        ),
      ),
        ),
    );
        


     
    

  }
  }



