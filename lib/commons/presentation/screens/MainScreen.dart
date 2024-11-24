import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends StatelessWidget {

  final StatefulNavigationShell navigationShell;

  const MainScreen({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));


  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        title: const Text("Riciclo Zen"),
      ),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(label: "Materiali", icon: Icon(Icons.home)),
          NavigationDestination(label: "Città", icon: Icon(Icons.place)),
          NavigationDestination(label: "Info", icon: Icon(Icons.info)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}

/*class _HomeScreenState extends State<HomeScreen> {
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
}*/