import 'package:flutter/material.dart';
import 'package:sputnik_test_flutter/ui/home/widgets/following_list_widget.dart';
import 'package:sputnik_test_flutter/ui/home/widgets/repo_list_widget.dart';
import 'package:sputnik_test_flutter/ui/home/widgets/user_info_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: const [
          UserInfoWidget(),
          FollowingListWidget(),
          RepoListWidget(),
        ],
      ),
    );
  }
}





//  AppButton(
//               height: 42,
//               expandByWidth: false,
//               gradient: const LinearGradient(colors: [AppColors.enabledButtonLeft, AppColors.enabledButtonRight]),
//               child: Row(
//                 children: const [
//                   Icon(Icons.add_rounded, size: 20),
//                   SizedBox(width: 10),
//                   Text(
//                     'Follow on github',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
//                   ),
//                 ],
//               ),
//               onPressed: () {},
//             ),
