import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram_clone/home/post.dart';
import 'package:my_instagram_clone/home/story.dart';

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {


  List profiles = [];

  Future<dynamic> MyStories() async {
    var jsonString = await rootBundle.loadString('assets/stories');
    return this.profiles = jsonDecode(jsonString);
  }


  @override
  void initState() {
    super.initState();
    this.MyStories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Instagram",
          style: TextStyle(
              fontFamily: 'Billabong',
              fontSize: 32
          ),),
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(FlutterIcons.plus_square_o_faw)),
          IconButton(
              onPressed: (){},
              icon: Icon(FlutterIcons.heart_fea)),
          IconButton(
              onPressed: (){},
              icon: Icon(FlutterIcons.send_fea))
        ],),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Colors.black,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: profiles.length,
                    itemBuilder: (context, index){
                      return Story(
                        key: Key("0"),
                        user: profiles[index]["user"],
                        picture: profiles[index]["picture"],
                      );
                    })
            ),
          ),
          // Replace your ListView.builder with this:
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return Post(
                      key: Key("0"),
                      user: profiles[index]["user"],
                      picture: profiles[index]["picture"],
                      post: profiles[index]["post"],
                      place: profiles[index]["place"],
                      subtitle: profiles[index]["subtitle"]
                  );
                },
                childCount: profiles.length
            ),
          ),
        ],
      )
    );
  }
}
