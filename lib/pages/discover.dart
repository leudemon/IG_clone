import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List<String> posts = [
    'assets/images/cat0.jpg',
    'assets/images/cat1.jpg',
    'assets/images/cat2.jpg',
    'assets/images/cat3.jpg',
    'assets/images/cat4.jpg',
    'assets/images/cat5.jpg',
    'assets/images/cat6.jpg',
    'assets/images/cat7.jpg',
    'assets/images/cat8.jpg',
    'assets/images/cat9.jpg',
    'assets/images/cat10.jpg',
    'assets/images/cat11.jpg',
    'assets/images/cat12.jpg',
    'assets/images/cat13.jpg',
    'assets/images/cat14.jpg',
    'assets/images/cat15.jpg',
    'assets/images/cat16.jpg',
    'assets/images/profile_2.jpg',
  ];
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Discover');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  margin: const EdgeInsets.all(.7),
                  child:
                      Image(fit: BoxFit.cover, image: AssetImage(posts[index])),
                );
              }, childCount: posts.length)),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: .2,
        title: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                border: Border.all(style: BorderStyle.none),
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10)),
            width: 350,
            height: 36,
            child: TextButton(
              onPressed: (() {
                showSearch(context: context, delegate: SearchStuff());
              }),
              child: Row(
                children: [
                  Icon(
                    customIcon.icon,
                    color: Colors.black26,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  const Text(
                    'Search',
                    style: TextStyle(color: Colors.black26),
                  ),
                ],
              ),
            )),
        foregroundColor: Colors.black,
        centerTitle: true,
        actions: const [],
      ),
    );
  }
}

class SearchStuff extends SearchDelegate<String> {
  final List<String> stuff = ['food', 'wine', 'pip', 'simp'];
  final List<String> suggest = ['Nothing', 'why tho', 'mvaho'];
  @override
  Widget buildLeading(BuildContext context) => IconButton(
      onPressed: () {
        close(context, query);
      },
      icon: const Icon(Icons.arrow_back));
  @override
  List<Widget> buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isNotEmpty) {
                query = '';
              } else {
                close(context, query);
              }
            },
            icon: const Icon(Icons.cancel))
      ];

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [const Icon(Icons.cabin), Text(query)],
      ),
    );
  }

  @override

  // TODO: implement searchFieldStyle
  TextStyle? get searchFieldStyle => super.searchFieldStyle;

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty
        ? suggest
        : stuff.where((thing) {
            final thingLower = thing.toLowerCase();
            final queryLower = query.toLowerCase();
            return thingLower.startsWith(queryLower);
          }).toList();
    return buildSuggestionsSuccess(suggestions);
  }

  Widget buildSuggestionsSuccess(List<String> suggest) {
    return ListView.builder(
      itemCount: suggest.length,
      itemBuilder: (context, index) {
        final suggestion = suggest[index];
        return ListTile(
          leading: const Icon(Icons.foggy),
          title: Text(suggestion),
        );
      },
    );
  }
}
