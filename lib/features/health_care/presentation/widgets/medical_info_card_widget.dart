import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/health_care/domain/entites/medical%20details_entity.dart';
import 'package:alzcare/features/health_care/presentation/controller/medical_details_cubit.dart';
import 'package:alzcare/features/health_care/presentation/widgets/Item_details.dart';
import 'package:alzcare/features/health_care/presentation/widgets/sure_delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class MedicalInfoCard extends StatelessWidget {
  final String userName;
  final DataMedical data;
  final String userId;

  const MedicalInfoCard({
    Key? key,
    required this.userName,
    required this.data,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.myWhite,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 1),
            blurRadius: 4,
            spreadRadius: 1,
            color: Color.fromRGBO(191, 214, 215, 0.6),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h),
            TextItem(
              title: '${AppString.name} : ',
              content: userName,
            ),
            SizedBox(height: 5.h),
            TextItem(
              title: '${AppString.typeblood} : ',
              content: data.bloodType!,
            ),
            SizedBox(height: 5.h),
            TextItem(
              title: '${AppString.Allergies} :',
              content: data.sensitivities!,
            ),
            SizedBox(height: 5.h),
            TextItem(
              title: '${AppString.chronicdisease} : ',
              content: data.chronicDiseases!,
            ),
            SizedBox(height: 5.h),
            if (data.permanentMedications == false)
              TextItem(
                title: '${AppString.drugname} :',
                content: data.medications![0].name,
              ),
            SizedBox(height: 5.h),
            if (data.permanentMedications == true)
              TextItem(
                title: '${AppString.drugname} :',
                content: data.medications![0].name,
                content2: data.medications![1].name,
              ),
            BlocBuilder<MedicalDetailsCubit, MedicalDetailsState>(
              builder: (context, state) {
                var cubit =  MedicalDetailsCubit.get(context);

                if (state is DeleteMedicalDetailsErrorState) {
                  flutterToast(message: state.error, success: false);
                }
                if (state is DeleteMedicalDetailsSuccessState) {
                  flutterToast(message: AppString.Deleted, success: true);
                  MedicalDetailsCubit.get(context)
                      .getMedicalDetails(id: userId);
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
                            context: context,
                            builder: (BuildContext context) {
                              return  DeleteItemSureDialog(
                                title: "هل متأكد من حذف هذا",
                                onPressed: ()
                                {
                                  cubit
                                      .deleteMedicalDetails(id: data.id!);
                                  Navigator.pop(context);
                                },
                              );});

                      },
                      child: const Icon(
                        Icons.delete,
                        color: Color(0xffA4AAAB),
                        size: 32,
                      ),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
