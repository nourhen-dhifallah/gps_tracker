import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_2/authBloc/auth_bloc.dart';
import 'package:test_2/data/repositories/auth_repository.dart';
import 'package:test_2/loginscreen.dart';




// 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( MyApp());
 
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
          
        ),
        
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:loginscreen(),
        ),
      ),
    );
  }
}