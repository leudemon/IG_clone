import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/screens/drawers/settings_drawer.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: true,
      endDrawer: Container(
          constraints: const BoxConstraints.expand(), child: const Menu()),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        actions: const [],
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Column(
          children: const [
            Text(
              'Fifth tab',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
