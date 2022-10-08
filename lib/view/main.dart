import 'package:flutter/material.dart';
import 'package:quiz_maker/services/auth/auth_service.dart';
import 'package:quiz_maker/view/home.dart';
import 'package:quiz_maker/view/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.Firebase().initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      print(email);

  runApp(MaterialApp(
    title: 'Flutter Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'AndadaPro',
    ),
    home: email == null ? const SignIn() : const Home(),
    routes: {
      '/signin/': (context) => const SignIn(),
      '/home/': (context) => const Home(),
    },
  ));
}
