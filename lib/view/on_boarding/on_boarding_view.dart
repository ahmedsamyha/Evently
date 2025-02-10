import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utility/constants/images.dart';
import 'package:evently/view/aouth/screens/login_view.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../utility/constants/colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  Widget _buildImage(String assetName, double height) {
    return Image.asset(
      'assets/images/$assetName',
      height: height,
      fit: BoxFit.fill,
    );
  }

  @override
  Widget build(BuildContext context) {
    //var userProvider = Provider.of<UserProvider>(context);

    final pageDecoration = PageDecoration(
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(color: AppColors.kPrimaryColor),
      bodyTextStyle: Theme.of(context).textTheme.bodyMedium!,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
      bodyFlex: 2,
      imagePadding: EdgeInsets.zero,
      imageFlex: 4,
    );

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(),
      ),
      body: IntroductionScreen(
        onDone: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const LoginView()));
        },
        done: Text("finish".tr(),
            style: Theme.of(context).textTheme.headlineSmall),
        back: Text(
          "back".tr(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        next: Text(
          "next".tr(),
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        globalHeader: Align(
          alignment: Alignment.topCenter,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 32),
              child: Image.asset(
                'assets/images/horlogo2.png',
                color: AppColors.kPrimaryColor,
              ),
            ),
          ),
        ),
        showBackButton: true,
        showDoneButton: true,
        dotsFlex: 3,
        pages: [
          PageViewModel(
            title: "on_boarding1_title".tr(),
            body: "on_boarding1_body".tr(),
            image: SvgPicture.asset(TAssets.onboarding1),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "on_boarding2_title".tr(),
            body: "on_boarding2_body".tr(),
            image: SvgPicture.asset(TAssets.onboarding2),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: "on_boarding3_title".tr(),
            body: "on_boarding3_bdy".tr(),
            image: SvgPicture.asset(TAssets.onboarding3),
            decoration: pageDecoration,
          ),
        ],
        dotsDecorator: const DotsDecorator(
          activeColor: AppColors.kPrimaryColor,
          size: Size(7.0, 7.0),
          activeSize: Size(18.0, 7.0),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
