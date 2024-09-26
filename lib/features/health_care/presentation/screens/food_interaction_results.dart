// import 'package:alzcare/core/utils/app_color.dart';
// import 'package:alzcare/core/utils/app_string.dart';
// import 'package:alzcare/features/health_care/data/model/drug_info_model.dart';
// import 'package:alzcare/features/health_care/data/model/food_interaction_model.dart';
// import 'package:alzcare/features/health_care/presentation/widgets/medical_record_widgets.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class FoodInteractionResultScreen extends StatelessWidget {
//   const FoodInteractionResultScreen({super.key, required this.foodInteractionModel});
//
//   final FoodInteractionModel foodInteractionModel;
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: AppColors.myWhite,
//         statusBarBrightness: Brightness.light,
//         statusBarIconBrightness: Brightness.dark,
//       ),
//     );
//
//     return SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Column(
//             children: [
//               const CustomAppBarTextAndArrowWidget(
//                 iswhite: false,
//                 title: AppString.foodInteractions,
//                 navigateToBottomNav: false,
//               ),
//               Padding(
//                 padding:
//                 EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 40.h),
//                 child: Column(
//                   children: [
//                     if( foodInteractionModel.diseaseName.toString() != '') DrugInfoResultWidget(
//                       title: AppString.diseaseName,
//                       content: foodInteractionModel.diseaseName.toString(),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.interactingDrugs.toString() != '') DrugInfoResultWidget(
//                       title: AppString.interactingDrugs,
//                       content: foodInteractionModel.interactingDrugs.toString(),
//
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.similarStructuredDrugs.toString() != '') DrugInfoResultWidget(
//                       title: AppString.similarStructuredDrugs,
//                       content: foodInteractionModel.similarStructuredDrugs.toString(),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.foodSources.toString() != '') DrugInfoResultWidget(
//                       title: AppString.foodSources,
//                       content: foodInteractionModel.foodSources.toString(),
//
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.nutrientComponent.toString() != '') DrugInfoResultWidget(
//                       title: AppString.nutrientComponent,
//                       content: foodInteractionModel.nutrientComponent.toString(),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.deepDDIOutput.toString() != '') DrugInfoResultWidget(
//                       title: AppString.deepDDIOutput,
//                       content: foodInteractionModel.deepDDIOutput.toString(),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.neuronalActivity.toString() != '') DrugInfoResultWidget(
//                       title: AppString.neuronalActivity,
//                       content: foodInteractionModel.neuronalActivity.toString(),
//                     ),
//                     SizedBox(
//                       height: 15.h,
//                     ),
//                     if( foodInteractionModel.ddiType.toString() != '') DrugInfoResultWidget(
//                       title: AppString.ddiType,
//                       content: foodInteractionModel.ddiType.toString(),
//                     ),
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class DrugInfoResultWidget extends StatelessWidget {
//   const DrugInfoResultWidget({
//     super.key,
//     required this.title,
//     required this.content,
//   });
//
//   final String title;
//   final String content;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(
//           width: 70.w,
//           child: Text(
//             '$title :',
//             style: Theme.of(context).textTheme.bodySmall!.apply(
//                 fontSizeFactor: 1.sp, color: AppColors.dark, fontWeightDelta: 2),
//           ),
//         ),
//         SizedBox(width: 3.w,),
//         Expanded(
//           child: Text(
//             content,
//             textAlign:TextAlign.justify,
//             style: Theme.of(context).textTheme.bodySmall!.apply(
//                 fontSizeFactor: 1.sp,
//                 color: AppColors.dark,
//
//                 fontWeightDelta: 1),
//           ),
//         ),
//       ],
//     );
//   }
// }
