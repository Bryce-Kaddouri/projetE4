import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/team.dart';
import 'screens/calendar.dart';
import 'screens/settings.dart';
import 'screens/notification.dart';
import 'screens/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // init current index = 0
  int _currentIndex = 0;
  int _currentIndexAppbar = 0;

  // function to change index when user tap on the bottom navigation bar
  void _navigateTo(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  bool isButtonAppBar = false;

// list of title for the Appbar
  final List<String> _title = [
    'Home',
    'Team',
    'Calendar',
    'profile',
    'Notification',
    'Settings',
  ];

  // List of pages in the Appbar (same order as the title)

  List _listPage = [
    HomePage(),
    TeamPage(),
    CalendarPage(),
    ProfilePage(),
  ];

  // function to change index when user tap two button in the Appbar (notification and settings) and navigate to the page in the list actionAppbar

  // List des pages

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TodoApp",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_title[_currentIndex]),
          actions: [
            MaterialButton(
              // number of notification
              child: Icon(Icons.notifications),
              onPressed: () {
                setState(() {
                  _currentIndexAppbar = 4;
                  _navigateTo(_currentIndexAppbar);
                });
                _currentIndexAppbar = 4;
                print(_currentIndexAppbar);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                _currentIndexAppbar = 5;
                _navigateTo(_currentIndexAppbar);
                print(_currentIndexAppbar);

                // navigate to settings page
              },
            ),
          ],
        ),
        body: [
          HomePage(),
          TeamPage(),
          CalendarPage(),
          ProfilePage(),
          NotificationPage(),
          SettingsPage(),
        ][_currentIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            _navigateTo(index);
          },
          selectedIndex: _currentIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.group),
              icon: Icon(Icons.group_outlined),
              label: 'Team',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Calendar',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle_rounded),
              icon: Icon(Icons.account_circle_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
