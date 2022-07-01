import 'package:flutter/material.dart';

class Dms extends StatefulWidget {
  const Dms({super.key});

  @override
  State<Dms> createState() => _DmsState();
}

class _DmsState extends State<Dms> with SingleTickerProviderStateMixin {
  @override
  late TabController _tabcontroller2 = TabController(length: 3, vsync: this);
  @override
  void innitState() {
    super.initState();
    _tabcontroller2 = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabcontroller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 10,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back)),
          automaticallyImplyLeading: true,
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          title: const Text('Inbox'),
          bottom: TabBar(
              indicatorColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              controller: _tabcontroller2,
              indicatorWeight: 1,
              tabs: const [
                Tab(
                  text: 'chats',
                ),
                Tab(
                  text: 'rooms',
                ),
                Tab(
                  text: 'calls',
                ),
              ]),
        ),
        body: TabBarView(controller: _tabcontroller2, children: [
          Container(
            child: const Text('text'),
          ),
          Container(
            child: const Text('text'),
          ),
          Container(
            child: const Text('text'),
          ),
        ]),
      ),
    );
  }
}
