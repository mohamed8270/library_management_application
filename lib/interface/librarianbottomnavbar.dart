// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:library_management_application/constants/theme.dart';
import 'package:library_management_application/librarian/pages/librarianaccountspage.dart';
import 'package:library_management_application/librarian/pages/librarianhomepage.dart';
import 'package:library_management_application/librarian/pages/librarianpostpage.dart';

class LibrarianBottomNavBar extends StatefulWidget {
  const LibrarianBottomNavBar({super.key});

  @override
  State<LibrarianBottomNavBar> createState() => _LibrarianBottomNavBarState();
}

class _LibrarianBottomNavBarState extends State<LibrarianBottomNavBar> {
  int currentIndex = 0;

  final screens = [
    const LibrarianHomePage(),
    const LibrarianPostPage(),
    const LibraraianAccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: sBlack.withOpacity(0.3),
              width: 0.15,
            ),
          ),
        ),
        child: BottomNavigationBar(
          backgroundColor: sWhite,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 18,
          currentIndex: currentIndex,
          selectedLabelStyle: const TextStyle(
            color: sOrange,
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          unselectedItemColor: sBlack.withOpacity(0.3),
          selectedItemColor: sOrange,
          unselectedLabelStyle: TextStyle(
            color: sBlack.withOpacity(0.3),
            fontSize: 12,
            fontWeight: FontWeight.w600,
            height: 1.5,
          ),
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: sBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/524643/home-angle-2.svg',
                color: sOrange,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/529046/library.svg',
                color: sBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/529046/library.svg',
                color: sOrange,
              ),
              label: 'Librarian',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: sBlack.withOpacity(0.4),
              ),
              activeIcon: SvgPicture.network(
                'https://www.svgrepo.com/show/498298/profile.svg',
                color: sOrange,
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
