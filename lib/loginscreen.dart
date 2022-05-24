import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2/authBloc/auth_bloc.dart';
import 'package:test_2/authBloc/auth_event.dart';
import 'package:test_2/authBloc/auth_state.dart';
import 'package:test_2/sign%20up%20.dart';
import 'menuprincipal.dart';

class LoginScreen extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var passwordconfirmcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              print('Authenticated');
              // Navigating to the menuprincipal screen if the user is authenticated
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MenuPrincipal()));
            }
            if (state is AuthError) {
              print(' not auth');
              // Showing the error message if the user has entered invalid credentials
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
            if (state is Loading) {
              // Showing the loading indicator while the user is signing in
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UnAuthenticated) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'GPS TRACKER',
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Color.fromARGB(137, 15, 14, 14),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        //height: 200.0,
                        width: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                            'https://i.pinimg.com/564x/6b/2a/f8/6b2af809bc10a12d6d02e126ee3b0d21.jpg',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
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
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: double.infinity,
                        color: Color.fromARGB(255, 16, 17, 19),
                        child: MaterialButton(
                          onPressed: () async {
                            BlocProvider.of<AuthBloc>(context).add(
                                SignInRequested(emailcontroller.text,
                                    passwordcontroller.text));
                          },
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.white60,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Do you have an account?'),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => register()));
                              },
                              child: Text(
                                'register now',
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
              );
            } else
              return Text("error");
          }),
        ));
  }
}
