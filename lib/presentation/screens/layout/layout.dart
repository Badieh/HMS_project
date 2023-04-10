import 'package:flutter/material.dart';
import 'package:hospital/presentation/screens/layout/home.dart';
import 'package:hospital/presentation/screens/layout/profile.dart';

class Home_Layout_Screen extends StatelessWidget {
  const Home_Layout_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.shifting,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              color:  Colors.black,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              color:Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color:  Colors.black,
            ),
            label: 'Appointment',
            activeIcon: Icon(
              Icons.calendar_month,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.newspaper,
              color:  Colors.black,
            ),
            label: 'History',
            activeIcon: Icon(
              Icons.newspaper,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.archive_outlined,
              color:  Colors.black,
            ),
            label: 'Archive',
            activeIcon: Icon(
              Icons.archive_outlined,
              color: Colors.blue,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color:  Colors.black,
            ),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              color: Colors.blue,
            ),
          ),
        ],
        selectedLabelStyle: TextStyle(fontSize: 10),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 10),
        showUnselectedLabels: true,
        currentIndex: 0,
        onTap: (index) {

        },
      ),
// appBar: AppBar(
//   backgroundColor: Colors.transparent,
//   elevation: 0,
//
// ),
      body: Home_Screen(),


    );
  }
}
