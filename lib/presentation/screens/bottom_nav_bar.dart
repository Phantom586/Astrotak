import 'package:astrotak/presentation/screens/ask_ques.dart';
import 'package:astrotak/presentation/screens/reports.dart';
import 'package:astrotak/presentation/screens/chat.dart';
import 'package:astrotak/presentation/screens/home.dart';
import 'package:astrotak/presentation/screens/talk.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final List<Widget> _screenList = const [
    Home(),
    Talk(),
    AskQuestions(),
    Reports(),
    Chat()
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade400,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/home.png',
                width: size.width * 0.07,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/talk.png',
                width: size.width * 0.07,
              ),
              backgroundColor: Colors.yellow,
              label: 'Talk'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ask.png',
                width: size.width * 0.07,
              ),
              backgroundColor: Colors.yellow,
              label: 'Ask Question'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/reports.png',
                width: size.width * 0.07,
              ),
              backgroundColor: Colors.yellow,
              label: 'Reports'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/chat.png',
                width: size.width * 0.07,
              ),
              label: 'Chat'),
        ],
      ),
      body: _screenList[_currentIndex],
    );
  }
}
