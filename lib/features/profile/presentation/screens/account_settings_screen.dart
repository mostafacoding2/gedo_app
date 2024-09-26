import 'dart:io';
import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_localization.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/core/utils/shared%20_pref.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/profile/presentation/controller/profile_cubit.dart';
import 'package:alzcare/features/profile/presentation/screens/changepassword_accountsettings_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();

  @override
  void dispose() {
    emailcontroller.dispose();
    usernamecontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.myWhite,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return SafeArea(
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (ProfileCubit.get(context).profileEntity != null) {
            // usernamecontroller.text = ProfileCubit.get(context).profileEntity!.data!.uname!;
            // emailcontroller.text = ProfileCubit.get(context).profileEntity!.data!.mail!;
          }
          return BlocProvider(
            create: (context) => sl<AuthCubit>()..getCurrentUser(),
            child: Scaffold(
              body: BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is GetCurrentUserSuccessState) {
                    var cubit = AuthCubit.get(context).userEntity;
                    emailcontroller.text = cubit!.data!.userEmail!;
                    usernamecontroller.text = cubit.data!.userName!;
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var cubit = AuthCubit.get(context).userEntity;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 24.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text('إعدادات الحساب',
                                      style: lightTheme.textTheme.displayLarge!
                                          .apply(
                                        fontSizeFactor: 1.sp,
                                        color: AppColors.primaryColor,
                                      )),
                                  const Spacer(),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 4.0.h),
                                    child: SizedBox(
                                        width: 24.w,
                                        height: 24.h,
                                        child: IconButton(
                                            onPressed: () {
                                              navigateTo(
                                                  context,
                                                  BottomNavScreen(
                                                    currentIndex: 3,
                                                  ));
                                            },
                                            icon: Icon(
                                              Icons.arrow_forward_ios,
                                              color: AppColors.dark,
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 66.h,
                        ),
                        state is GetCurrentUserSuccessState
                            ? Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 24.0.w),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 104.r, end: 105.r),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(360.r),
                                              child: SizedBox(
                                                  width: 142.w,
                                                  height: 142.h,
                                                  child: ProfileCubit.get(
                                                                  context)
                                                              .imagepicker ==
                                                          null
                                                      ? CachedNetworkImage(
                                                          fit: BoxFit.fill,
                                                          imageUrl: cubit!.data!
                                                              .profileImg!.url!,
                                                          placeholder: (context,
                                                                  url) =>
                                                              Shimmer
                                                                  .fromColors(
                                                            baseColor: Colors
                                                                .grey[300]!,
                                                            highlightColor:
                                                                Colors
                                                                    .grey[100]!,
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error,
                                                                  color: AppColors
                                                                      .myRedLight),
                                                        )
                                                      : Image.file(
                                                          fit: BoxFit.fill,
                                                          File(ProfileCubit.get(
                                                                  context)
                                                              .imagepicker!
                                                              .path)))),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.gallery)
                                                .then((value) =>
                                                    ProfileCubit.get(context)
                                                        .uploadimage(value!));
                                          },
                                          child: Container(
                                            margin: EdgeInsetsDirectional.only(
                                                top: 102, start: 218.r),
                                            width: 40.w,
                                            height: 40.h,
                                            decoration: BoxDecoration(
                                              color: const Color.fromRGBO(
                                                  196, 220, 220, 1),
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(360),
                                            ),
                                            child: Icon(
                                              FontAwesomeIcons.camera,
                                              color: AppColors.primaryColor,
                                              size: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 40.h,
                                    ),
                                    CustomTextFormField(
                                      controller: usernamecontroller,
                                      obscureText: false,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(40),
                                      ],
                                      // hintText:cubit!.data!.userName! ,
                                      type: TextInputType.text,
                                      label: 'اسم المستخدم',
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                    ),
                                    CustomTextFormField(
                                      // hintText: cubit.data!.userEmail!,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(40),
                                      ],
                                      controller: emailcontroller,
                                      obscureText: false,
                                      type: TextInputType.emailAddress,
                                      label: 'البريد الإلكتروني',
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    color: AppColors.primaryColor),
                              ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 16.h),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    SvgPicture.asset(ImagesPath.Lock),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        navigateTo(
                                            context,
                                            BlocProvider(
                                              create: (context) =>
                                                  sl<ProfileCubit>(),
                                              child:
                                                  const changepasswordAccountsettingsScreen(),
                                            ));
                                      },
                                      child: Text(
                                        'تغير كلمة المرور',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall!
                                            .apply(
                                              fontSizeFactor: 1.1.sp,
                                              color: AppColors.dark,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 98.h,
                              ),
                              BlocConsumer<ProfileCubit, ProfileState>(
                                listener: (context, state) {
                                  if (state is ProfileLoadingState) {
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      ),
                                    );
                                  }
                                  if (state is ProfileErrorState) {
                                    flutterToast(
                                        message: state.error, success: false);
                                  }
                                  if (state is ProfileSuccessState) {
                                    flutterToast(
                                        message: "تم التغير ", success: true);
                                    PreferenceUtils.setString(
                                        SharedKeys.userName,
                                        usernamecontroller.text);
                                    userName = usernamecontroller.text;
                                  }
                                },
                                builder: (context, state) {
                                  return SizedBox(
                                    height: 48.h,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.primaryColor),
                                      onPressed: () {
                                        // if ( ProfileCubit.get(context).imagepicker ==
                                        //       null)
                                        ProfileCubit.get(context)
                                            .changeDataProfile(
                                                username:
                                                    usernamecontroller
                                                            .text.isEmpty
                                                        ? cubit!.data!.userName!
                                                        : usernamecontroller
                                                            .text,
                                                email:
                                                    emailcontroller.text.isEmpty
                                                        ? cubit!.data!.userName!
                                                        : emailcontroller.text);
                                      },
                                      child: (state is ProfileLoadingState)
                                          ? CircularProgressIndicator(
                                              color: AppColors.myWhite,
                                            )
                                          : CustomElevatedButtonChild(
                                              text: "changing".tr(context),
                                            ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
