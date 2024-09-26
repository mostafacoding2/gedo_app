import 'package:alzcare/core/services/services_locator.dart';
import 'package:alzcare/core/theme/light_theme.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/health_care/presentation/controller/prescription_cubit.dart';
import 'package:alzcare/features/health_care/presentation/screens/last_prescriptions_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/custom_bottom_curvycircles.dart';
import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class ResultPrescriptionScreen extends StatefulWidget {
  final String id;
  const ResultPrescriptionScreen({super.key,required this.id});
  @override
  State<ResultPrescriptionScreen> createState() => _ResultPrescriptionScreenState();
}
class _ResultPrescriptionScreenState extends State<ResultPrescriptionScreen> {
  bool isloading = true;
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
        child: BlocProvider(
  create: (context) => sl<PrescriptionCubit>()..getPrescription(id: widget.id),
  child: Scaffold(
            body:BlocConsumer<PrescriptionCubit, PrescriptionState>(
  listener: (context, state) {

    if (state is GetPrescriptionLoadingState) {
      Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
        ),
      );
    }
    if (state is GetPrescriptionErrorState) {
      flutterToast(message: state.error, success: false);
    }
    if (state is GetPrescriptionSuccessState) {
      setState(() {
        isloading = false;
      });
    }  },
  builder: (context, state) {
    final cubit=PrescriptionCubit.get(context).prescriptionEntite;

    return  cubit == null
        ? const Center(
      child: CircularProgressIndicator(),
    )
        :Column(
              children: [
                 CustomAppBarTextAndArrowWidget(
                  iswhite: false,
                  title:cubit.dataPrescription!.attendingPhysician,
                  navigateToBottomNav: true,
                  widgetnavigate: LastPrescriptionsScreen(),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsetsDirectional.symmetric(horizontal: 24.r),
                        child: Column(
                          children: [
                            Container(
                              width: 327.w,height: 250.h,
                              margin: EdgeInsetsDirectional.only(top:48.r),
                              decoration: const BoxDecoration(borderRadius: BorderRadiusDirectional.all(Radius.circular(16))),
                              child:  CachedNetworkImage(
                                fit: BoxFit.fill,
                                imageUrl: cubit.dataPrescription!.prescriptionImage!.url,
                                placeholder:  (context, url) => Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    color: Colors.white,
                                  ),
                                ),

                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error,
                                        color: AppColors.myRedLight),
                              )

                            ),
                            SizedBox(height: 31.h,),
                            RowText(title: AppString.date, content: cubit.dataPrescription!.date.split('T').first),
                            SizedBox(height: 8.h,),
                            RowText(title: AppString.notes, content: cubit.dataPrescription!.notes,),
                            SizedBox(height: 8.h,),
                            RowText(title: AppString.namedoctor, content: cubit.dataPrescription!.attendingPhysician, )
                            , SizedBox(height: 8.h,),
                          ],
                        ),
                      ),
                      const CustomBottomCurvyCircles()
                    ],
                  ),
                )
              ],);
  },
)
        ),
));
  }

  Widget RowText({ required String title,required String content })=>  Row(
    children:
    [
      Text('${title} :',style: lightTheme.textTheme.bodySmall!.apply(
        fontSizeFactor: 1.sp,
        color: AppColors.primaryColor,
      ),),
      SizedBox(width: 8.h,),

      Text(content,style: lightTheme.textTheme.bodySmall!.apply(
        fontSizeFactor: 1.sp,
        color: AppColors.dark,
      ),),
    ],);
}