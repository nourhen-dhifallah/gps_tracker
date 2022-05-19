

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2/authBloc/auth_bloc.dart';
import 'package:test_2/authBloc/auth_event.dart';
import 'package:test_2/loginscreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_2/menuprincipal.dart';



class register extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var passwordconfirmcontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    MaterialApp();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text(
                     'sign up ',
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
             controller: emailcontroller,
             keyboardType: TextInputType.emailAddress,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: 'Email',
               prefixIcon: Icon(
                 Icons.email,
               ),
               border: OutlineInputBorder(),
             ),
           ),
           SizedBox(
             height: 15.0,
           ),
           TextFormField(
             controller: passwordcontroller,
             keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: 'Password',
               prefixIcon: Icon(
                 Icons.lock,
               ),
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
             controller: passwordconfirmcontroller,
             keyboardType: TextInputType.visiblePassword,
             obscureText: true,
             onFieldSubmitted: (value) {
               print(value);
             },
             decoration: InputDecoration(
               labelText: ' Confirm Password ',
               prefixIcon: Icon(
                 Icons.lock,
               ),
               suffixIcon: Icon(
                 Icons.remove_red_eye,
               ),
               border: OutlineInputBorder(),
             ),
           ),
           SizedBox(
             height: 20.0,
           ),
           
           Container(
             width: double.infinity,
             color: Color.fromARGB(255, 16, 17, 19),
             child: MaterialButton(
               
               onPressed: 
               
                () async { 
 BlocProvider.of<AuthBloc>(context).add(
          SignUpRequested(emailcontroller.text, passwordcontroller.text),
    );               },
               child: Text(
                
                 'REGISTER',
                 style: TextStyle(
                   color: Colors.white60,
                    
                 ),
               ),
             ),
           ),
             
           SizedBox(
             height: 15.0,
           ),
           Row(mainAxisAlignment: MainAxisAlignment.center, children: [
             Text('Do you have an account?'),
             TextButton(
               onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>loginscreen()));
               
               },
               child: Text('Login',
              
               
               ),
             ),
           ]),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 30,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.network(
                       'https://cdn-icons-png.flaticon.com/512/60/60580.png',
                       fit: BoxFit.cover,
                     ),
                   )),
               CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 30,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.network(
                       'https://cdn-icons-png.flaticon.com/512/60/60818.png',
                       fit: BoxFit.cover,
                     ),
                   )),
               CircleAvatar(
                   backgroundColor: Colors.white,
                   radius: 32,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Image.network(
                       'https://th.bing.com/th/id/OIP.0eqXdweBQp8tcmHJhoFgWgHaHV?pid=ImgDet&rs=1',
                       fit: BoxFit.cover,
                     ),
                   ))
             ],
           ),
               ],
           ),
        ),
      )
    );
  }
}

