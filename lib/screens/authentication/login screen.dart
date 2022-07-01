import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/authentication/sign%20in.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return const SignIn();
  }
}
