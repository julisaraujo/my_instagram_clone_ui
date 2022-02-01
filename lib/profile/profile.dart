import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram_clone/explore/post_explore.dart';

import 'mystory.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List posts = [];

  Future<dynamic> MyPosts() async {
    var jsonString = await rootBundle.loadString('assets/profile');
    return this.posts = jsonDecode(jsonString);
  }

  @override
  void initState() {
    super.initState();
    this.MyPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "viuvanegra",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(FlutterIcons.plus_square_o_faw)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        ],
      ),
      body: Material(
        color: Colors.black,
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, _) {
              return [
                SliverPadding(
                  padding: const EdgeInsets.all(15),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Color.fromARGB(250, 252, 175, 69),
                                      Color.fromARGB(250, 225, 48, 108)
                                    ])),
                            alignment: Alignment.center,
                            child: Container(
                              height: 89,
                              width: 89,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/pictures/viuvanegra.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "12",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text("Publicações",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "1M",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text("Seguidores",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17),
                                    ),
                                    Text("Seguindo",
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Natasha Romanoff",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      Text(
                        "Também morri para matar o Thanos, mas só lembram do Stark\n"
                        "Veja meu filme na Disney+:",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      Text(
                        "https://www.disneyplus.com/pt-br/movies/black-widow/",
                        style: TextStyle(
                            color: Color.fromARGB(250, 227, 241, 252),
                            fontSize: 14),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            elevation: 0,
                            side: BorderSide(
                                color: Color.fromARGB(250, 153, 153, 153), width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.all(0)),
                        child: Text("Editar perfil"),
                        onPressed: () {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: posts.length,
                          itemBuilder: (context, index){
                            return MyStory(
                              key: Key("0"),
                              titlestory: posts[index]["titlestory"],
                              post: posts[index]["post"],
                            );
                          },
                        ),
                      )
                    ]),
                  ),
                ),
              ];
            },
            body: Column(
              children: <Widget>[
                TabBar(
                  unselectedLabelColor: Color.fromARGB(250, 153, 153, 153),
                  labelColor: Colors.white,
                  indicatorWeight: 1,
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(
                      child: Icon(
                        Icons.grid_on_sharp,
                        size: 23,
                      ),
                    ),
                    Tab(
                      child: Icon(
                        Icons.person_pin_outlined,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 1.5,
                            crossAxisSpacing: 1.5,
                            childAspectRatio: 1,
                            crossAxisCount: 3,
                          ),
                          itemCount: posts.length,
                          itemBuilder: (context, index){
                            return PostExplore(
                                key: Key("0"),
                                user: posts[index]["user"],
                                picture: posts[index]["picture"],
                                post: posts[index]["post"],
                                place: "",
                                subtitle: posts[index]["subtitle"],
                              type: "Publicações",
                            );
                          }),
                      GridView.builder(
                          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 1.5,
                            crossAxisSpacing: 1.5,
                            childAspectRatio: 1,
                            crossAxisCount: 3,
                          ),
                          itemCount: 1,
                          itemBuilder: (context, index){
                            return PostExplore(
                                key: Key("0"),
                                user: posts[index+5]["user"],
                                picture: posts[index+5]["picture"],
                                post: posts[index+5]["post"],
                                place: "",
                                subtitle: posts[index+5]["subtitle"],
                              type: "Marcado",
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
