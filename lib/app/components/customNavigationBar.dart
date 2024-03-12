import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color background = Color(0xFFF5F5F5);
    const Color primary = Color(0xFF5566FF);
    return NavigationBar(
      backgroundColor: background,
      destinations: [
        ...List.generate(4, (index) {
          final isSelected = index == currentIndex;
          return NavigationDestination(
            icon: Icon(
              _icons[index],
              color: isSelected ? Colors.white : Colors.black, // Dynamic color
            ),
            label: _labels[index],
          );
        }),
      ],
      indicatorColor: primary,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      height: 60.0,
      animationDuration: Duration(milliseconds: 500),
      surfaceTintColor: Colors.white,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    );
  }
}

const _icons = [
  Icons.house_rounded,
  Icons.search,
  Icons.bookmarks,
  Icons.person_rounded,
];

const _labels = [
  'Home',
  'Search',
  'Koleksi',
  'Profile',
];
