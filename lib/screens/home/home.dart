import 'package:flutter/material.dart';
import 'package:flutter_firebase/pages/activity.dart';
import 'package:flutter_firebase/pages/discover.dart';
import 'package:flutter_firebase/pages/feed.dart';
import 'package:flutter_firebase/pages/profile.dart';
import 'package:flutter_firebase/pages/reels.dart';
import 'package:flutter_firebase/services/auth.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  late TabController _tabController;
  late AnimationController _animeController;
  late Animation<double> _myanimation;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _animeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _myanimation =
        CurvedAnimation(parent: _animeController, curve: Curves.bounceIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animeController.dispose();
    super.dispose();
  }

  final Authservice _auth = Authservice();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: _tabController, children: const [
        Feed(),
        Discover(),
        Reels(),
        Activity(),
        Profile(),
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.black54)],
          color: Colors.white,
          border: Border(
            top: BorderSide(
                style: BorderStyle.solid, width: 0, color: Colors.grey),
          ),
        ),
        child: TabBar(
            enableFeedback: true,
            controller: _tabController,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            indicator: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                  style: BorderStyle.solid,
                ),
                color: Colors.black,
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            indicatorPadding: const EdgeInsets.fromLTRB(32, 52, 32, 0),
            //indicator: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            tabs: const [
              Tab(
                icon: Icon(
                  size: 30,
                  Icons.home_outlined,
                  color: Colors.black,
                ),
                height: 55,
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                icon: Icon(
                  size: 30,
                  Icons.search,
                  color: Colors.black,
                ),
                height: 55,
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                icon: Icon(
                  size: 30,
                  Icons.slow_motion_video_outlined,
                  color: Colors.black,
                ),
                height: 55,
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                icon: Icon(
                  size: 30,
                  Icons.favorite_outline,
                  color: Colors.black,
                ),
                height: 55,
                iconMargin: EdgeInsets.only(bottom: 2),
              ),
              Tab(
                icon: Icon(
                  size: 30,
                  Icons.person_outline_outlined,
                  color: Colors.black,
                ),
                height: 55,
                iconMargin: EdgeInsets.only(bottom: 2),
              )
            ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //     enableFeedback: true,
      //     onPressed: () {
      //       if (_animeController.isCompleted) {
      //         _animeController.reverse();
      //       } else {
      //         _animeController.forward();
      //       }
      //     },
      //     child: AnimatedIcon(
      //       icon: AnimatedIcons.home_menu,
      //       progress: _myanimation,
      //     )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // extendBody: true,
    );
  }
}
