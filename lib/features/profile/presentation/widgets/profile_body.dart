import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/authentication/presentation/screens/select_type_screen.dart';
import 'package:alzcare/features/health_care/presentation/widgets/item_warning.dart';
import 'package:alzcare/features/home_data/presentation/screens/advices_screen.dart';
import 'package:alzcare/features/profile/presentation/screens/user_guide_screenOne.dart';
import 'package:alzcare/features/profile/presentation/widgets/item_connect_withus.dart';
import 'package:alzcare/features/profile/presentation/controller/profile_cubit.dart';
import 'package:alzcare/features/profile/presentation/widgets/item_signout.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/profile/presentation/screens/account_settings_screen.dart';
import 'package:alzcare/features/profile/presentation/widgets/Ietm_selected_font.dart';
import 'package:alzcare/features/profile/presentation/widgets/custom_item_profile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({super.key});

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}
class _ProfileBodyState extends State<ProfileBody> {
  void signout()  {
      showDialog(
          barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
          context: context,
          builder: (BuildContext context) {
            return const ItemSigOut(
              title: "هل تريد تسجيل الخروج",
            );});

  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthCubit>()..getCurrentUser(),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              'حسابي',
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    fontSizeFactor: 1.1.sp,
                    color: AppColors.primaryColor,
                  ),
            ),
            SizedBox(
              height: 16.h,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                var cubit = AuthCubit.get(context);
                return state is GetCurrentUserSuccessState
                    ? Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(360.r),
                            child: SizedBox(
                                width: 54.w,
                                height: 54.h,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  imageUrl: cubit.userEntity!
                                      .data!.profileImg!.url!,
                                  placeholder: (context, url) =>
                                      Shimmer.fromColors(
                                    baseColor: Colors.grey[300]!,
                                    highlightColor: Colors.grey[100]!,
                                    child: Container(
                                      color: Colors.white,
                                    ),
                                  ),
                                  errorWidget: (context, url, error) => Icon(
                                      Icons.error,
                                      color: AppColors.myRedLight),
                                )),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Text(
                              cubit.userEntity!.data!.userName!,
                              style: Theme.of(context).textTheme.bodySmall!.apply(
                                    fontSizeFactor: 1.1.sp,
                                    color: AppColors.dark,
                                  ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              navigateTo(
                                  context,
                                  BlocProvider(
                                    create: (context) => sl<ProfileCubit>(),
                                    child: const AccountSettingsScreen(),
                                  ));
                            },
                            child: SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: SvgPicture.asset(ImagesPath.edit)),
                          ),
                        ],
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
            SizedBox(
              height: 34.h,
            ),
            Row(
              children: [
                Text(
                  'الإعدادات',
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        fontSizeFactor: 1.1.sp,
                        color: AppColors.primaryColor,
                      ),

                ),   const Spacer()
              ],
            ),
            SizedBox(
              height: 18.h,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 18.h,
                ),

                ItemProfile(
                  image: ImagesPath.advice,
                  title: AppString.advice,
                  onPressed: () {
                    navigateTo(context, const AdvicesScreen());
                  },
                ),
                ItemProfile(
                  image: ImagesPath.Connectwithus,
                  title: AppString.Connectwithus,
                  onPressed: () {
                    showModalBottomSheet(
                        barrierColor:
                        const Color.fromRGBO(0, 100, 102, 0.2),
                        context: context,
                        builder: (context) => const IetmConnectwithus());
                  },
                ),
                ItemProfile(
                  image: ImagesPath.userGuide,
                  title: AppString.userGuide,
                  onPressed: ()
                  {
navigateTo(context, const UserGuideScreenOne());
                  },
                ),
               if(userType == '1') ItemProfile(
                  image: ImagesPath.codeIcon,
                  title: AppString.userCode,
                  isCode: true,
                  onPressed: () {},
                ),
                ItemProfile(
                  image: ImagesPath.signout,
                  title: AppString.signout,
                  onPressed:  signout,
                  isLogOut: true,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
