import 'dart:io';
import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/Community/domain/entites/chat_entity.dart';
import 'package:alzcare/features/Community/presentation/controller/community_cubit.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_friend_message.dart';
import 'package:alzcare/features/Community/presentation/widgets/custom_my_message.dart';
import 'package:alzcare/features/authentication/presentation/controller/auth_cubit.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController messagecontroller = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,

      );
    }
  }

  void addNewMessage(ChatData message) {
    setState(() {
      CommunityCubit.get(context).messages.add(message);
    });
    scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.myWhite,
            body:
                BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
              // TODO: implement listener
            }, builder: (context, state) {
              var cubit = AuthCubit.get(context).userEntity;
              return state is GetCurrentUserSuccessState
                  ? LayoutBuilder(
                      builder: (context, constraints) {
                        final double screenHeight = constraints.maxHeight;

                        return SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                  minHeight: constraints.maxHeight),
                              child: IntrinsicHeight(
                                child: BlocProvider(
                                  create: (context) => sl<CommunityCubit>()
                                    ..getAllMessages(
                                        id: userType == '3'
                                            ? cubit!.data!.patientsId!.first
                                            : cubit!.data!.careGiverID!
                                                .idcareGiver!),
                                  child: BlocConsumer<CommunityCubit,
                                      CommunityState>(
                                    listener: (context, state) {},
                                    builder: (context, state) {
                                      var Data = CommunityCubit.get(context)
                                          .messages
                                          .length;
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsetsDirectional.only(
                                                      top: 26.h,
                                                      start: 24.w,
                                                      end: 24.w),
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
                                                        imageUrl: userType ==
                                                                '3'
                                                            ? cubit!.data!
                                                                .profileImg!.url
                                                                .toString()
                                                            : cubit!
                                                                .data!
                                                                .careGiverID!
                                                                .profileImg!
                                                                .url!,
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
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 8.w,
                                                  ),
                                                  Form(
                                                    key: formKey,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                            userType == '3'
                                                                ? cubit.data!
                                                                    .userName
                                                                    .toString()
                                                                : cubit
                                                                    .data!
                                                                    .careGiverID!
                                                                    .usernamecareGiver!,
                                                            style: lightTheme
                                                                .textTheme
                                                                .headlineLarge!
                                                                .apply(
                                                              fontSizeFactor:
                                                                  1.sp,
                                                              color: AppColors
                                                                  .dark,
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  IconButton(
                                                      onPressed: () {
                                                        navigateAndReplacement(
                                                            context,
                                                            BottomNavScreen(
                                                              currentIndex: 1,
                                                            ));
                                                      },
                                                      icon: Icon(
                                                        Icons.arrow_forward_ios,
                                                        color: AppColors.dark,
                                                        size: 20.r,
                                                      ))
                                                ],
                                              )),
                                          Stack(
                                            children: [
                                              Column(
                                                children: [
                                                  state
                                                          is! GetAllMessagesLoadingState
                                                      ? (CommunityCubit.get(
                                                                  context)
                                                              .messages
                                                              .isNotEmpty)
                                                          ? SizedBox(
                                                              height: CommunityCubit.get(
                                                                              context)
                                                                          .imagePicker ==
                                                                      null
                                                                  ? screenHeight *
                                                                      .6
                                                                  : screenHeight *
                                                                      .4,
                                                              width: 375.w,
                                                              child: ListView
                                                                  .builder(
                                                                      physics:
                                                                          const BouncingScrollPhysics(),
                                                                      padding: EdgeInsetsDirectional.symmetric(
                                                                          horizontal: 15
                                                                              .w),
                                                                      itemCount:
                                                                          Data,
                                                                      controller:
                                                                          _scrollController,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        final data =
                                                                            CommunityCubit.get(context).messages[index];

                                                                        String
                                                                            timestamp =
                                                                            data.createdAt!;
                                                                        DateTime
                                                                            dateTime =
                                                                            DateTime.parse(timestamp).add(const Duration(hours: 2));

                                                                        String
                                                                            formattedTime =
                                                                            DateFormat.jm('ar_EG').format(dateTime);

                                                                        String period = (dateTime.hour <
                                                                                12)
                                                                            ? 'صباحًا'
                                                                            : 'مساءً';

                                                                        if (data.senderId ==
                                                                            cubit.data!.userId!) {
                                                                          return MyMessage(
                                                                            time:
                                                                                formattedTime,
                                                                            urlimagechat:
                                                                                data.imageChat!.url!,
                                                                            text:
                                                                                data.message!,
                                                                            urlimage:
                                                                                cubit.data!.profileImg!.url!,
                                                                          );
                                                                        } else {
                                                                          return FriendMessage(
                                                                            time:
                                                                                formattedTime,
                                                                            text:
                                                                                data.message ?? '',
                                                                            urlimagechat:
                                                                                data.imageChat!.url!,
                                                                            urlimage: userType == '3'
                                                                                ? cubit.data!.profileImg!.url.toString()
                                                                                : cubit.data!.careGiverID!.profileImg!.url!,
                                                                          );
                                                                        }
                                                                      }),
                                                            )
                                                          : SizedBox(
                                                              height:
                                                                  screenHeight *
                                                                      .6,
                                                            )
                                                      : SizedBox(
                                                          height:
                                                              screenHeight * .6,
                                                          child: Center(
                                                            child: CircularProgressIndicator(
                                                                color: AppColors
                                                                    .primaryColor),
                                                          )),
                                                  BlocConsumer<CommunityCubit,
                                                      CommunityState>(
                                                    listener:
                                                        (context, state) {},
                                                    builder: (context, state) {
                                                      return Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16)),
                                                          child: state
                                                                      is GetAllMessagesSuccessState ||
                                                                  CommunityCubit.get(
                                                                              context)
                                                                          .imagePicker ==
                                                                      null
                                                              ? SizedBox(
                                                                  height: 0.h,
                                                                )
                                                              : Container(
                                                                  height: 100.h,
                                                                  width: 100.w,
                                                                  child: Image.file(
                                                                      fit: BoxFit
                                                                          .fill,
                                                                      File(CommunityCubit.get(
                                                                              context)
                                                                          .imagePicker!
                                                                          .path)),
                                                                ));
                                                    },
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 105.0.h),
                                                    child: Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        Container(
                                                          height: 140.h,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            54.r),
                                                                  )),
                                                        ),
                                                        PositionedDirectional(
                                                          top: -91.h,
                                                          start: 0,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: AppColors
                                                                  .primaryColor,
                                                              border:
                                                                  BorderDirectional(
                                                                top: BorderSide(
                                                                  color: AppColors
                                                                      .myWhite,
                                                                  width: 0,
                                                                ),
                                                                bottom:
                                                                    BorderSide(
                                                                  color: AppColors
                                                                      .primaryColor,
                                                                  width: 0,
                                                                ),
                                                                start:
                                                                    BorderSide(
                                                                  color: AppColors
                                                                      .myWhite,
                                                                  width: 0,
                                                                ),
                                                                end: BorderSide(
                                                                  color: AppColors
                                                                      .myWhite,
                                                                  width: 0,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Container(
                                                              width: 80.w,
                                                              height: 91.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: AppColors
                                                                    .myWhite,
                                                                border:
                                                                    Border.all(
                                                                  width: 0,
                                                                  strokeAlign:
                                                                      0,
                                                                  style:
                                                                      BorderStyle
                                                                          .none,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadiusDirectional
                                                                        .only(
                                                                  bottomStart: Radius
                                                                      .circular(
                                                                          150.r),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        PositionedDirectional(
                                                          top: 45.h,
                                                          start: 85.w,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              ImagePicker()
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .gallery)
                                                                  .then((imagepicker) => CommunityCubit
                                                                          .get(
                                                                              context)
                                                                      .uploadimage(
                                                                          imagepicker!));
                                                            },
                                                            child: SizedBox(
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImagesPath
                                                                    .fileimage,
                                                                height: 30.h,
                                                                width: 30.w,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        PositionedDirectional(
                                                          top: 45.h,
                                                          start: 258.w,
                                                          end: 85.w,
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              ImagePicker()
                                                                  .pickImage(
                                                                      source: ImageSource
                                                                          .camera)
                                                                  .then((imagepicker) => CommunityCubit
                                                                          .get(
                                                                              context)
                                                                      .uploadimage(
                                                                          imagepicker!));
                                                            },
                                                            child: SizedBox(
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImagesPath
                                                                    .cameraimage,
                                                                height: 30.h,
                                                                width: 30.w,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              PositionedDirectional(
                                                start: 21.w,
                                                bottom: 170.h,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        BlocConsumer<
                                                            CommunityCubit,
                                                            CommunityState>(
                                                          listener:
                                                              (context, state) {
                                                            if (state
                                                                is CreateMessageSuccessState) {
                                                              flutterToast(
                                                                  message:
                                                                      'success',
                                                                  success:
                                                                      true);
                                                              messagecontroller
                                                                  .text = '';
                                                              CommunityCubit.get(
                                                                      context)
                                                                  .imagePicker = null;
                                                              CommunityCubit.get(context).getAllMessages(
                                                                  id: userType ==
                                                                          '3'
                                                                      ? cubit
                                                                          .data!
                                                                          .patientsId!
                                                                          .first
                                                                          .toString()
                                                                      : cubit
                                                                          .data!
                                                                          .careGiverID!
                                                                          .idcareGiver!);
                                                              addNewMessage(
                                                                  CommunityCubit
                                                                          .get(
                                                                              context)
                                                                      .messages
                                                                      .last);
                                                            }
                                                            if (state
                                                                is CreateMessageErrorState) {
                                                              flutterToast(
                                                                  message: state
                                                                      .error,
                                                                  success:
                                                                      false);
                                                            }
                                                            // TODO: implement listener
                                                          },
                                                          builder:
                                                              (context, state) {
                                                            return Padding(
                                                              padding: EdgeInsets.only(
                                                                  bottom: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets
                                                                      .bottom),
                                                              child: SizedBox(
                                                                  width: 340.w,
                                                                  child:
                                                                      CustomTextFormField(
                                                                    controller:
                                                                        messagecontroller,
                                                                    customSuffix:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (CommunityCubit.get(context).imagePicker == null &&
                                                                              messagecontroller.text == "") {
                                                                            flutterToast(
                                                                                message: "يرجى إدخال رسالة أو اختيار صورة للنشر",
                                                                                success: false);
                                                                          } else {
                                                                            print(messagecontroller.text);
                                                                            CommunityCubit.get(context).postChat(
                                                                                id: userType == '3' ? cubit.data!.patientsId!.first.toString() : cubit.data!.careGiverID!.idcareGiver!,
                                                                                message: messagecontroller.text);
                                                                          }
                                                                        },
                                                                        child: state
                                                                                is CreateMessageLoadingState
                                                                            ? CircularProgressIndicator(
                                                                                color: AppColors.primaryColor,
                                                                              )
                                                                            : SizedBox(
                                                                                width: 16.w,
                                                                                height: 16.h,
                                                                                child: SvgPicture.asset(
                                                                                  ImagesPath.send,
                                                                                  width: 16.w,
                                                                                  height: 16.h,
                                                                                )),
                                                                      ),
                                                                    ),
                                                                    obscureText:
                                                                        false,
                                                                    type: TextInputType
                                                                        .text,
                                                                    hintText:
                                                                        'مراسله...',
                                                                  )),
                                                            );
                                                          },
                                                        ),
                                                        SizedBox(
                                                          width: 8.w,
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ));
                      },
                    )
                  : Center(
                      child: CircularProgressIndicator(
                          color: AppColors.primaryColor));
            })));
  }
}
