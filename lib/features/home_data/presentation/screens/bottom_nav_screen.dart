import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
  class BottomNavScreen extends StatefulWidget {
  int? currentIndex;
  BottomNavScreen({Key? key, required this.currentIndex}) : super(key: key);
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}
class _BottomNavScreenState extends State<BottomNavScreen> {
  DateTime? lastPressedTime;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          if(widget.currentIndex != null) {
            cubit.currentIndex = widget.currentIndex!;
            widget.currentIndex = null;
          }

          return WillPopScope(
            onWillPop: () async {
              final now = DateTime.now();
              bool willPop;
              if (lastPressedTime == null ||
                  now.difference(lastPressedTime!) > const Duration(seconds: 2)) {
                lastPressedTime = now;
                Fluttertoast.showToast(
                  msg: 'Press back again to exit',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                );
                willPop = false;
              } else {
                willPop = true;
              }
              return willPop;
            },
            child: Scaffold(
              extendBodyBehindAppBar: true,
              backgroundColor: AppColors.myWhite,
              body: cubit.screen[cubit.currentIndex],
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: AppColors.myWhite,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(16.r),
                    topStart: Radius.circular(16.r),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(152, 173, 175, 0.25),
                      offset: Offset(0, 0),
                      blurRadius: 4,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                height: 70.h,
                child: ClipRRect(
                  clipBehavior: Clip.none,
                  borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(16.r),
                    topStart: Radius.circular(16.r),
                  ),
                  child: BottomAppBar(
                    color: AppColors.myWhite,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BottomBarItem(
                          onPress: () {
                            cubit.changeBottom(0);
                          },
                          icon: ImagesPath.homeNav,
                          isSelected: 0 == cubit.currentIndex,
                        ),
                        BottomBarItem(
                          onPress: () {
                            cubit.changeBottom(1);
                          },
                          icon: ImagesPath.communityNav,
                          isSelected: 1 == cubit.currentIndex,
                        ),
                        BottomBarItem(
                          onPress: () {
                            cubit.changeBottom(2);
                          },
                          icon: ImagesPath.notificationNav,
                          isSelected: 2 == cubit.currentIndex,
                        ),
                        BottomBarItem(
                          onPress: () {
                            cubit.changeBottom(3);
                          },
                          icon: ImagesPath.profileNav,
                          isSelected: 3 == cubit.currentIndex,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BottomBarItem extends StatelessWidget {
  final String icon;
  bool isSelected = true;
  final VoidCallback onPress;
  BottomBarItem({
    Key? key,
    required this.icon,
    required this.isSelected,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: isSelected ? Offset(0, -30.h) : const Offset(0, 0),
      child: Container(
        padding: EdgeInsetsDirectional.only(
          top: 5.h,
          start: 5.h,
          end: 5.h,
          bottom: 5.h,

        ),
        decoration: isSelected?BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
          boxShadow:
          const [
            BoxShadow(
              color: Color(0xFFE1E1E1),
              offset: Offset(0, 4),
              blurRadius: 4,
              spreadRadius: 0,
            ),
          ],
        ):null,
        width: 56.w,
        height: 56.h,
        child: InkWell(
          radius: 0,
          hoverColor: AppColors.myWhite,
          onTap: onPress,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                height: 24.h,
                width: 24.w,
                color: isSelected ? AppColors.myWhite : const Color(0xffA4AAAB),
              ),
              // SizedBox(height: 4.h,),
              // Text(label.tr(context) , style: GoogleFonts.alexandria(
              //   fontSize: 12.sp,
              //   fontWeight: isSelected ? FontWeight.w400 : FontWeight.w300,
              //   color: isSelected ? AppColors.primaryColor : AppColors.secondaryColor,
              // ),),
            ],
          ),
        ),
      ),
    );
  }
}
