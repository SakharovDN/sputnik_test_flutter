import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/ui/chat/chat_view.dart';
import 'package:sputnik_test_flutter/ui/followers/follower_list_view.dart';
import 'package:sputnik_test_flutter/ui/home/home_view.dart';
import 'package:sputnik_test_flutter/ui/home/home_view_model.dart';
import 'package:sputnik_test_flutter/ui/profile/profile_view.dart';
import 'package:sputnik_test_flutter/ui/profile/profile_view_model.dart';
import 'package:sputnik_test_flutter/ui/widgets/bottom_bar.dart';

class MainView extends StatelessWidget {
  final _pageController = PageController();
  MainView({Key? key}) : super(key: key);

  void _onBottomBarItemTap(int value) {
    _pageController.animateToPage(value, duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            ChangeNotifierProvider(create: (_) => HomeViewModel(), child: const HomeView()),
            FollowerListView(),
            const ChatView(),
            ChangeNotifierProvider(create: (_) => ProfileViewModel(), child: const ProfileView()),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomBar(
        onTap: _onBottomBarItemTap,
      ),
    );
  }
}
