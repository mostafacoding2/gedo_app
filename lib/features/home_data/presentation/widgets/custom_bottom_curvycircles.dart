import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class  CustomBottomCurvyCircles extends StatelessWidget {
  const  CustomBottomCurvyCircles({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: 582.r),
          child: ClipPath(
            clipper: containercliper(),
            child: Container(
              color: const Color(0xffE0ECED),
              height: 154.h,
              width: 298.w,
            ),
          ),
        ),

        Padding(
          padding:  EdgeInsets.only(top: 566.r,right: 50),
          child: Container
            (height: 170.h,
            width: 332.w  , decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(200)),
              gradient:LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [

                  Color.fromRGBO(0, 100, 102, 1), // #006466
                  Color.fromRGBO(0, 100, 102, 0), // transparent
                ],
                stops: [0.2599, 1]
              ),
            ),
          ),
        ),
        PositionedDirectional(
          top:675.r,start: 100.r,
          child:
          CircleAvatar
            (radius: 20.r,
            backgroundColor:Color.fromRGBO(143, 196, 197, 0.46),
          ),
        ),
        PositionedDirectional(
          top:690.r,start: 190.r,
          child:
          CircleAvatar
            (radius: 13.r,
            backgroundColor:Color.fromRGBO(255, 255, 255, 0.4),
          ),
        ),
        PositionedDirectional(
          top:642.r,start: 208.r,
          child:
          CircleAvatar
            (radius: 8.r,
            backgroundColor:Color.fromRGBO(143, 196, 197, 0.4),
          ),
        ),
        PositionedDirectional(
          top:687.r,start: 305.r,
          child:
          CircleAvatar
            (radius:18.r ,
            backgroundColor:Color.fromRGBO(143, 196, 197, 0.46),
          ),
        ),
        PositionedDirectional(
          top:585.r,start: 296.r,
          child:
          CircleAvatar
            (
            radius: 18.r,
            backgroundColor:Color.fromRGBO(143, 196, 197, 0.4),
          ),
        ),


      ],
    );
  }
}
class containercliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(388.416, 15.7747);
    path_0.cubicTo(357.966, -3.16535, 321.466, -5.22535, 289.306, 10.5447);
    path_0.cubicTo(261.916, 23.9347, 240.606, 46.7047, 213.186, 60.1046);
    path_0.cubicTo(175.726, 78.4346, 134.596, 88.4547, 96.7262, 106.015);
    path_0.cubicTo(58.8563, 123.575, 22.6062, 151.095, 9.02625, 190.575);
    path_0.cubicTo(-6.97375, 237.205, -1.35375, 292.035, 23.1162, 334.665);
    path_0.cubicTo(62.8962, 403.955, 141.796, 428.565, 217.756, 427.665);
    path_0.cubicTo(378.266, 425.775, 460.946, 231.375, 434.756, 91.6647);
    path_0.cubicTo(429.036, 61.3947, 415.096, 32.3647, 388.416, 15.7747);
    path_0.close();
    Path path_1 = Path();
    path_1.moveTo(388.416, 15.7747);
    path_1.cubicTo(357.966, -3.16535, 321.466, -5.22535, 289.306, 10.5447);
    path_1.cubicTo(261.916, 23.9347, 240.606, 46.7047, 213.186, 60.1046);
    path_1.cubicTo(175.726, 78.4346, 134.596, 88.4547, 96.7262, 106.015);
    path_1.cubicTo(58.8563, 123.575, 22.6062, 151.095, 9.02625, 190.575);
    path_1.cubicTo(-6.97375, 237.205, -1.35375, 292.035, 23.1162, 334.665);
    path_1.cubicTo(62.8962, 403.955, 141.796, 428.565, 217.756, 427.665);
    path_1.cubicTo(378.266, 425.775, 460.946, 231.375, 434.756, 91.6647);
    path_1.cubicTo(429.036, 61.3947, 415.096, 32.3647, 388.416, 15.7747);
    path_1.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
