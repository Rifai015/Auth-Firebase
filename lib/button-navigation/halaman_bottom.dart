import 'package:flutter/material.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class HalamanBottom extends StatefulWidget {
  const HalamanBottom({super.key});

  @override
  State<HalamanBottom> createState() => _HalamanBottomState();
}

class _HalamanBottomState extends State<HalamanBottom> {
  final listBottom = [
    const HomeScreen(),
    const SearchScreen(),
    const AccountScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return SafeArea(
      child: Scaffold(
        body: listBottom[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 8,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(
              () {
                currentIndex = value;
              },
            );
          },
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "Account",
            ),
          ],
        ),
      ),
    );
  }
}
