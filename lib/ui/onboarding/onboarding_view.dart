import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sputnik_test_flutter/resources/resources.dart';
import 'package:sputnik_test_flutter/ui/widgets/app_button.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  OnboardingViewState createState() => OnboardingViewState();
}

class OnboardingViewState extends State<OnboardingView> with TickerProviderStateMixin {
  final _pageController = PageController();
  int _currentPage = 0;
  late TabController _tabController;
  late List<_OnboardingPageViewItem> _pages;

  void _animateToNextPage() {
    _currentPage += 1;
    if (_currentPage < _pages.length) {
      _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 300), curve: Curves.ease);
      _tabController.animateTo(_currentPage);
    } else {
      // TODO add reroute
      return;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    _pages = [
      _OnboardingPageViewItem(
        svgAssetName: SvgAssets.spocksGreetingOnboarding,
        description: AppLocalizations.of(context)!.sputnikStartupSupportFund,
      ),
      _OnboardingPageViewItem(
        svgAssetName: SvgAssets.taskListOnboarding,
        description: AppLocalizations.of(context)!.entrepreneurshipHelp,
      ),
      _OnboardingPageViewItem(
        svgAssetName: SvgAssets.gearsOnboarding,
        description: AppLocalizations.of(context)!.madeByNerds,
      ),
    ];
    _tabController = TabController(length: _pages.length, vsync: this);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: Alignment.centerLeft, child: SvgPicture.asset(SvgAssets.sputnikLogo)),
                Expanded(
                  child: PageView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: _pages,
                  ),
                ),
                const SizedBox(height: 22),
                TabPageSelector(
                  controller: _tabController,
                  color: AppColors.disabledPageIndicator,
                  selectedColor: Colors.white,
                  indicatorSize: 30,
                ),
                const SizedBox(height: 22),
                AppButton(
                  onPressed: _animateToNextPage,
                  gradient: const LinearGradient(colors: [AppColors.enabledButtonLeft, AppColors.enabledButtonRight]),
                  child: Text(
                    AppLocalizations.of(context)!.next,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                    ),
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

class _OnboardingPageViewItem extends StatelessWidget {
  final String svgAssetName;
  final String description;
  const _OnboardingPageViewItem({Key? key, required this.svgAssetName, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: SvgPicture.asset(
          svgAssetName,
          fit: BoxFit.contain,
        )),
        Text(
          description,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 22,
            color: AppColors.onboardingText,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
