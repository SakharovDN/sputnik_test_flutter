import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/home/home_view_model.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            _LoginWidget(),
            _CompanyWidget(),
            _EmailWidget(),
            _BioWidget(),
            Divider(thickness: 1.5),
          ],
        ),
      ),
    );
  }
}

class _BioWidget extends StatelessWidget {
  const _BioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bio = context.select((HomeViewModel value) => value.user?.bio);
    if (bio == null) return const SizedBox.shrink();
    return Text(
      'Bio - $bio',
      style: const TextStyle(fontSize: 17, color: AppColors.text4),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

class _EmailWidget extends StatelessWidget {
  const _EmailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = context.select((HomeViewModel value) => value.user?.email);
    if (email == null) return const SizedBox.shrink();
    return Text(
      'Email - $email',
      style: const TextStyle(fontSize: 17, color: AppColors.text4),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

class _CompanyWidget extends StatelessWidget {
  const _CompanyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final company = context.select((HomeViewModel value) => value.user?.company);
    if (company == null) return const SizedBox.shrink();
    return Text(
      'Company - $company',
      style: const TextStyle(fontSize: 17, color: AppColors.text4),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final login = context.select((HomeViewModel value) => value.user?.login);

    return login == null
        ? Shimmer.fromColors(
            baseColor: AppColors.text4,
            highlightColor: Colors.white,
            child: const Text(
              'Nickname',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),
            ),
          )
        : Text(
            login,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 34,
              color: AppColors.mainText,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          );
  }
}
