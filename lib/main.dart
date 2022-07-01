import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/home/direct%20messages.dart';
import 'package:flutter_firebase/screens/home/home.dart';
import 'package:flutter_firebase/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/screens/authentication/sign%20up.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/screens/authentication/sign in.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.top]);
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/sign in',
      routes: {
        '/sign in': (context) => const SignIn(),
        '/sign up': (context) => const SignUp(),
        '/dms': (context) => const Dms(),
        '/home': (context) => const Home(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.white),
      home: StreamProvider<MyUser?>.value(
        catchError: (context, error) {
          return null;
        },
        initialData: null,
        value: Authservice().user,
        child: const Wrapper(),
      ),
    );
  }
}
