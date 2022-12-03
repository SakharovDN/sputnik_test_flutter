import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/auth/sign_in_view_model.dart';
import 'package:sputnik_test_flutter/ui/routes/router.dart';
import 'package:sputnik_test_flutter/ui/widgets/app_button.dart';

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  void signIn(SignInViewModel viewModel, BuildContext context) {
    viewModel.onSearchPressed().then((success) {
      if (success) {
        Navigator.of(context).pushNamed(RouteNames.main);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SignInViewModel>();
    final canStartSigningIn = context.select((SignInViewModel value) => value.canStartSigningIn);
    final signingInInProgress = context.select((SignInViewModel value) => value.signingInInProgress);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 65),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.githubSocial,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: AppColors.mainText,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppLocalizations.of(context)!.enterNicknameOnGithub,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 17,
                      color: AppColors.text2,
                    ),
                  ),
                ),
                const SizedBox(height: 46),
                _InternalTextWidget(
                  labelText: AppLocalizations.of(context)!.nickname,
                  hintText: AppLocalizations.of(context)!.enterNickname,
                  onChanged: viewModel.onNicknameChanged,
                ),
                const Expanded(child: _ErrorWidget()),
                AppButton(
                    gradient: const LinearGradient(
                      colors: [AppColors.enabledButtonLeft, AppColors.enabledButtonRight],
                    ),
                    onPressed: canStartSigningIn ? () => signIn(viewModel, context) : null,
                    child: signingInInProgress
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            AppLocalizations.of(context)!.search,
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 17,
                            ),
                          )),
                const SizedBox(height: 25),
                RichText(
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: '${AppLocalizations.of(context)!.bySigningIn} ',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                      color: AppColors.text4,
                    ),
                    children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.termOfUse,
                          style: const TextStyle(
                            color: AppColors.mainText,
                            height: 1.5,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                      TextSpan(text: ' ${AppLocalizations.of(context)!.and} '),
                      TextSpan(
                          text: AppLocalizations.of(context)!.privacyPolicy,
                          style: const TextStyle(
                            color: AppColors.mainText,
                          ),
                          recognizer: TapGestureRecognizer()..onTap = () {}),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select((SignInViewModel value) => value.errorMessage);
    if (errorMessage == null) return const SizedBox();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.error.withOpacity(0.7),
          foregroundColor: Colors.white,
          radius: 50,
          child: const Icon(
            Icons.warning_rounded,
            size: 35,
          ),
        ),
        const SizedBox(height: 17),
        Text(
          errorMessage,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: AppColors.errorText,
          ),
        )
      ],
    );
  }
}

class _InternalTextWidget extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  const _InternalTextWidget({Key? key, this.labelText, this.hintText, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.textfieldBackground,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            if (labelText != null)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  labelText!,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: AppColors.text3,
                  ),
                ),
              ),
            TextField(
              decoration: InputDecoration(
                  alignLabelWithHint: true,
                  hintText: hintText,
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 36,
                    color: AppColors.text4,
                  ),
                  border: InputBorder.none,
                  isCollapsed: true),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 36,
                color: AppColors.mainText,
              ),
              onChanged: onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
