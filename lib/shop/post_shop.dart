import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PostShop extends StatefulWidget {
  PostShop({
    required Key key,
    required this.name,
    required this.picture,
    required this.price,
  }) : super(key: key);

  final String name;
  final String picture;
  final String price;

  @override
  _PostShopState createState() => _PostShopState();
}

class _PostShopState extends State<PostShop> {
  @override
  Widget build(BuildContext context) {
    OverlayEntry _myalertdialog = OverlayEntry(
        builder: (context) => MyAlertDialogShop(
              key: Key("0"),
              name: widget.name,
              picture: widget.picture,
              price: widget.price,
            ));

    return GestureDetector(
      child: Image.asset(
        "${widget.picture}",
        fit: BoxFit.cover,
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BodyShop(
                    key: Key("0"),
                    picture: widget.picture,
                    name: widget.name,
                    price: widget.price,
                  )),
        );
      },
      onLongPress: () {
        Overlay.of(context)?.insert(_myalertdialog);
      },
      onLongPressEnd: (details) {
        _myalertdialog.remove();
      },
    );
  }
}

class MyAlertDialogShop extends StatefulWidget {
  MyAlertDialogShop({
    required Key key,
    required this.name,
    required this.picture,
    required this.price,
  }) : super(key: key);

  final String name;
  final String picture;
  final String price;

  @override
  _MyAlertDialogShopState createState() => _MyAlertDialogShopState();
}

class _MyAlertDialogShopState extends State<MyAlertDialogShop> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromARGB(250, 38, 38, 38),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 7),
      content: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "${widget.picture}",
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/pictures/shop/shop_disney.png"),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "vendasdisney",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${widget.name}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "R\$ ${widget.price}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      FlutterIcons.send_fea,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FlutterIcons.bookmark_outline_mco,
                      color: Colors.white,
                      size: 20,
                    ),
                    Icon(
                      FlutterIcons.shopping_mco,
                      color: Colors.white,
                      size: 20,
                    ),
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

class BodyShop extends StatefulWidget {
  BodyShop({
    required Key key,
    required this.name,
    required this.picture,
    required this.price,
  }) : super(key: key);

  final String name;
  final String picture;
  final String price;

  @override
  _BodyShopState createState() => _BodyShopState();
}

class _BodyShopState extends State<BodyShop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/pictures/shop/shop_disney.png"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "vendasdisney",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ))
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "${widget.picture}",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15,
            horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.name}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "R\$ ${widget.price}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      FlutterIcons.send_fea,
                      color: Colors.white,
                      size: 25,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      FlutterIcons.bookmark_outline_mco,
                      color: Colors.white,
                      size: 25,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(250, 1, 149, 247),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  fixedSize: Size(MediaQuery.of(context).size.width , 40)),
              child: Text(
                "Ver no site",
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
