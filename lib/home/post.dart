import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Post extends StatefulWidget {
  Post(
      {required Key key,
      required this.user,
      required this.picture,
      required this.post,
      required this.place,
      required this.subtitle})
      : super(key: key);

  final String user;
  final String picture;
  final String post;
  final String place;
  final String subtitle;

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1.5),
                    height: 31,
                    width: 31,
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
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage("${widget.picture}"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.user}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      widget.place != "" ? Text(
                        "${widget.place}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                        ),
                      ) : Container(),
                    ],
                  )
                ],
              ),
              Icon(
                Icons.more_vert,
                color: Colors.white,
              )
            ],
          ),
        )),
        SizedBox(
          height: 7,
        ),
        GestureDetector(
          child: Image.asset("${widget.post}"),
          onDoubleTap: () {
            setState(() {
              like = !like;
            });
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: like == false
                        ? Icon(
                            FlutterIcons.hearto_ant,
                            color: Colors.white,
                          )
                        : Icon(
                            FlutterIcons.heart_ant,
                            color: Colors.red,
                          ),
                    onTap: () {
                      setState(() {
                        like = !like;
                      });
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FlutterIcons.comment_o_faw,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(FlutterIcons.send_fea, color: Colors.white)
                ],
              ),
              Icon(
                FlutterIcons.bookmark_o_faw,
                color: Colors.white,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: RichText(
            text: TextSpan(
              text: "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "${widget.user} ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: "${widget.subtitle}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
