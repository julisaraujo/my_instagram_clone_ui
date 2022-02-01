import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram_clone/home/post.dart';

class PostExplore extends StatefulWidget {
  PostExplore(
      {required Key key,
        required this.user,
        required this.picture,
        required this.post,
        required this.place,
        required this.subtitle,
      required this.type})
      : super(key: key);

  final String user;
  final String picture;
  final String post;
  final String place;
  final String subtitle;
  final String type;

  @override
  _PostExploreState createState() => _PostExploreState();
}

class _PostExploreState extends State<PostExplore> {

  @override
  Widget build(BuildContext context) {

    OverlayEntry _myalertdialog = OverlayEntry(
        builder: (context) => MyAlertDialog(
            key: Key("0"),
            user: widget.user,
            picture: widget.picture,
            post: widget.post,
            place: widget.place,
        ));

    return GestureDetector(
      child: Image.asset(
        "${widget.post}",
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BodyExplorePost(
            key: Key("0"),
            user: widget.user,
            picture: widget.picture,
            post: widget.post,
            place: widget.place,
            subtitle: widget.subtitle,
            type: widget.type,
          )),
        );
      },
      onLongPress: () {
        Overlay.of(context)?.insert(_myalertdialog);
      },
      onLongPressEnd: (details){
        _myalertdialog.remove();
      },
    );
  }
}



class MyAlertDialog extends StatefulWidget {

  MyAlertDialog(
      {required Key key,
        required this.user,
        required this.picture,
        required this.post,
        required this.place,})
      : super(key: key);

  final String user;
  final String picture;
  final String post;
  final String place;

  @override
  _MyAlertDialogState createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(250, 38, 38, 38),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(
          horizontal: 7
      ),
      content: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage(
                                  "${widget.picture}"),
                              fit: BoxFit.cover)),
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
              ),
              Image.asset(
                "${widget.post}",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 7
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FlutterIcons.hearto_ant,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FlutterIcons.account_circle_outline_mco,
                      color: Colors.white,
                    ),
                    Icon(FlutterIcons.send_fea,
                      color: Colors.white,
                      size: 20,),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class BodyExplorePost extends StatefulWidget {
  BodyExplorePost(
      {required Key key,
        required this.user,
        required this.picture,
        required this.post,
        required this.place,
        required this.subtitle,
      required this.type})
      : super(key: key);

  final String user;
  final String picture;
  final String post;
  final String place;
  final String subtitle;
  final String type;

  @override
  _BodyExplorePostState createState() => _BodyExplorePostState();
}

class _BodyExplorePostState extends State<BodyExplorePost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("${widget.type}"),
      ),
      body: Post(
        key: Key("0"),
        user: widget.user,
        picture: widget.picture,
        post: widget.post,
        place: widget.place,
        subtitle: widget.subtitle,
      ),
    );
  }
}
