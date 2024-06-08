import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riciclo_zen/commons/NavigationItem.dart';
import 'package:riciclo_zen/widgets/CItyList.dart';
import 'package:riciclo_zen/widgets/ItemsList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<NavigationItem> pages = <NavigationItem>[
    const NavigationItem(ItemsList(), "Materiali", Icon(Icons.home)),
    const NavigationItem(CityList(), "Paesi", Icon(Icons.place))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<BottomNavigationBarItem> getBottomBarItems() {
    List<BottomNavigationBarItem> widgets = [];
    pages.forEach((element) {
      widgets.add(BottomNavigationBarItem(icon: element.icon, label: element.label));
    });
    return widgets;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2F3136),
          title: const Text("Riciclo Zen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: pages[_selectedIndex].widget
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: getBottomBarItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF00E791),
          onTap: (int selectedIndex) { _onItemTapped(selectedIndex);},
        )
    );
  }
}