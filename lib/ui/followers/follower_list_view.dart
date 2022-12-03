import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';

class FollowerListView extends StatelessWidget {
  final _refreshController = RefreshController(initialRefresh: false);
  FollowerListView({Key? key}) : super(key: key);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _HeaderWidget(),
        Expanded(
          child: SmartRefresher(
            controller: _refreshController,
            header: const ClassicHeader(),
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child: ListView.builder(
              itemBuilder: ((context, index) {
                return const _FollowerListItemWidget();
              }),
            ),
          ),
        )
      ],
    );
  }
}

class _FollowerListItemWidget extends StatelessWidget {
  const _FollowerListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 12),
            child: CircleAvatar(
              radius: 29,
              backgroundImage: AssetImage(Images.js),
              backgroundColor: Colors.transparent,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Nickname',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.mainText,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '11111',
                  style: TextStyle(
                    fontSize: 17,
                    color: AppColors.text6,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.followers,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: AppColors.mainText,
            ),
          ),
          const SizedBox(height: 10),
          DecoratedBox(
            decoration: BoxDecoration(color: AppColors.textfieldBackground, borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: AppColors.text5, fontSize: 14),
                  suffixIcon: Icon(
                    Icons.filter_alt,
                    color: AppColors.text5,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
