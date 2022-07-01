import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Reels extends StatefulWidget {
  const Reels({super.key});

  @override
  State<Reels> createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text(
        'Third tab',
        style: TextStyle(color: Colors.black),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        title: const SizedBox(
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}
