import 'package:flutter/material.dart';

class MyStory extends StatefulWidget {
  MyStory(
      {required Key key,
        required this.post,
        required this.titlestory})
      : super(key: key);

  final String post;
  final String titlestory;

  @override
  _MyStoryState createState() => _MyStoryState();
}

class _MyStoryState extends State<MyStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: 10
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(0.5),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(250, 153, 153, 153)
            ),
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 3
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("${widget.post}"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text("${widget.titlestory}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 11
          ),)
        ],
      ),
    );
  }
}
