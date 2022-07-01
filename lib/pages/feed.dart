import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/data.dart';
import 'package:flutter_firebase/screens/drawers/posts.dart';
import 'package:flutter_firebase/screens/drawers/stories.dart';

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: Container(
              padding: const EdgeInsets.fromLTRB(0, 90, 100, 80),
              child:
                  const Image(image: AssetImage('assets/images/thegram.png'))),
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          elevation: 0.2,
          actions: [
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add_a_photo_outlined),
              color: Colors.black,
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/dms');
              },
              icon: const Icon(Icons.message_outlined),
              color: Colors.black,
            ),
          ]),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 100,
            flexibleSpace: Container(
              constraints: const BoxConstraints.expand(),
              child: ListView.builder(
                  itemCount: posts.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return MyStories(
                      child1: posts[index],
                    );
                  }),
            ),
            backgroundColor: Colors.white,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            elevation: 0.2,
            title: const SizedBox(
              width: 100,
              height: 100,
              child: Text('Feed'),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return MyPosts(PUrl: widget.PUrl, Pid: index);
              },
              childCount: 7,
            ),
          ),
        ],
      ),
    );
  }
}
