import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/domain/entity/repo.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/home/home_view_model.dart';

class RepoListWidget extends StatelessWidget {
  const RepoListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repos = context.select((HomeViewModel value) => value.repos);
    if (repos == null) return const SizedBox.shrink();
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
                return _RepoListItemWidget(repo: repos[index]);
              }),
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemCount: repos.length,
            ),
          ),
        ],
      ),
    );
  }
}

class _RepoListItemWidget extends StatelessWidget {
  const _RepoListItemWidget({
    Key? key,
    required this.repo,
  }) : super(key: key);

  final Repo repo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        SizedBox(
          height: 150,
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      Images.js,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      repo.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(fontSize: 17, color: AppColors.mainText),
                    ),
                    Text(
                      '${repo.id}',
                      style: const TextStyle(fontSize: 10, color: AppColors.text5),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColors.star,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${repo.stargazersCount}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppColors.star,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.mainText,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.fork_left,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '${repo.forksCount}',
                            style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        const Spacer()
      ],
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
            AppLocalizations.of(context)!.repositories,
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
