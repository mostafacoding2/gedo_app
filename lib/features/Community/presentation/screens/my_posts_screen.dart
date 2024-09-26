import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_appBar_notification_community.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_loading_posts.dart';
import 'package:alzcare/features/Community/presentation/widgets/item_create_comments.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class MyPostScreen extends StatefulWidget {
  const MyPostScreen({super.key, required this.id});
  final String id;
  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {
  @override
  Widget build(BuildContext context) {
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffB2D1D1),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
          CustomAppBarNotificationCommunity(
              widget: Row(
            children: [
              Text('منشوراتي',
                  style: lightTheme.textTheme.labelLarge!.apply(
                    fontSizeFactor: 1.sp,
                    color: AppColors.dark,
                  )),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    navigateTo(context, BottomNavScreen(currentIndex: 1));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 25,
                    color: AppColors.dark,
                  ))
            ],
          )),
          SizedBox(
            height: 27.h,
          ),
          BlocProvider(
            create: (context) =>
                sl<CommunityCubit>()..getAllMyPosts(id: widget.id),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 11.w,
                    ),
                    SizedBox(
                      height: 600.h,
                      child: BlocConsumer<CommunityCubit, CommunityState>(
                        listener: (context, state) {
                          if (state is GetAllMyPostsErrorState) {
                            flutterToast(message: state.error, success: false);
                          }
                          // TODO: implement listener
                        },
                        builder: (context, state) {
                          final cubit = CommunityCubit.get(context).mydata.reversed.toList();
                          return state  is! GetAllMyPostsLoadingState?(CommunityCubit.get(context).mydata.isNotEmpty)?ListView.builder(
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
                                        padding: EdgeInsetsDirectional.only(
                                            top: 16.h, start: 16, end: 16),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  360.r),
                                              child: SizedBox(
                                                  width: 40.w,
                                                  height: 40.h,
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.fill,
                                                    imageUrl: data.user!
                                                        .profileImg!.url!,
                                                    placeholder: (context,
                                                        url) =>
                                                        Shimmer.fromColors(
                                                          baseColor:
                                                          Colors.grey[300]!,
                                                          highlightColor:
                                                          Colors.grey[100]!,
                                                          child: Container(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                    errorWidget: (context,
                                                        url, error) =>
                                                        Icon(Icons.error,
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
                                            SizedBox(
                                              height: 24.h,
                                              width: 24.w,
                                              child: SvgPicture.asset(
                                                  ImagesPath.icons_sound),
                                            ),
                                            SizedBox(
                                              width: 8.w,
                                            ),
                                            BlocConsumer<CommunityCubit, CommunityState>(
                                              listener: (context, state) {
                                                if(state is DeletePostSuccessState){
                                                  flutterToast(message: AppString.Deleted, success: false);
                                                  CommunityCubit.get(context).getAllMyPosts(id: widget.id);
                                                }
                                              },
                                              builder: (context, state) {
                                                return GestureDetector(onTap: (){
                                                  CommunityCubit.get(context).deletePost(id:data.id! );
                                                },
                                                  child: SizedBox(
                                                    height: 24.h,
                                                    width: 24.w,
                                                    child: SvgPicture.asset(
                                                        ImagesPath.bi_x),
                                                  ),
                                                );
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.w,
                                      ),
                                      data.image!.url!.isEmpty? Padding(
                                        padding: EdgeInsets.only(
                                            left: 33.r, right: 16.r),
                                        child: Text(
                                          data.text!,
                                          textAlign: TextAlign.right,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium!
                                              .apply(
                                            fontSizeFactor: 1.1.sp,
                                            color: AppColors.dark,
                                          ),
                                        ),
                                      ): Column( children: [
                                          CachedNetworkImage(
                                            height:300.h,
                                            width:280.w,
                                            fit: BoxFit.fill,
                                            imageUrl: data.image!.url!,
                                            placeholder: (context, url) =>
                                                Shimmer.fromColors(
                                                  baseColor:
                                                  Colors.grey[300]!,
                                                  highlightColor:
                                                  Colors.grey[100]!,
                                                  child: Container(
                                                    height: 300.h,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                            errorWidget: (context,
                                                url, error) =>const SizedBox(),
                                          ),
                                          SizedBox(
                                            height: 10.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 33.r, right: 16.r),
                                            child: Text(
                                              data.text!,
                                              textAlign: TextAlign.right,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .apply(
                                                fontSizeFactor: 1.1.sp,
                                                color: AppColors.dark,
                                              ),
                                            ),
                                          ),
                                        ],),
                                      SizedBox(
                                        height: 30.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.r),
                                        child: Row(
                                          children: [
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.favorite,
                                                  size: 23,
                                                  color:
                                                  AppColors.myRedLight,
                                                )),
                                            Text(
                                                '${data.likes!.length} أعجاب',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineLarge!
                                                    .apply(
                                                  fontSizeFactor:
                                                  1.1.sp,
                                                  color: AppColors.dark,
                                                )),
                                            const Spacer(),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: 299.w,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: const Color.fromRGBO(
                                                    196, 222, 223, 1)),
                                            borderRadius:
                                            BorderRadius.circular(1)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 32.r),
                                        child: Row(
                                          children: [
                                            BlocConsumer<CommunityCubit,
                                                CommunityState>(
                                              listener: (context, state) {
                                                // TODO: implement listener
                                                if (state
                                                is TogglePostLikesSuccessState) {
                                                  CommunityCubit.get(
                                                      context)
                                                      .getAllMyPosts(
                                                      id: userId);
                                                }
                                              },
                                              builder: (context, state) {
                                                return IconButton(
                                                    onPressed: () {
                                                      CommunityCubit.get(
                                                          context)
                                                          .togglePostLikes(
                                                          id: data.id!);
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
                                                  print(
                                                      "id comment ${data.id}");
                                                  showModalBottomSheet(
                                                      barrierColor:
                                                      const Color
                                                          .fromRGBO(
                                                          0,
                                                          100,
                                                          102,
                                                          0.2),
                                                      context: context,
                                                      builder: (context) =>
                                                      //const ItemComments()
                                                      BlocProvider(
                                                        create: (context) =>
                                                            sl<CommunityCubit>(),
                                                        child:
                                                        ItemNoComments(
                                                            id: data
                                                                .id!),
                                                      ));
                                                },
                                                child: SizedBox(
                                                    height: 24.h,
                                                    width: 24.w,
                                                    child: SvgPicture.asset(
                                                        ImagesPath
                                                            .basil_comment)))
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }):
                          Text('لاتوجد منشورات ')    :   CustomloadingPost(length: cubit.length+1,);

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
          )
        ])));
  }
}
