import 'package:flutter/material.dart';
import 'package:quiz_maker/services/auth/auth_service.dart';
import 'package:quiz_maker/view/home.dart';
import 'package:quiz_maker/view/signin.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.Firebase().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'AndadaPro',
      ),
      home: const SignIn(),
      routes: {
      '/signin/': (context) => const SignIn(),
      '/home/': (context) => const Home(),
      
    },
    );
  }
}
