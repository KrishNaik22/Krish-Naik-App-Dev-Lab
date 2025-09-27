import 'package:flutter/material.dart';

void main() {
  runApp(const Exp8App());
}

class Exp8App extends StatelessWidget {
  const Exp8App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exp 8',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white, // Light background
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> _pages = [
    'Home Page',
    'Search Page',
    'Profile Page',
    'Settings Page',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Vertical Navigation
          NavigationRail(
            backgroundColor: Colors.grey[850], // Darker sidebar
            selectedIndex: _currentIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _currentIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            selectedIconTheme: const IconThemeData(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.grey),
            selectedLabelTextStyle: const TextStyle(color: Colors.white),
            unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search_outlined),
                selectedIcon: Icon(Icons.search),
                label: Text('Search'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.person_outline),
                selectedIcon: Icon(Icons.person),
                label: Text('Profile'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings_outlined),
                selectedIcon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),

          // Page Content
          Expanded(
            child: Center(
              child: Text(
                _pages[_currentIndex],
                style: const TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
