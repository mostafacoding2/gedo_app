import 'package:alzcare/core/utils/language%20cache%20helper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'app_color.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatefulWidget {
  final IconData? suffix;
  final Widget? customSuffix;
  final Widget? customPrefix;
  final IconData? prefix;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;
  final String? Function(String? val)? validator;
  dynamic onTap;
  dynamic suffixPressed;
  dynamic prefixPressed;
  final double width;
  final TextInputType type;
  double? iconSize = 20.r;
  double? borderRadius;
  final onChanged;
  Color? borderColor;
  Color? hintTextColor;
  Color? fillColor;
  bool? readOnly = false;
  int? maxLines;
  List<TextInputFormatter>? inputFormatters = [];
String ? label;
  CustomTextFormField({
    Key? key,
    this.controller,
    required this.obscureText,
    this.suffixPressed,
    this.hintText,
    this.suffix,
    this.validator,
    required this.type,
    this.onTap,
    this.width = double.infinity,
    this.prefixPressed,
    this.prefix,
    this.iconSize,
    this.inputFormatters,
    this.onChanged,
    this.readOnly = false,
    this.customSuffix,
    this.customPrefix,
    this.borderColor = const Color(0xffDBECED),
    this.hintTextColor = const Color(0xffA6A6A6),
    this.fillColor = const Color(0xffFFFFFF),
    this.borderRadius = 16,
    this.maxLines = 1,
    this.label,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  double? borderWidth;

  bool onpreesed = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      keyboardType: widget.type,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly!,
      maxLines: widget.maxLines,
      style: Theme.of(context).textTheme.displaySmall!.apply(
            fontSizeFactor: 1.sp,
            color: AppColors.dark,
          ),
      validator: widget.validator,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
       labelText: widget.label,
        labelStyle: onpreesed?Theme.of(context).textTheme.displaySmall!.apply(
          fontSizeFactor: 1.2.sp,
          color: AppColors.primaryColor,
        ):Theme.of(context).textTheme.displaySmall!.apply(
          fontSizeFactor: 1.2.sp,
          color: const Color(0xffA6A6A6),
        ),
        hintText: widget.hintText,
        filled: true,
        fillColor: widget.fillColor!,
        errorMaxLines: 2,
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!).r,
            borderSide: BorderSide(
              color: AppColors.myRedLight,
            )),
        hintStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .apply(fontSizeFactor: 1.sp, color: widget.hintTextColor),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius!).r,
            borderSide: BorderSide(
              color: AppColors.myRedLight,
            )),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!).r,
          borderSide: BorderSide(color: AppColors.primaryColor, width: 1.3.w),
        ),
        errorStyle: Theme.of(context)
            .textTheme
            .displaySmall!
            .apply(fontSizeFactor: 1.sp, color: AppColors.myRedLight),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!).r,
          borderSide: BorderSide(
            color: widget.borderColor!,
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        prefixIcon: (widget.customPrefix != null)
            ? widget.customPrefix
            : widget.prefix != null
                ? Icon(
                    widget.prefix,
                    color: AppColors.myGrey,
                    size: widget.iconSize,
                  )
                : null,
        suffixIcon: (widget.customSuffix != null)
            ? widget.customSuffix
            : widget.suffix != null
                ? IconButton(
                    onPressed: widget.suffixPressed,
                    icon: Icon(
                      widget.suffix,
                      color: AppColors.myGrey,
                      size: widget.iconSize,
                    ))
                : null,
      ),
    );
  }
}

class CustomElevatedButtonChild extends StatelessWidget {
  const CustomElevatedButtonChild({
    super.key,
    required this.text,
    this.isIcon = false,
    this.colorIsWhite = false,
  });

  final String text;
  final bool? isIcon;
  final bool? colorIsWhite;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style:Theme.of(context)
              .textTheme
              .displaySmall!
              .apply(fontSizeFactor: 1.1.sp,color: (colorIsWhite!)? AppColors.primaryColor:AppColors.myWhite),
        ),
        if (isIcon!)
          SizedBox(
            width: 16.w,
          ),
        if (isIcon!)
          SvgPicture.asset(
            'iconPath',
            width: 16.w,
            height: 23.6.h,
          ),
      ],
    );
  }
}

PreferredSize CustomAppBar({
  required String title,
  int appBarHeight = 56,
  required BuildContext context ,
}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, appBarHeight.h),
    child: AppBar(
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          (LanguageCacheHelper().getCachedLanguageCode() == "en")
              ? Icons.arrow_forward_ios_outlined
              : Icons.arrow_back_ios_outlined,
          color: AppColors.dark,
        ),
      ),
      titleSpacing: 10.w,
      title: Text(
        title,
      ),
    ),
  );
}

class CustomCashedNetworkImage extends StatelessWidget {
  const CustomCashedNetworkImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    this.circle = false,
    this.borderRadius = 8,
  });

  final double width;
  final double height;
  final double? borderRadius;
  final String imageUrl;
  final bool? circle;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height.h,
      width: width.w,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          shape: (circle!) ? BoxShape.circle : BoxShape.rectangle,
          borderRadius:
              (circle!) ? null : BorderRadius.circular(borderRadius!.r),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
      imageUrl: imageUrl,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: AppColors.myWhite,
        highlightColor: AppColors.myWhite.withOpacity(.02),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.dark,
            shape: BoxShape.circle,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Image.network(
          'https://img.freepik.com/free-photo/fast-fashion-vs-slow-sustainable-fashion_23-2149133973.jpg?w=360&t=st=1691110820~exp=1691111420~hmac=1162ff69459c85af835179d0733b380c523e4ce1fbae1c341ebacabc5f6c4027'),
      fit: BoxFit.fill,
    );
  }
}
