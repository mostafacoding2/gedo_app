import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';
class ItemNoComments extends StatefulWidget {
  final String id;
  const ItemNoComments({
    super.key,
    required this.id,
  });
  @override
  State<ItemNoComments> createState() => _ItemNoCommentsState();
}
class _ItemNoCommentsState extends State<ItemNoComments> {
  TextEditingController textcontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:
        Column(
          children: [

            CustomAppBarTextAndArrowWidget(
              iswhite: false,
              title: "التعليقات",
              navigateToBottomNav: true,
              widgetnavigate: BottomNavScreen(currentIndex: 1,),
            ),

            BlocProvider(
                    create: (context) =>
                        sl<CommunityCubit>()..getAllComments(id: widget.id),
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          BlocConsumer<CommunityCubit, CommunityState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              return state is! GetAllCommentLoadingState
                                  ? (CommunityCubit.get(context).comments.isNotEmpty)

                                  ? SizedBox(height: 550.h,
                                    child: ListView.builder(
                                      itemCount: CommunityCubit.get(context)
                                          .comments
                                          .length,
                                      itemBuilder: (context, index) {
                                        final data = CommunityCubit.get(context)
                                            .comments[index];
                                        return
                                           Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                  top: 23.h,
                                                  start: 24.w,
                                                ),
                                                child: Stack(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      360.r),
                                                          child: SizedBox(
                                                            width: 26.w,
                                                            height: 26.h,
                                                            child:
                                                                CachedNetworkImage(
                                                              fit: BoxFit.fill,
                                                              imageUrl: data
                                                                  .user!
                                                                  .profileImg!
                                                                  .url!,
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Shimmer
                                                                      .fromColors(
                                                                baseColor: Colors
                                                                    .grey[300]!,
                                                                highlightColor:
                                                                    Colors.grey[
                                                                        100]!,
                                                                child: Container(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(
                                                                      Icons.error,
                                                                      color: AppColors
                                                                          .myRedLight),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(width: 8.w),
                                                        Container(
                                                          height: 40.h,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .only(
                                                            start: 9.w,
                                                            top: 10.h,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.r),
                                                            border: Border.all(
                                                              color: const Color
                                                                  .fromRGBO(196,
                                                                  222, 223, 1),
                                                            ),
                                                          ),
                                                          width: 200.w,
                                                          child: Text(
                                                            data.text!,
                                                            style: lightTheme
                                                                .textTheme
                                                                .headlineLarge!
                                                                .apply(
                                                              fontSizeFactor:
                                                                  1.sp,
                                                              color:
                                                                  AppColors.dark,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    PositionedDirectional(
                                                      start: 225.w,
                                                      top: 15.h,
                                                      child:
                                                          data.likes!.isNotEmpty
                                                              ? Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .favorite_rounded,
                                                                      size: 15.r,
                                                                      color: AppColors
                                                                          .myRedLight,
                                                                    ),
                                                                    Text(
                                                                      '${data.likes!.length}',
                                                                      style: lightTheme
                                                                          .textTheme
                                                                          .headlineLarge!
                                                                          .apply(
                                                                        fontSizeFactor:
                                                                            1.sp,
                                                                        color: AppColors
                                                                            .dark,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                )
                                                              : Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .favorite_border,
                                                                      size: 15,
                                                                      color: AppColors
                                                                          .primaryColor,
                                                                    ),
                                                                    Text(
                                                                      '${data.likes!.length}',
                                                                      style: lightTheme
                                                                          .textTheme
                                                                          .headlineLarge!
                                                                          .apply(
                                                                        fontSizeFactor:
                                                                            1.sp,
                                                                        color: AppColors
                                                                            .dark,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Like(idComment: data.id!,data:widget.id ,)
                                            ],
                                          )
                                      ;
                                      },
                                    ),
                                  )
                                      : Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsetsDirectional.only(
                                                start: 107.w,
                                                top: 132.h,
                                                end: 108.w),
                                            child: SizedBox(
                                                width: 160.w,
                                                height: 165.h,
                                                child: SvgPicture.asset(
                                                    ImagesPath.nocomment)),
                                          ),
                                          Center(
                                            child: Text(
                                              'لا توجد تعليقات الان',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .apply(
                                                    fontSizeFactor: 1.1.sp,
                                                    color: const Color.fromRGBO(
                                                        197, 213, 213, 1),
                                                  ),
                                            ),

                                          ),
                                          Center(
                                            child: Text(
                                              'كن اول معلق',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .apply(
                                                    fontSizeFactor: 1.1.sp,
                                                    color: const Color.fromRGBO(
                                                        197, 213, 213, 1),
                                                  ),
                                            ),
                                          ),SizedBox(height: 200.h,)
                                        ],
                                      )
                                  : Column(
                                    children: [
                                      SizedBox(height: 500.h,),
                                      Center(
                                          child:
                                              CircularProgressIndicator(
                                                  color: AppColors.primaryColor),
                                        ),
                                    ],
                                  );
                            },
                          ),
              BlocConsumer<CommunityCubit, CommunityState>(
                listener: (context, state) {
                  if (state is CreatecommentLoadingState) {
                    Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                  if (state is CreatecommentErrorState) {
                    flutterToast(message: state.error, success: false);
                  }
                  if (state is CreatecommentSuccessState) {
                    textcontroller.clear();
                    flutterToast(
                        message: AppString.posted, success: true);
                    CommunityCubit.get(context)
                        .getAllComments(id: widget.id);
                  }
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(top: 70,
                        start: 24.w, end: 24.w),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            ImagePicker()
                                .pickImage(source: ImageSource.camera)
                                .then((value) =>
                                    CommunityCubit.get(context)
                                        .uploadimage(value!));
                          },
                          child: SizedBox(
                              width: 24.w,
                              height: 24.h,
                              child: SvgPicture.asset(
                                  ImagesPath.camerachat,  width: 24.w,
                                height: 24.h,)),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(
                          width: 263.w,
                          child: CustomTextFormField(
                            validator: (value) {
                              if (value == null) return 'Input cannot be null';
                              return _validateText(value);
                            },
                            controller: textcontroller,
                            hintText: 'اكتب تعليقا....',
                            obscureText: false,
                            type: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        SizedBox(height:200.h,
                          child: GestureDetector(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                CommunityCubit.get(context).createComment(
                                    id: widget.id,
                                    text: textcontroller.text);
                              }
                            },
                            child:(state is CreatecommentLoadingState )
                                ? SizedBox( width: 24.w,
                              height: 24.h,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ) :SizedBox(
                                width: 24.w,
                                height: 24.h,
                                child: SvgPicture.asset(ImagesPath.send,    width: 24.w,
                                  height: 24.h,)),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
                        ],
                      ),
                    )),
          ],
        ),

      ),
    );
  }
}
class Like extends StatelessWidget {
  const Like({super.key, required this.idComment,required this.data});
  final String idComment;
  final String data;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:
      EdgeInsetsDirectional.only(
        start: 67.w,
        top: 5.h,
      ),
      child: Row(
        children: [
          BlocProvider(
  create: (context) => sl<CommunityCubit>()..getAllComments(id:data ),
  child: BlocBuilder<CommunityCubit,
              CommunityState>(
            builder: (context, state) {
              if (state
              is ToggleCommentLikesSuccessState) {
                CommunityCubit.get(
                    context)
                    .getAllComments(
                    id: data);
              }
              return GestureDetector(
                onTap: () {
                  CommunityCubit.get(
                      context)
                      .toggleCommentLikes(
                      id: idComment);
                },
                child: Text(
                  'أعجبني',
                  style: lightTheme
                      .textTheme
                      .headlineLarge!
                      .apply(
                    fontSizeFactor:
                    1.sp,
                    color:
                    AppColors.dark,
                  ),
                ),
              );
            },
          ),
),
          // SizedBox(width: 22.w),
          // Text(
          //   'رد',
          //   style: lightTheme.textTheme
          //       .headlineLarge!
          //       .apply(
          //     fontSizeFactor: 1.sp,
          //     color: AppColors.dark,
          //   ),
          // ),
        ],
      ),
    );
  }
}
