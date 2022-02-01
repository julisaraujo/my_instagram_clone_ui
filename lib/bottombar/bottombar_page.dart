import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:my_instagram_clone/explore/explore.dart';
import 'package:my_instagram_clone/home/home.dart';
import 'package:my_instagram_clone/profile/profile.dart';
import 'package:my_instagram_clone/reels/reels.dart';
import 'package:my_instagram_clone/shop/shop.dart';

class BottombarPage extends StatefulWidget {
  @override
  _BottombarPageState createState() => _BottombarPageState();
}

class _BottombarPageState extends State<BottombarPage> {

  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex,
            backgroundColor: Colors.black,
            fixedColor: Colors.white,
            unselectedItemColor: Colors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                  label: ""
              ),
              BottomNavigationBarItem(
                icon: Icon(FlutterIcons.search1_ant),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icons/reels.png")
                      )
                    ),
                  ),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(FlutterIcons.shopping_mco),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage("assets/pictures/viuvanegra.jpeg"),
                        )
                    ),
                  ),
                  label: ""
              ),
            ],
          ),
          body: IndexedStack(
            children: <Widget>[
              MyHome(),
              Explore(),
              Reels(),
              Shop(),
              Profile()
            ],
            index: _currentIndex,
          ),
        ),
      ),
    );
  }
}
