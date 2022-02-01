import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Story extends StatefulWidget {

  Story({required Key key, required this.user, required this.picture})
      : super(key: key);

  final String user;
  final String picture;

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(2),
            height: 75,
            width: 75,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color.fromARGB(250,252,175,69),
                      Color.fromARGB(250,225, 48, 108)
                    ]
                )
            ),
            alignment: Alignment.center,
            child: Container(
              height: 74,
              width: 74,
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.black,
                      width: 3
                  ),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("${widget.picture}"),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: 75,
            child: Text("${widget.user}",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,),
          )
        ],
      ),
    );
  }
}


