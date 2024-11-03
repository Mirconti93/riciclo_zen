import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:riciclo_zen/commons/navigation/NavigationItem.dart';
import '../../../city/presentation/CItyList.dart';
import '../../../items/presentation/ItemsList.dart';
import '../../../infos/presentation/InfosList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<NavigationItem> pages = <NavigationItem>[
    const NavigationItem(ItemsList(), "Materiali", Icon(Icons.home)),
    const NavigationItem(CityList(), "Paesi", Icon(Icons.place)),
    const NavigationItem(InfosList(), "Info", Icon(Icons.info))
  ];

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _selectedIndex = index;
      pages[index].screenWidget.resetState(context);
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
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          title: const Text("Riciclo Zen"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: pages[_selectedIndex].screenWidget
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: getBottomBarItems(),
          currentIndex: _selectedIndex,
          onTap: (int selectedIndex) { _onItemTapped(context, selectedIndex);},
        )
    );
  }
}