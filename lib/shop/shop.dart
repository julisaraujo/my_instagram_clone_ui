import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram_clone/shop/post_shop.dart';

class Shop extends StatefulWidget {
  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  List profiles = [];

  Future<dynamic> MyExplore() async {
    var jsonString = await rootBundle.loadString('assets/shop');
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
      appBar: AppBar(
        title: Text(
          "Loja",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
        ),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FlutterIcons.bookmark_outline_mco,
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded)),
        ],
      ),
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            // Put here all widgets that are not slivers.
            child: Container(
                color: Colors.black,
                height: 90,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        height: 37,
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
                                  color: Color.fromARGB(250, 168, 168, 168)),
                              fillColor: Color.fromARGB(250, 38, 38, 38),
                              filled: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 32,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.only(left: 15),
                        children: [
                          MyButton(
                            key: Key("0"),
                            title: "Lojas",
                          ),
                          MyButton(
                            key: Key("1"),
                            title: "Videos",
                          ),
                          MyButton(
                            key: Key("2"),
                            title: "Seleções do editor",
                          ),
                          MyButton(
                            key: Key("3"),
                            title: "Coleções",
                          ),
                          MyButton(
                            key: Key("4"),
                            title: "Guias",
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 1.5,
              crossAxisSpacing: 1.5,
              childAspectRatio: 1,
              crossAxisCount: 2,
            ),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return PostShop(
                key: Key("0"),
                picture: profiles[index]["picture"],
                name: profiles[index]["name"],
                price: profiles[index]["price"],
              );
            }, childCount: profiles.length),
          )
        ],
      ),
    );
  }
}

class MyButton extends StatefulWidget {
  MyButton({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          elevation: 0,
          side: BorderSide(color: Color.fromARGB(250, 153, 153, 153), width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          "${widget.title}",
        ),
        onPressed: () {},
      ),
    );
  }
}
