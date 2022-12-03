import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/domain/entity/following.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/home/home_view_model.dart';

class FollowingListWidget extends StatelessWidget {
  const FollowingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final followings = context.select((HomeViewModel value) => value.followings);
    if (followings == null) return const SizedBox.shrink();
    return Expanded(
      child: Column(
        children: [
          const _TitleWidget(),
          const SizedBox(height: 19),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return _FollowingListItemWidget(following: followings[index]);
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemCount: followings.length,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(thickness: 1.5),
          ),
        ],
      ),
    );
  }
}

class _FollowingListItemWidget extends StatelessWidget {
  const _FollowingListItemWidget({
    Key? key,
    required this.following,
  }) : super(key: key);

  final Following following;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(following.avatarUrl),
            backgroundColor: Colors.transparent,
          ),
          const SizedBox(height: 10),
          Text(
            following.login,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 17, color: AppColors.mainText),
          ),
          Text(
            '${following.id}',
            style: const TextStyle(fontSize: 10, color: AppColors.text5),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalizations.of(context)!.followingYou,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: AppColors.mainText,
            ),
          ),
          Text(
            AppLocalizations.of(context)!.viewAll,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              fontSize: 15,
              color: AppColors.mainText,
            ),
          )
        ],
      ),
    );
  }
}
