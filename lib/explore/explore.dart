import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_instagram_clone/explore/post_explore.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

  List profiles = [];

  Future<dynamic> MyExplore() async {
    var jsonString = await rootBundle.loadString('assets/stories');
    return this.profiles = jsonDecode(jsonString);
  }

  @override
  void initState() {
    super.initState();
    this.MyExplore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
           SliverAppBar(
            floating: true,
            elevation: 0,
            flexibleSpace: Container(
              color: Colors.black,
              height: 100,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10
                ),
                child: ClipRRect(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(12)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      hintText: "Pesquisar",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(250, 168, 168, 168)
                      ),
                      fillColor: Color.fromARGB(250, 38, 38, 38),
                      filled: true,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              childAspectRatio: 1,
              crossAxisCount: 3,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return PostExplore(
                    key: Key("0"),
                    user: profiles[index]["user"],
                    picture: profiles[index]["picture"],
                    post: profiles[index]["post"],
                    place: profiles[index]["place"],
                    subtitle: profiles[index]["subtitle"],
                  type: "Explorar",
                );
              },
                childCount: profiles.length
            ),
          )
        ],
      ),
    );
  }
}
