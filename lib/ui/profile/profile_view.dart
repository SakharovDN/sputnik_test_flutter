import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/profile/profile_view_model.dart';
import 'package:sputnik_test_flutter/ui/widgets/app_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const _SettingsWidget(),
          const SizedBox(height: 10),
          const _UserInfoWidget(),
          const SizedBox(height: 10),
          const Expanded(child: _ProfileBodyWidget()),
          AppButton(
            backgroundColor: AppColors.mainText,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Text(
                'View all',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_rounded,
                size: 17,
              )
            ]),
            onPressed: () {},
          )
        ],
      ),
    );
  }
}

class _ProfileBodyWidget extends StatelessWidget {
  const _ProfileBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ProfileBodyButton(
          image: Images.lover,
          name: 'My following',
        ),
        SizedBox(height: 18),
        _ProfileBodyButton(
          image: Images.lover,
          name: 'My followers',
        ),
        SizedBox(height: 18),
        _ProfileBodyButton(
          image: Images.medal,
          name: 'My badges',
        ),
        SizedBox(height: 18),
        _ProfileBodyButton(
          image: Images.dollar,
          name: 'My organizations',
        ),
      ],
    );
  }
}

class _ProfileBodyButton extends StatelessWidget {
  final String image;
  final String name;
  const _ProfileBodyButton({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppButton(
      backgroundColor: Colors.white,
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(width: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 15, color: AppColors.mainText),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.select((ProfileViewModel value) => value.user);
    if (user == null) return const SizedBox.shrink();
    return Column(
      children: [
        CircleAvatar(
          radius: 82.5,
          backgroundImage: NetworkImage(user.avatarUrl),
        ),
        Text(
          user.login,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34,
            color: AppColors.mainText,
          ),
        ),
        Text(
          '${user.id}',
          style: const TextStyle(
            fontSize: 17,
            color: AppColors.text5,
          ),
        ),
      ],
    );
  }
}

class _SettingsWidget extends StatelessWidget {
  const _SettingsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.textfieldBackground,
          ),
          width: 45,
          height: 45,
          child: const Icon(
            Icons.settings_rounded,
            size: 20,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.textfieldBackground,
          ),
          width: 45,
          height: 45,
          child: const Icon(
            Icons.notifications_rounded,
            size: 20,
          ),
        )
      ],
    );
  }
}
