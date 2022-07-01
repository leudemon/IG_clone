import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loadingWidget extends StatefulWidget {
  const loadingWidget({super.key});

  @override
  State<loadingWidget> createState() => _loadingWidgetState();
}

class _loadingWidgetState extends State<loadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Center(
          child: SpinKitCubeGrid(
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
