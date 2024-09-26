import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_item_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // SizedBox(height: 10.h,),
          // BlocProvider(
          //   create: (context) => sl<CommunityCubit>(),
          //   child: BlocConsumer<CommunityCubit, CommunityState>(
          //     listener: (context, state) {
          //       if (state is DeleteAllNotificationsSuccessState) {
          //         flutterToast(message: "deleted", success: false);
          //         CommunityCubit.get(context).getAllNotifications();
          //       }
          //       // TODO: implement listener
          //     },
          //     builder: (context, state) {
          //       return Container(
          //         width: 120.w,
          //         color: AppColors.lightBlue.withOpacity(0.5),
          //         padding: EdgeInsets.all(8.r),
          //         margin: EdgeInsetsDirectional.only(end: 24.w),
          //         alignment: AlignmentDirectional.center,
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.delete, size: 20.r, color: AppColors.primaryColor,),
          //             SizedBox(width: 5.w,),
          //             Expanded(
          //               child: Text(
          //                 AppString.deleteAllNotification,
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .displaySmall!
          //                     .apply(fontSizeFactor: 1.sp, color: AppColors.dark),
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),
          SizedBox(height: 10.h,),
          Expanded(
            child: BlocProvider(
              create: (context) => sl<CommunityCubit>()..getAllNotifications(),
              child: BlocConsumer<CommunityCubit, CommunityState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  var Data = CommunityCubit.get(context)
                      .notifications
                      .reversed
                      .toList();
                  return state is! GetAllNotificationsLoadingState
                      ? (CommunityCubit.get(context).notifications.isNotEmpty)
                          ? ListView.builder(
                              itemCount: Data.length,
                              itemBuilder: (context, index) {
                                var cubit = Data[index];
                                String dateString = cubit.createdAt!;

                                // Parse the date string into a DateTime object
                                DateTime dateTime = DateTime.parse(dateString);

                                // Format the DateTime object into the desired format
                                String formattedDate =
                                    DateFormat('d/M/yyyy').format(dateTime);

                                // Output: 27/5/2024
                                return cubit.message == "New Chat Message"
                                    ? Column(
                                        children: [
                                          ItemNotification(
                                            widget: Row(
                                              children: [
                                                SvgPicture.asset(
                                                    ImagesPath.chat),
                                                SizedBox(
                                                  width: 18.w,
                                                ),
                                                Text(
                                                  cubit.message!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium!
                                                      .apply(
                                                        fontSizeFactor: 1.1.sp,
                                                        color: AppColors.dark,
                                                      ),
                                                ),
                                                Spacer(),
                                                Text(
                                                  formattedDate,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium!
                                                      .apply(
                                                        fontSizeFactor: 1.1.sp,
                                                        color: AppColors.dark,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : ItemNotification(
                                        widget: Row(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                cubit.message!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium!
                                                    .apply(
                                                      fontSizeFactor: 1.1.sp,
                                                      color: AppColors.dark,
                                                    ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              formattedDate,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .apply(
                                                    fontSizeFactor: 1.1.sp,
                                                    color: AppColors.dark,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      );
                              })
                          : Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    height: 180.h,
                                    width: 180.w,
                                    ImagesPath.noNotification,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "لا توجد شعارات",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .apply(
                                              fontSizeFactor: 1.1.sp,
                                              color: const Color.fromRGBO(
                                                  197, 213, 213, 1),
                                            ),
                                      ),
                                      Text(
                                        "سنرسل لك الشعارات عند الضوروه",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .apply(
                                              fontSizeFactor: 1.1.sp,
                                              color: const Color.fromRGBO(
                                                  197, 213, 213, 1),
                                            ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                      : Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
