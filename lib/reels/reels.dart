import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Reels extends StatefulWidget {
  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/pictures/tspp.jpg",
                  ),
                  fit: BoxFit.fitWidth)),
        ),
        Positioned(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reels",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: Colors.white),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt_outlined, color: Colors.white))
            ],
          ),
        )),
        Positioned(
            bottom: 20,
            right: 10,
            child: Column(
              children: [
                Icon(
                  FlutterIcons.hearto_ant,
                  color: Colors.white,
                  size: 27,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "999 mil",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  FlutterIcons.comment_o_faw,
                  color: Colors.white,
                  size: 27,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "90 mil",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  FlutterIcons.send_fea,
                  color: Colors.white,
                  size: 27,
                ),
                SizedBox(
                  height: 20,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white,
                      width: 1.5),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/pictures/homemdeferro.jpg",
                          ),
                          fit: BoxFit.fitWidth)),
                )
              ],
            )),
        Positioned(
          bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/pictures/homemdeferro.jpg"),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      "homemdeferro",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Eu e o garoto :)",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,),
                )
              ],
            ),)
      ],
    );
  }
}
