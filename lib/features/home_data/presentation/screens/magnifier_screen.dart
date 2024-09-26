
import 'dart:io';

import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:alzcare/features/home_data/presentation/screens/pdf_view_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
class MagnifierScreen extends StatefulWidget {
  @override
  _MagnifierScreenState createState() => _MagnifierScreenState();
}

class _MagnifierScreenState extends State<MagnifierScreen> {
  File? _imageFile;

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  void pickAndShowPDF(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PDFViewerScreen(file.path!),
        ),
      );
    } else {
      // User canceled the picker
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.viewContent,)  , leading: IconButton(
        onPressed: ()
        {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios , color: AppColors.dark,),
      ),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (_imageFile != null)
              Expanded(
                child: PhotoView(
                  imageProvider: FileImage(_imageFile!),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 4.0,
                  backgroundDecoration: BoxDecoration(
                    color: Colors.black,
                  ),
                ),
              ),
            // ElevatedButton(
            //   onPressed: () => _getImage(ImageSource.gallery),
            //   child: Text('Select from Gallery'),
            // ),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child:  Text(AppString.outSourceBook , style: Theme.of(context).textTheme.bodyMedium!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.myWhite
              ),),
            ),
            SizedBox(height: 30.h,),
            ElevatedButton(
              onPressed: () {
                pickAndShowPDF(context);
              },
              child: Text(AppString.importPdfAndMagnifier,style: Theme.of(context).textTheme.bodyMedium!.apply(
                fontSizeFactor: 1.sp,
                color: AppColors.myWhite,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}