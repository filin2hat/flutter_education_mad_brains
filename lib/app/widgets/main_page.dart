import 'package:flutter/material.dart';
import 'package:flutter_education_mad_brains/features/home/pages/home_page.dart';

import '../../features/home/pages/catalog_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  static const List<_Tab> _tabs = <_Tab>[
    _Tab(
      icon: Icon(Icons.local_movies_outlined),
      label: "Feed",
      page: HomePage(),
    ),
    _Tab(
      icon: Icon(Icons.movie_filter),
      label: "Catalog",
      page: CatalogPage(),
    ),
  ];

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
//TODO : implement menu function
            },
          ),
          title: const Text('Films App', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            IconButton(
                icon: const Icon(Icons.sort, color: Colors.white),
                onPressed: () {
//TODO : implement sort function
                }),
            IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {
//TODO : implement settings function
                })
          ],
        ),
        body: MainPage._tabs.elementAt(_selectedIndex).page,
        bottomNavigationBar: BottomNavigationBar(
          items: List.generate(
              MainPage._tabs.length,
              (index) => BottomNavigationBarItem(
                    icon: MainPage._tabs.elementAt(index).icon,
                    label: MainPage._tabs.elementAt(index).label,
                  )),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}

class _Tab extends StatelessWidget {
  const _Tab(
      {super.key, required this.icon, required this.label, required this.page});

  final Icon icon;
  final String label;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
