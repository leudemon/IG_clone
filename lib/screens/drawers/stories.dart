import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home/direct%20messages.dart';

class MyStories extends StatefulWidget {
  final String child1;
  const MyStories({super.key, required this.child1});

  @override
  State<MyStories> createState() => _MyStoriesState();
}

class _MyStoriesState extends State<MyStories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Dms()),
          );
        }),
        child: SizedBox(
            width: 80,
            height: 50,
            child: Container(
              padding: const EdgeInsets.only(top: 5, bottom: 5),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.orange, Colors.purple])),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Stack(alignment: Alignment.center, children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 3,
                        color: Colors.white,
                        style: BorderStyle.solid,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 37,
                      backgroundImage: AssetImage(widget.child1),
                    ),
                  ),
                ]),
              ),
            )),
      ),
    );
  }
}
