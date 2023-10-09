import 'package:flutter/material.dart';
import 'package:fooder_app/pages/card1.dart';
import 'package:fooder_app/pages/card2.dart';
import 'package:fooder_app/pages/card3.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Theme.of(context) => returns the nearest Theme in the widget tree. If the widget has a defined Theme
  int currentIndex = 0;

  // 8
  static List<Widget> pages = <Widget>[
    ExplorePage(),
    const Card2(),
    const Card3(),
  ];
  // 9
  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Fooder Egypt ",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Theme.of(context).textSelectionTheme.selectionColor,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tobuy',
          ),
        ],
      ),
    );
  }
}
