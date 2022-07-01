import 'package:flutter/material.dart';
import 'package:flutter_firebase/services/auth.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _DrawerState();
}

class _DrawerState extends State<Menu> {
  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 1,
      child: ListView(
        children: [
          ListTile(
            iconColor: Colors.black,
            minLeadingWidth: 1,
            leading: const Icon(Icons.exit_to_app_outlined),
            title: const Text('Quit'),
            onTap: () async {
              await _auth.signOut();
              await Navigator.popAndPushNamed(context, '/sign in');
            },
          )
        ],
      ),
    );
  }
}
