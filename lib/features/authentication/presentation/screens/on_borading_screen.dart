import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/domain/entites/boarding_model.dart';
import 'package:alzcare/features/authentication/presentation/screens/select_type_screen.dart';
import 'package:alzcare/features/authentication/presentation/widgets/custom_button.dart';
import 'package:alzcare/features/authentication/presentation/widgets/on_boarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

bool islast = false;

void submit(context) {
  PreferenceUtils.setBool(
    SharedKeys.onBoarding,
    true,
  ).then((value) {
    if (value) {
      navigateAndRemove(
        context,
        const SelectTypeUserScreen(),
      );
    }
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();
  List<BoardingModel> boarding = [
    const BoardingModel(
      image: ImagesPath.onBoarding1,
      body:
          ' مرحبًا بك في تطبيق جدو! نحن هنا لتقديم يد العون والدعم في حياتك اليومية. اكتشف معنا كيف يمكن لتطبيقنا تسهيل حياتك وجعلها أكثر متعة وراحة',
    ),
    const BoardingModel(
      image: ImagesPath.onBoarding2,
      body: '''
 استكشف ميزاتنا الرائعة التي تم تصميمها خصيصًا لمساعدتك في حياتك اليومية. ، نحن هنا لجعل يومك أسهل وأكثر أمانًا
      ''',
    ),
    const BoardingModel(
      image: ImagesPath.onBoarding3,
      body: '''
ابدأ رحلتك معنا الآن! انضم إلى مجتمعنا واستمتع بفوائد استخدام تطبيقنا. دعنا نكون شريكًا لك في رعاية صحتك وسلامتك، واستمتع بالحياة بكل سهولة وثقة
      ''',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: AppColors.myWhite,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark),
    );

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0.w ,vertical: 50.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 3,
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        islast = true;
                      });
                      PreferenceUtils.setBool(
                        SharedKeys.onBoarding,
                        true,
                      );
                      print('last');
                    } else {
                      print(' not last');
                      setState(() {
                        islast = false;
                      });
                    }
                  },
                  controller: boardController,
                  itemBuilder: (context, index) => onBoardingWidget(
                      index: index,
                      width: width,
                      boarding: boarding,
                      boardController: boardController),
                  itemCount: boarding.length,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 72.0.h,
                    ),
                    child: SmoothPageIndicator(
                      controller: boardController,
                      effect: ExpandingDotsEffect(
                        dotColor: AppColors.whiteLightBackground,
                        dotHeight: 10.h,
                        expansionFactor: 1.1,
                        dotWidth: 10.w,
                        spacing: 12.w,
                        activeDotColor: AppColors.primaryColor,
                      ),
                      count: boarding.length,
                    ),
                  ),
                  CustomButton(
                    text: "next",
                    onPressed: () {
                      if (islast) {
                        navigateAndRemove(
                          context,
                          const SelectTypeUserScreen(),
                        );
                        PreferenceUtils.setBool(
                          SharedKeys.onBoarding,
                          true,
                        );
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    text: "skip",
                    onPressed: () {
                      PreferenceUtils.setBool(
                        SharedKeys.onBoarding,
                        true,
                      );
                      navigateAndRemove(context, const SelectTypeUserScreen());
                    },
                    colorIsWhite: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
