import 'package:flutter/material.dart';
import 'package:quiz_maker/services/auth/auth_service.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: TextButton(onPressed: () async {
          await AuthService.Firebase().logOut();

          // ignore: use_build_context_synchronously
          Navigator.of(context).pushNamedAndRemoveUntil(
                      '/signin/',
                      (_) => false,
                    );
        }, child: const Text('Logout')),
      ),
    );
  }
}
