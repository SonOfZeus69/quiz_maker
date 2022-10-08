import 'package:flutter/material.dart';
import 'package:quiz_maker/services/auth/auth_service.dart';
import 'package:quiz_maker/view/create_quiz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await AuthService.Firebase().logOut();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('email');

            // ignore: use_build_context_synchronously
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/signin/',
              (_) => false,
            );
          },
          child: const Text('Logout'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const CreateQuiz()));
        },
      ),
    );
  }
}
