import 'dart:io';

import 'package:alzcare/core/utils/app_color.dart';
import 'package:alzcare/core/utils/app_string.dart';
import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';


class PDFViewerScreen extends StatelessWidget {
  final String filePath;

  PDFViewerScreen(this.filePath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppString.readingbooks,)  , leading: IconButton(
        onPressed: ()
        {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios , color: AppColors.dark,),
      ),),
      body: PdfView(
        path: filePath,
        // Implement other PDF viewer properties as needed
      ),
    );
  }
}
