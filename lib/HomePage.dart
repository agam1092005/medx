// ignore_for_file: file_names, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:medx/Pages/Ambulance.dart';
import 'AdditionalFiles/constants.dart';
import 'Pages/Appointments.dart';
import 'Pages/Home.dart';
import 'Pages/Profile.dart';
import 'Pages/History.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const Home(),
    const History(),
    const Ambulance(),
    const Appointments(),
    const Profile(),
  ];

  int _selectedIndex = 0;
  void _onItemTap(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        elevation: 25,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: _onItemTap,
              currentIndex: _selectedIndex,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: 0,
              backgroundColor: Colors.white,
              iconSize: 30,
              selectedItemColor: accentColor,
              unselectedItemColor: Colors.black38,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.withOpacity(0),
                  icon: const Icon(Icons.home),
                  // ignore: deprecated_member_use
                  label: ('Home'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.withOpacity(0),
                  icon: const Icon(Icons.file_copy_sharp),
                  // ignore: deprecated_member_use
                  label: ('History'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.withOpacity(0),
                  icon: CircleAvatar(
                    backgroundColor: accentColor.withOpacity(0.15),
                    child: const Icon(
                      Icons.emergency,
                      color: Colors.red,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  label: ('SOS'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.withOpacity(0),
                  icon: const Icon(Icons.calendar_month_outlined),
                  // ignore: deprecated_member_use
                  label: ('Appointment'),
                ),
                BottomNavigationBarItem(
                  backgroundColor: Colors.grey.withOpacity(0),
                  icon: const Icon(Icons.person_2),
                  // ignore: deprecated_member_use
                  label: ('Profile'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
