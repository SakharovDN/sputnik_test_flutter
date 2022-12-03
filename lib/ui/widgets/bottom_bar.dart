import 'package:flutter/material.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';

class AppBottomBar extends StatefulWidget {
  final void Function(int)? onTap;
  const AppBottomBar({Key? key, this.onTap}) : super(key: key);

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _selectedIndex = 0;

  void _onItemTap(int value) {
    if (_selectedIndex == value) {
      return;
    }
    setState(() {
      _selectedIndex = value;
    });

    if (widget.onTap != null) {
      widget.onTap!(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: AppColors.mainText,
      unselectedItemColor: AppColors.text3,
      currentIndex: _selectedIndex,
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.groups_rounded), label: 'Followers'),
        BottomNavigationBarItem(icon: Icon(Icons.telegram), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: _onItemTap,
    );
  }
}
