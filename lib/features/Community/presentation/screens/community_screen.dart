import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Community/presentation/screens/chat_screen.dart';
import 'package:alzcare/features/Community/presentation/screens/create_post_screeen.dart';
import 'package:alzcare/features/Community/presentation/screens/my_posts_screen.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_appBar_notification_community.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_loading_posts.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/item_create_comments.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffB2D1D1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
    return BlocProvider(
      create: (context) => sl<CommunityCubit>()..getAllPosts(),
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(children: [
          CustomAppBarNotificationCommunity(
              widget: Text('المنشورات',
                  style: lightTheme.textTheme.labelLarge!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.dark,
                  ))),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                SizedBox(
                  height: 11.w,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        navigateTo(
                            context,
                            BlocProvider(
                              create: (context) => sl<CommunityCubit>(),
                              child: const CreatePostScreen(),
                            ));
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            right: 20.w, top: 13.h, bottom: 13.h),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadiusDirectional.circular(16.r),
                            border: Border.all(
                                color: const Color.fromRGBO(196, 222, 223, 1))),
                        width: 240.w,
                        child: Text(
                          'بم تفكر ؟...',
                          style: lightTheme.textTheme.displayMedium!.apply(
                            fontSizeFactor: 1.sp,
                            color: AppColors.myGrey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    BlocProvider(
                      create: (context) => sl<AuthCubit>()..getCurrentUser(),
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listener: (context, state) {
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          var cubit = AuthCubit.get(context);

                          return state is GetCurrentUserSuccessState
                              ? Row(
                                  children: [
                                    if (cubit.userEntity!.data!.careGiverID !=
                                        null)
                                      GestureDetector(
                                          onTap: () {
                                            navigateTo(
                                                context,
                                                BlocProvider(
                                                  create: (context) =>
                                                      sl<CommunityCubit>(),
                                                  child: BlocProvider(
                                                    create: (context) =>
                                                        sl<AuthCubit>()
                                                          ..getCurrentUser(),
                                                    child: const ChatScreen(),
                                                  ),
                                                ));
                                          },
                                          child: SizedBox(
                                            width: 32.w,
                                            height: 32.h,
                                            child: SvgPicture.asset(
                                                ImagesPath.chat),
                                          )),
                                    if (userType == '3')
                                      GestureDetector(
                                          onTap: () {
                                            navigateTo(
                                                context,
                                                BlocProvider(
                                                  create: (context) =>
                                                      sl<CommunityCubit>(),
                                                  child: BlocProvider(
                                                    create: (context) =>
                                                        sl<AuthCubit>()
                                                          ..getCurrentUser(),
                                                    child: const ChatScreen(),
                                                  ),
                                                ));
                                          },
                                          child: SizedBox(
                                            width: 32.w,
                                            height: 32.h,
                                            child: SvgPicture.asset(
                                                ImagesPath.chat),
                                          )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        navigateTo(
                                            context,
                                            MyPostScreen(
                                                id: cubit.userEntity!.data!
                                                    .userId!));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.primaryColor,
                                            borderRadius:
                                                BorderRadius.circular(360.r)),
                                        width: 35.w,
                                        height: 34.h,
                                        child: Center(
                                            child: SvgPicture.asset(
                                          width: 20.w,
                                          height: 24.h,
                                          ImagesPath.profileNav,
                                          color: Colors.white,
                                        )),
                                      ),
                                    )
                                  ],
                                )
                              : Row(
                                  children: [
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: SizedBox(
                                          height: 32.h,
                                          width: 32.w,
                                          child:
                                              SvgPicture.asset(ImagesPath.chat),
                                        )),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: SizedBox(
                                          height: 32.h,
                                          width: 32.w,
                                          child: SvgPicture.asset(
                                              ImagesPath.profileNav),
                                        ))
                                  ],
                                );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11.w,
                ),
                SizedBox(
                  height: 530.h,
                  child: BlocConsumer<CommunityCubit, CommunityState>(
                    listener: (context, state) {
                      if (state is GetAllPostsErrorState) {
                        flutterToast(message: state.error, success: false);
                      }
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      final cubit =
                          CommunityCubit.get(context).data.reversed.toList();
                      return state is! GetAllPostsLoadingState ||
                              cubit.isNotEmpty
                          ? (CommunityCubit.get(context).data.isNotEmpty)
                              ? InteractiveViewer(
                                  minScale: 0.1,
                                  maxScale: 4.0,
                                  child: ListView.builder(
                                      itemCount: cubit.length,
                                      itemBuilder: (context, index) {
                                        final data = cubit[index];
                                        String timestamp = data.createdAt!;
                                        DateTime datetime =
                                            DateTime.parse(timestamp)
                                                .add(const Duration(hours: 2));

                                        String formattedTime =
                                            DateFormat.jm('ar_EG')
                                                .format(datetime);

                                        String period = (datetime.hour < 12)
                                            ? 'صباحًا'
                                            : 'مساءً';

                                        DateTime dateTime =
                                            DateTime.parse(timestamp).toLocal();

                                        DateTime now = DateTime.now().toLocal();
                                        DateTime yesterday = now
                                            .subtract(const Duration(days: 1));
                                        DateTime today = DateTime(
                                            now.year, now.month, now.day);

                                        String formattedDate;

                                        if (dateTime.year == today.year &&
                                            dateTime.month == today.month &&
                                            dateTime.day == today.day) {
                                          formattedDate = 'اليوم';
                                        } else if (dateTime.year ==
                                                yesterday.year &&
                                            dateTime.month == yesterday.month &&
                                            dateTime.day == yesterday.day) {
                                          formattedDate = 'أمس';
                                        } else {
                                          formattedDate =
                                              DateFormat.yMMMMd('ar_EG')
                                                  .format(dateTime);
                                        }
                                        return Container(
                                          margin: EdgeInsets.only(bottom: 16.h),
                                          decoration: BoxDecoration(
                                              color: AppColors.myWhite,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16.r)),
                                              border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      196, 222, 223, 1))),
                                          width: 327.w,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsetsDirectional.only(
                                                        top: 16.h,
                                                        start: 16,
                                                        end: 16),
                                                child: Row(
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              360.r),
                                                      child: SizedBox(
                                                          width: 40.w,
                                                          height: 40.h,
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
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          maxLines: 1,
                                                          data.user!.uname!,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .apply(
                                                                fontSizeFactor:
                                                                    1.1.sp,
                                                                color: AppColors
                                                                    .dark,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text(
                                                          formattedDate,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .apply(
                                                                fontSizeFactor:
                                                                    1.1.sp,
                                                                color: AppColors
                                                                    .dark,
                                                              ),
                                                        ),
                                                        SizedBox(
                                                          height: 5.h,
                                                        ),
                                                        Text(
                                                          formattedTime,
                                                          textAlign:
                                                              TextAlign.right,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .headlineLarge!
                                                              .apply(
                                                                fontSizeFactor:
                                                                    1.1.sp,
                                                                color: AppColors
                                                                    .dark,
                                                              ),
                                                        )
                                                      ],
                                                    ),
                                                    const Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        speak(data.text!);
                                                      },
                                                      child: SizedBox(
                                                        height: 24.h,
                                                        width: 24.w,
                                                        child: SvgPicture.asset(
                                                            ImagesPath
                                                                .icons_sound),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8.w,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.w,
                                              ),
                                              data.image!.url!.isEmpty
                                                  ? Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 33.r,
                                                          right: 16.r),
                                                      child: Text(
                                                        data.text!,
                                                        textAlign:
                                                            TextAlign.right,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium!
                                                            .apply(
                                                              fontSizeFactor:
                                                                  1.1.sp,
                                                              color: AppColors
                                                                  .dark,
                                                            ),
                                                      ),
                                                    )
                                                  : Column(
                                                      children: [
                                                        Container(
                                                          height: 300.h,
                                                          width: 280.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.r)),
                                                          child:
                                                              CachedNetworkImage(
                                                            fit: BoxFit.fill,
                                                            imageUrl: data
                                                                .image!.url!,
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
                                                                height: 300.h,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                            errorWidget: (context,
                                                                    url,
                                                                    error) =>
                                                                const SizedBox(),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10.h,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 33.r,
                                                                  right: 16.r),
                                                          child: Text(
                                                            data.text ?? '',
                                                            textAlign:
                                                                TextAlign.right,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium!
                                                                .apply(
                                                                  fontSizeFactor:
                                                                      1.1.sp,
                                                                  color:
                                                                      AppColors
                                                                          .dark,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                              SizedBox(
                                                height: 30.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 16.r),
                                                child: Row(
                                                  children: [
                                                    IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {},
                                                        icon: Icon(
                                                          Icons.favorite,
                                                          size: 23,
                                                          color: AppColors
                                                              .myRedLight,
                                                        )),
                                                    Text(
                                                        '${data.likes!.length}  أعجاب',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headlineLarge!
                                                            .apply(
                                                              fontSizeFactor:
                                                                  1.1.sp,
                                                              color: AppColors
                                                                  .dark,
                                                            )),
                                                    const Spacer(),
                                                    Text(
                                                      data.commentCount == 0
                                                          ? 'لا توجد تعليقات'
                                                          : "${data.commentCount} تعليق",
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
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 299.w,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromRGBO(
                                                            196, 222, 223, 1)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            1)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 32.r),
                                                child: Row(
                                                  children: [
                                                    BlocConsumer<CommunityCubit,
                                                        CommunityState>(
                                                      listener:
                                                          (context, state) {
                                                        // TODO: implement listener
                                                        if (state
                                                            is TogglePostLikesSuccessState) {
                                                          CommunityCubit.get(
                                                                  context)
                                                              .getAllPosts();
                                                        }
                                                      },
                                                      builder:
                                                          (context, state) {
                                                        return IconButton(
                                                            onPressed: () {
                                                              CommunityCubit.get(
                                                                      context)
                                                                  .togglePostLikes(
                                                                      id: data
                                                                          .id!);
                                                              print(data.id!);
                                                            },
                                                            icon: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                size: 25,
                                                                color: AppColors
                                                                    .primaryColor));
                                                      },
                                                    ),
                                                    const Spacer(),
                                                    GestureDetector(
                                                        onTap: () {
                                                         navigateTo(context,BlocProvider(
                                                             create: (context) =>
                                                             sl<CommunityCubit>(),
  child: ItemNoComments(
                                                                          id: data.id!),
));
                                                        },
                                                        child: SizedBox(
                                                            height: 24.h,
                                                            width: 24.w,
                                                            child: SvgPicture
                                                                .asset(ImagesPath
                                                                    .basil_comment)))
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      }),
                                )
                              : const Text('لاتوجد منشورات ')
                          : const CustomloadingPost(
                              length: 15,
                            );
                    },
                  ),
                ),
                SizedBox(
                  height: 11.w,
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
