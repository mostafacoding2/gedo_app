import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/core/utils/component_in_general.dart';
import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/core/utils/images_paths.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class IetmConnectwithus extends StatefulWidget {
 const  IetmConnectwithus({super.key});

  @override
  State<IetmConnectwithus> createState() => _IetmConnectwithusState();
}

class _IetmConnectwithusState extends State<IetmConnectwithus> {
GlobalKey<FormState>fromkey=GlobalKey();
TextEditingController emailController=TextEditingController();
TextEditingController phoneController=TextEditingController();
TextEditingController problemController=TextEditingController();
@override
  void dispose() {
  emailController.dispose();
  phoneController.dispose();
  problemController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children:
          [
            SizedBox(height: 8.h,),
            Container(width: 45.w,height: 5.h,decoration: BoxDecoration(color: const Color.fromRGBO(235, 237, 237, 1),borderRadius: BorderRadiusDirectional.circular(2.5.r)),
            )  ,
            SizedBox(height: 8.h,),

            Text('تواصل معنا' ,style: Theme.of(context).textTheme.labelMedium!.apply(
              fontSizeFactor: 1.1.sp,
              color: AppColors.primaryColor,
            ),),
            SizedBox(height: 34.h,),

            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.r),
              child: Form(key: fromkey,
                child: Column(
                  children: [
                    CustomTextFormField(controller: emailController,
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter}  البريد الالكتروني ";
                        } else {
                          return null;
                        }
                      },
                      customSuffix:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(ImagesPath.emailIcon , width: 24.w, height: 24.h,),
                    ),
                      obscureText: false,
                      type:TextInputType.emailAddress,
                      hintText: 'البريد الالكتروني',
                    ),
                    const SizedBox(height: 16,),
                    CustomTextFormField(controller: phoneController,
                      validator: (data) {
                        if (data?.isEmpty ?? true) {
                          return "${AppString.YouMustEnter} رقم الهاتف ";
                        } else {
                          return null;
                        }
                      },
                      customSuffix:const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.phone,size: 26,),
                    ),
                      obscureText: false,
                      type:TextInputType.emailAddress,
                      hintText: 'رقم الهاتف',
                    ),                const SizedBox(height: 16,),

                    Container(height: 180.h,
                       padding:  const EdgeInsets.only(top: 24),
                      decoration: BoxDecoration(
                          color:AppColors.myWhite,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [ BoxShadow(blurRadius: 4,spreadRadius: 0,color: Color.fromRGBO(191, 214, 215, 0.6),offset: Offset(1,1))]
                      ),
                       child: CustomTextFormField(
                         controller: problemController,
                         validator: (data) {
                         if (data?.isEmpty ?? true) {
                           return "${AppString.YouMustEnter} أرسل لنا إقتراحاتك و أفكارك ";
                         } else {
                           return null;
                         }
                       },
                        borderColor:Colors.white,
                        maxLines: 10,obscureText: false,type:TextInputType.text ,hintText: ' أرسل لنا إقتراحاتك و أفكارك       ',) ,
                    )


                  ],
                ),
              ),
            )

            , Padding(
            padding: EdgeInsetsDirectional.only(top:35.h,start:264.w),
            child: GestureDetector(onTap: (){
              if(fromkey.currentState!.validate()){
flutterToast(message: "تم ارسال الشكوي ويستم التواصل معكم ", success: true);
navigateTo(context, BottomNavScreen(currentIndex: 3,));

              }
            },
              child: Text('إرسال',style: Theme.of(context).textTheme.headlineSmall!.apply(
                fontSizeFactor: 1.1.sp,
                color: AppColors.primaryColor,
              ),),
            ),
          ),SizedBox(height: 30.h,)
          ],),

      ),
    );
  }
}
