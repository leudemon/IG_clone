import 'package:flutter/material.dart';
import 'package:flutter_firebase/my_flutter_app_icons.dart';

class MyPosts extends StatefulWidget {
  final int Pid;
  final String PUrl;
  const MyPosts({required this.Pid, required this.PUrl});

  @override
  State<MyPosts> createState() => _MyPostsState();
}

class _MyPostsState extends State<MyPosts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 500,
            color: Colors.transparent,
            //padding: const EdgeInsets.symmetric(vertical: 8),

            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8, 0, 0, 5),

                    //TOP ROW ON POST VIEW(COLUMN WIDGET #1)
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: const Image(
                                image:
                                    AssetImage('assets/images/profile_2.jpg')),
                          ),
                        ),
                        Container(
                            padding: const EdgeInsets.fromLTRB(8, 12, 0, 8),
                            child: const Text('User account')),
                        const Spacer(),
                        Container(
                          child: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert_rounded)),
                        )
                      ],
                    ),
                  ),
                ),
                //THE POST ITSELF(COLUMN WIDGET #2)
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    width: 350,
                    height: 300,
                    child:
                        Image(fit: BoxFit.fill, image: AssetImage(widget.PUrl)),
                  ),
                ),
                //BELOW THE POST(COLUMN WIDGET #3)
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        onPressed: (() => print('liking')),
                                        icon: const Icon(
                                          Icons.favorite_outline,
                                          size: 25,
                                          shadows: [
                                            BoxShadow(color: Colors.black)
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        onPressed: (() => print('commenting')),
                                        icon: const Icon(
                                            MyFlutterApp.comment_alt2)),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                        onPressed: (() => print('sharing')),
                                        icon: const Icon(Icons.send)),
                                  ),
                                  Expanded(
                                      flex: 12,
                                      child: Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons
                                                .bookmark_border_outlined)),
                                      ))
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                            child: const ListTile(
                              title: Text('Likes'),
                              subtitle: Text('''Comments
                              hahaha
                              jajjaj
                              '''),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: const SizedBox(
            height: 50,
          )),
        ],
      ),
    );
  }
}
