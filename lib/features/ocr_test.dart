import 'dart:io';

import 'package:alzcare/core/utils/constant.dart';
import 'package:alzcare/features/home_data/presentation/screens/bottom_nav_screen.dart';
import 'package:alzcare/features/home_data/presentation/widgets/item_selected_picked.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:alzcare/core/utils/app_color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_tesseract_ocr/flutter_tesseract_ocr.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OcrModelScreen extends StatefulWidget {
  OcrModelScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OcrModelScreenState createState() => _OcrModelScreenState();
}

class _OcrModelScreenState extends State<OcrModelScreen> {
  FlutterTts flutterTts = FlutterTts();
  bool play = false;

  @override
  void dispose() {
     flutterTts.stop();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initTts();
  }


  Future<void> initTts() async {
    // Initialize the Text-to-Speech engine
    await flutterTts.setLanguage('ar-EG');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);
  }

  Future<void> speak(String text) async {
    play = !play; // Toggle the boolean value

    // Check if the desired language is available
    bool isLanguageAvailable = await flutterTts.isLanguageAvailable('ar-EG');
    if (!isLanguageAvailable) {
      // Handle case where language is not available
      print('Arabic (Egypt) language is not available');
      return; // Exit the function if language is not available
    }
    if (!play) {
      await flutterTts.stop();
      return; // Exit the function early if stopping speech
    }
    // Initialize the Text-to-Speech engine if not already initialized
    await flutterTts.setLanguage('ar-EG');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setPitch(1.0);

    // Speak the provided text
    await flutterTts.speak(text);
  }

  String _ocrText = '';
  String _ocrHocr = '';
  Map<String, String> tessimgs = {
    "kor":
    "https://raw.githubusercontent.com/khjde1207/tesseract_ocr/master/example/assets/test1.png",
    "en": "https://tesseract.projectnaptha.com/img/eng_bw.png",
    "ch_sim": "https://tesseract.projectnaptha.com/img/chi_sim.png",
    "ru": "https://tesseract.projectnaptha.com/img/rus.png",
  };
  var LangList = ["kor", "eng", "deu", "ara"];
  var selectList = ["eng", "ara"];
  String path = "";
  bool bload = false;

  bool bDownloadtessFile = false;

  var urlEditController = TextEditingController()
    ..text = "https://tesseract.projectnaptha.com/img/eng_bw.png";

  Future<void> writeToFile(ByteData data, String path) {
    final buffer = data.buffer;
    return new File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
  bool isFirstLaunch = false;

  void imagePicker() {
    showDialog(
      barrierColor: const Color.fromRGBO(0, 100, 102, 0.2),
      context: context,
      builder: (BuildContext context) {
        return PickedImage(
          onPressedCamera: () async {
            Navigator.pop(context); // Close the dialog
            flutterTts.stop();
            await runFilePikerCamera();
          },
          onPressedGallery: () async {
            Navigator.pop(context); // Close the dialog
            flutterTts.stop();
            await runFilePikerGallery();
          },
        );
      },
    );
  }



  Future<void> runFilePikerGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _ocr(pickedFile.path);
    }
  }

  Future<void> runFilePikerCamera() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      _ocr(pickedFile.path);
    }
  }

  void _ocr(String url) async {
    if (selectList.isEmpty) {
      print("Please select a language");
      return;
    }
    path = url;
    if (!kIsWeb && (url.startsWith("http://") || url.startsWith("https://"))) {
      Directory tempDir = await getTemporaryDirectory();
      HttpClient httpClient = HttpClient();
      HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();
      Uint8List bytes = await consolidateHttpClientResponseBytes(response);
      String dir = tempDir.path;
      print('$dir/test.jpg');
      File file = File('$dir/test.jpg');
      await file.writeAsBytes(bytes);
      url = file.path;
    }
    var langs = selectList.join("+");

    bload = true;
    setState(() {});

    _ocrText =
    await FlutterTesseractOcr.extractText(url, language: langs, args: {
      "preserve_interword_spaces": "1",
    });

    bload = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Model'),
        leadingWidth: 100.w,
        leading: IconButton(
          onPressed: () {
           navigateAndRemove(context, BottomNavScreen(currentIndex: 0));
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.dark,
            size: 20.r,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                      children: [
                        path.isEmpty
                            ? Container()
                            : path.startsWith("http")
                            ? Image.network(path)
                            : Container(
                            padding:  EdgeInsetsDirectional.only(
                                bottom: 50.h),
                            height: 400.h,
                            child: Image.file(
                              File(path),
                              fit: BoxFit.contain,
                            )),
                        bload
                            ? const Column(children: [CircularProgressIndicator()])
                            : Stack(
                          children: [
                            Text(
                              '$_ocrText',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                  fontSizeFactor: 1.sp,
                                  color: AppColors.dark),
                              textDirection: TextDirection.rtl,
                            ),
                            if (_ocrText.isNotEmpty)
                              PositionedDirectional(
                                end: 5.w,
                                child: InkWell(
                                  onTap: () {
                                    speak(_ocrText);
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 45.w,
                                    padding: EdgeInsets.all(5.r),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      CupertinoIcons.speaker_2_fill,
                                      color: AppColors.myWhite,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
          ),
          Container(
            color: Colors.black26,
            child: bDownloadtessFile
                ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text('Downloading trained language files')
                  ],
                ))
                : const SizedBox(),
          )
        ],
      ),
      floatingActionButton: kIsWeb
          ? Container()
          : FloatingActionButton(
        onPressed: imagePicker,
        tooltip: 'OCR',
        child: const Icon(Icons.add),
      ),
    );
  }
}
