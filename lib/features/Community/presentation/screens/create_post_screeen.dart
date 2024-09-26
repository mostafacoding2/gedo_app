import 'dart:io';
import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_appBar_notification_community.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});
  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  TextEditingController textcontroller = TextEditingController();
GlobalKey<FormState>formkey=GlobalKey();
  final int maxLetters = 10; // maximum number of letters allowed

  String? _validateText(String value) {
    // Trim leading and trailing spaces
    String trimmedValue = value.trim();

    // Check if the text is empty after trimming
    if (trimmedValue.isEmpty) {
      return 'Input must not be empty or spaces only';
    }

    return null; // Return null if the input is valid
  }
  @override
  void dispose() {
    textcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffB2D1D1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
    return Scaffold(body: LayoutBuilder(
      builder: (context, constraints) {
        final double screenHeight = constraints.maxHeight;
        return SingleChildScrollView(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: screenHeight * .2,
                        child: CustomAppBarNotificationCommunity(
                            widget: Row(
                          children: [
                            Text('المنشورات',
                                style: lightTheme.textTheme.labelLarge!.apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.dark,
                                )),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  navigateTo(context,
                                      BottomNavScreen(currentIndex: 1));
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                  color: AppColors.dark,
                                ))
                          ],
                        )),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            height: screenHeight * .6,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 32.w),
                              child: SingleChildScrollView(
                                child: Form(key: formkey,
                                  child: Column(
                                    children: [
                                      BlocProvider(
                                        create: (context) =>
                                            sl<AuthCubit>()..getCurrentUser(),
                                        child: BlocBuilder<AuthCubit, AuthState>(
                                          builder: (context, state) {
                                            var cubit =
                                                AuthCubit.get(context).userEntity;
                                            return cubit == null
                                                ? CircularProgressIndicator(
                                                    color: AppColors.primaryColor,
                                                  )
                                                : Row(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                360.r),
                                                        child: SizedBox(
                                                            width: 54.w,
                                                            height: 54.h,
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.fill,
                                                              imageUrl: cubit
                                                                  .data!
                                                                  .profileImg!
                                                                  .url!,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child: CircularProgressIndicator(
                                                                          color: AppColors
                                                                              .primaryColor)),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(
                                                                      Icons.error,
                                                                      color: AppColors
                                                                          .myRedLight),
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        width: 8.w,
                                                      ),
                                                      Text(
                                                        cubit.data!.userName!,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .apply(
                                                              fontSizeFactor:
                                                                  1.1.sp,
                                                              color:
                                                                  AppColors.dark,
                                                            ),
                                                      ),
                                                      const Spacer()
                                                    ],
                                                  );
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      CustomTextFormField(
                                          validator: (value) {
                                            if (value == null) return 'Input cannot be null';
                                            return _validateText(value);
                                          },
                                          controller: textcontroller,
                                          maxLines: 7,
                                          borderColor: AppColors.myWhite,
                                          hintText: 'بم تفكر ؟...',
                                          obscureText: false,
                                          type: TextInputType.text),
                                      SizedBox(
                                        height: 16.h,
                                      ),
                                      BlocBuilder<CommunityCubit, CommunityState>(
                                        builder: (context, state) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            height: 150.h,
                                            width: 150.h,
                                            child: CommunityCubit.get(context)
                                                        .imagePicker ==
                                                    null
                                                ? const SizedBox()
                                                : Image.file(
                                                    fit: BoxFit.fill,
                                                    File(CommunityCubit.get(
                                                            context)
                                                        .imagePicker!
                                                        .path)),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 390.h),
                            child: BlocConsumer<CommunityCubit, CommunityState>(
                              listener: (context, state) {
                                if (state is CreatePostLoadingState) {
                                  Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  );
                                }
                                if (state is CreatePostErrorState) {
                                  flutterToast(
                                      message: state.error, success: false);
                                }
                                if (state is CreatePostSuccessState) {
                                  flutterToast(
                                      message: AppString.posted, success: true);
                                  navigateAndRemove(context,
                                      BottomNavScreen(currentIndex: 1));
                                }
                              },
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    int length= textcontroller.text.length;
                                    print("length on Tap $length");
                                    if(formkey.currentState!.validate()&&   CommunityCubit.get(context).imagePicker != null )
                                    {
                                      CommunityCubit.get(context).createPost(
                                          text: textcontroller.text);
                                    }
                                    else if(formkey.currentState!.validate()) {
                                      CommunityCubit.get(context).createPost(
                                          text: textcontroller.text);
                                    }
                                    else if(CommunityCubit.get(context).imagePicker != null) {
                                      CommunityCubit.get(context).createPost();
                                    }

                                  },
                                  child: Container(
                                    margin: EdgeInsetsDirectional.only(
                                        top: 10.h, bottom: 30.h, start: 295.w),
                                    height: 56.h,
                                    width: 56.w,
                                    decoration: BoxDecoration(
                                        boxShadow: const [
                                          BoxShadow(
                                              spreadRadius: 0,
                                              blurRadius: 4,
                                              offset: Offset(0, 4),
                                              color: Color.fromRGBO(
                                                  225, 225, 225, 1))
                                        ],
                                        color: AppColors.primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(360)),
                                    child: (state is CreatePostLoadingState)
                                        ? Center(
                                            child: CircularProgressIndicator(
                                              color: AppColors.myWhite,
                                            ),
                                          )
                                        : Icon(Icons.check,
                                            size: 30.r, color: Colors.white),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        clipBehavior: Clip.none,
                        children: [
                          Stack(
                            alignment: Alignment.bottomCenter,
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: 130.h,
                                decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(54.r),
                                    )),
                              ),
                              PositionedDirectional(
                                top: -91.h,
                                start: 0,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryColor,
                                    border: BorderDirectional(
                                      top: BorderSide(
                                        color: AppColors.myWhite,
                                        width: 0,
                                      ),
                                      bottom: BorderSide(
                                        color: AppColors.primaryColor,
                                        width: 0,
                                      ),
                                      start: BorderSide(
                                        color: AppColors.myWhite,
                                        width: 0,
                                      ),
                                      end: BorderSide(
                                        color: AppColors.myWhite,
                                        width: 0,
                                      ),
                                    ),
                                  ),
                                  child: Container(
                                    width: 80.w,
                                    height: 91.h,
                                    decoration: BoxDecoration(
                                      color: AppColors.myWhite,
                                      border: Border.all(
                                        width: 0,
                                        strokeAlign: 0,
                                        style: BorderStyle.none,
                                      ),
                                      borderRadius:
                                          BorderRadiusDirectional.only(
                                        bottomStart: Radius.circular(150.r),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              PositionedDirectional(
                                bottom: 45.h,
                                start: 85.w,
                                child: SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: GestureDetector(
                                      onTap: () {
                                        ImagePicker()
                                            .pickImage(
                                                source: ImageSource.gallery)
                                            .then((value) =>
                                                CommunityCubit.get(context)
                                                    .uploadimage(value!));
                                      },
                                      child: SvgPicture.asset(
                                          fit: BoxFit.fill,
                                          ImagesPath.fileimage)),
                                ),
                              ),
                              PositionedDirectional(
                                bottom: 45.h,
                                start: 258.w,
                                end: 85.w,
                                child: SizedBox(
                                  height: 32.h,
                                  width: 32.w,
                                  child: GestureDetector(
                                    onTap: () {
                                      ImagePicker()
                                          .pickImage(source: ImageSource.camera)
                                          .then((value) =>
                                              CommunityCubit.get(context)
                                                  .uploadimage(value!));
                                    },
                                    child: SvgPicture.asset(
                                        fit: BoxFit.fill,
                                        ImagesPath.cameraimage),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ]),
              ),
            ));
      },
    ));
  }
}
