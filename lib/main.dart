import 'package:bwa_flutix/services/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                onPressed: () async {
                  SignInSignOutResult result = await AuthServices.signUp(
                      'dev.gafri@gmail.com',
                      '123456',
                      'gafri putra',
                      ['drama', 'music'],
                      'Language');
                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
                child: Text('Sign Up'),
              ),
              RaisedButton(
                onPressed: () async {
                  SignInSignOutResult result = await AuthServices.signIn(
                    'dev.gafri@gmail.com',
                    '1234567',
                  );
                  if (result.user == null) {
                    print(result.message);
                  } else {
                    print(result.user.toString());
                  }
                },
                child: Text('Sign In'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
