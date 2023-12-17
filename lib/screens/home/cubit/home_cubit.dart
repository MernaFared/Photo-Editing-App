import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../models/business_model.dart';
import '../../../shared/end_points.dart';
import '../../../shared/shared.dart';
import '../home_screen.dart';
import 'home_states.dart';
import 'package:http/http.dart' as http;


class TestHomeCubit extends Cubit<TestHomeStates> {
  TestHomeCubit() : super(TestHomeInitialState());

  static TestHomeCubit get(context) => BlocProvider.of(context);

  void changeState(){
    emit(NewState());
  }

  int bodyScreenIndex = 0;
  List<Widget> bodyScreens = [
    const TestHomeScreen(),
    const TestHomeScreen(),
    const TestHomeScreen(),
  ];

  File? homeImage; //
  var picker = ImagePicker();


  Future<void> pickImage(bool isCamera, BuildContext context) async {
    final XFile? pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      homeImage = File(pickedFile.path);
      emit(PhotoSuccessState());
      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }


  List<XFile> imageFileList = [];
  List<File> myImages = [];
  Future<void> pickMultiImage(BuildContext context) async {

    final List<XFile>? selectedImages = await
    picker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList.addAll(selectedImages);

      for(var i in imageFileList){  // 5
        myImages.add(File(i.path));
      }

      emit(PhotoSuccessState());
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }

  }


  /// Replace Background
  ///
  File? originalImage;
  File? backgroundImage;

  Future<void> pickOriginalImage(bool isCamera, BuildContext context) async {
    final XFile? pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      originalImage = File(pickedFile.path);
      emit(PhotoSuccessState());
      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }

  Future<void> pickBackgroundImage(bool isCamera, BuildContext context) async {
    final XFile? pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      backgroundImage = File(pickedFile.path);
      emit(PhotoSuccessState());
      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }




  /// Detect Image


  // String? x;
  // void xx(){
  //   emit(LoadingState());
  //   Future.delayed(Duration(seconds: 5), () {
  //     x= "merna";
  //
  //     emit(SuccessState());
  //   });
  //
  //
  //
  // }
  //
  // int count = 1;
  //
  // void incrementCount(){
  //   count++;
  //   emit(SuccessState());
  // }
  //
  // void decrementCount(){
  //   count--;
  //   emit(SuccessState());
  //
  // }
/// remove background

  String? image;
  //ResultImageModel? myModel;
  void removeBackgroundImage(File imageFile) async {
    emit(RemoveBackgroundLoadingState());

    try {
      var request = http.MultipartRequest('POST', Uri.parse("${emulatorLocalUrl}remove_background"));
      request.files.add(await http.MultipartFile.fromPath('image', imageFile.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
    // Read the response body as a string.
    String responseBody = await response.stream.bytesToString();

    //myModel = ResultImageModel.fromJson(json.decode(responseBody));

    // Parse the response body into a map.
    Map<String, dynamic> data = json.decode(responseBody);
        image = data['image_url'];
        emit(RemoveBackgroundSuccessState());
      } else {
        debugPrint("${response.reasonPhrase}");
        emit(RemoveBackgroundErrorState(
          error: response.reasonPhrase,
        ));
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(RemoveBackgroundErrorState(
        error: e.toString(),
      ));
    }
  }




  String? replaceImage;

  void replaceBackgroundImage(File image, File background) async{
    emit(ReplaceBackgroundLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse('${emulatorLocalUrl}replace_background/'));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      request.files.add(await http.MultipartFile.fromPath('background', background.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        String responseBody = await response.stream.bytesToString();

        //myModel = ResultImageModel.fromJson(json.decode(responseBody));

        // Parse the response body into a map.
        Map<String, dynamic> data = json.decode(responseBody);
        replaceImage = data['image_url'];
        emit(ReplaceBackgroundSuccessState());
      }
      else {
        debugPrint("Error:: ${response.reasonPhrase}");
        emit(ReplaceBackgroundErrorState(
            error: response.reasonPhrase
        ));
      }
    }catch(e){
      debugPrint("Error2 : ${e.toString()}");
      emit(ReplaceBackgroundErrorState(
          error: e.toString()
      ));
    }

  }

/// alignment

  File? baseImage;
  File? currImage;

  Future<void> pickBaseImage(bool isCamera, BuildContext context) async {
    final XFile? pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      originalImage = File(pickedFile.path);
      emit(PhotoSuccessState());
      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }
  void  alignmentImage(File baseImage, File currImage) async{
    emit(AlignmentImageLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}align_and_get_result"
      ));
      request.files.add(await http.MultipartFile.fromPath('base_image',baseImage.path));
      request.files.add(await http.MultipartFile.fromPath('curr_image',currImage.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(AlignmentImageSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(AlignmentImageErrorState(
            error: response.reasonPhrase
        ));
      }
    }catch(e){
      debugPrint(e.toString());
      emit(AlignmentImageErrorState(
          error: e.toString()
      ));
    }

  }

  void  imageDenoising(File image) async{
    emit(ImageDenoisingLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}denoise_image"
      ));
      request.files.add(await http.MultipartFile.fromPath('image',image.path));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(ImageDenoisingSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(ImageDenoisingErrorState(
            error: response.reasonPhrase
        ));
      }
    }catch(e){
      debugPrint(e.toString());
      emit(ImageDenoisingErrorState(
          error: e.toString()
      ));
    }

  }

  void detectObjectsFromImage(File image) async{
    emit(DetectObjectsLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}detect"
      ));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(DetectObjectsSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(DetectObjectsErrorState(
            error: response.reasonPhrase
        ));

      }


    }catch(e){
      debugPrint(e.toString());
      emit(DetectObjectsErrorState(
          error: e.toString()
      ));
    }

  }

  void flipImage(File image,String direction) async{
    emit(FlipImageLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}flip"
      ));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      request.fields.addAll({
        "direction": direction
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(FlipImageSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(FlipImageErrorState(
            error: response.reasonPhrase
        ));

      }


    }catch(e){
      debugPrint(e.toString());
      emit(FlipImageErrorState(
          error: e.toString()
      ));
    }

  }

  void binarizeImage(File image,int threshold) async{
    emit(BinarizeImageLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}binarize_image"
      ));
      request.files.add(await http.MultipartFile.fromPath('image', image.path));
     // request.fields['threshold'] = threshold.toString();
      request.fields.addAll({
        "threshold": threshold.toString()
       });

      http.StreamedResponse response = await request.send();

      debugPrint("Status Code :: ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(BinarizeImageSuccessState());
      }
      else {
        debugPrint("Error :: ${response.reasonPhrase}");
        emit(BinarizeImageErrorState(
            error: response.reasonPhrase
        ));

      }

    }catch(e){
      debugPrint(e.toString());
      emit(BinarizeImageErrorState(
          error: e.toString()
      ));
    }

  }

  void convertColorSpace(File image,String color_space) async{
    emit(ConvertColorSpaceLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}convert_color_space"
      ));
      request.files.add(await http.MultipartFile.fromPath('file', image.path));
      request.fields.addAll({
        "color_space": color_space
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(ConvertColorSpaceSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(ConvertColorSpaceErrorState(
            error: response.reasonPhrase
        ));

      }


    }catch(e){
      debugPrint(e.toString());
      emit(ConvertColorSpaceErrorState(
          error: e.toString()
      ));
    }

  }

  /// Apply Watermark
  File? watermarkImage;
  Future<void> pickWatermarkImage(bool isCamera, BuildContext context) async {
    final XFile? pickedFile;
    if (isCamera) {
      pickedFile = await picker.pickImage(
        source: ImageSource.camera,
      );
    } else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }

    if (pickedFile != null) {
      watermarkImage = File(pickedFile.path);
      emit(PhotoSuccessState());
      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }
  void applyWaterMark(File image,File waterMarkImage, int x , int y ) async{
    emit(ApplyWaterMarkLoadingState());

    try{
      var request = http.MultipartRequest('POST', Uri.parse(
          "${emulatorLocalUrl}convert_color_space"
      ));
      request.files.add(await http.MultipartFile.fromPath('source_image', image.path));
      request.files.add(await http.MultipartFile.fromPath('watermark_image', waterMarkImage.path));
      request.fields.addAll({
        "x_position": x.toString() ,
        "y_position": y.toString() ,
      });

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        debugPrint("Success");
        // debugPrint("Response :: ${await response.stream.bytesToString()}");
        emit(ApplyWaterMarkSuccessState());
      }
      else {
        debugPrint("${response.reasonPhrase}");
        emit(ApplyWaterMarkErrorState(
            error: response.reasonPhrase
        ));

      }


    }catch(e){
      debugPrint(e.toString());
      emit(ApplyWaterMarkErrorState(
          error: e.toString()
      ));
    }

  }




  List<Map<String,dynamic>> myList = [{
    "dsa":"ad",

  },
    {
      "dsa": "ad"
    }];

  // json


  Map<String,dynamic> myMap = {
    "image_url": "adsdsadas"
  };

  void printdd(){
    print(myMap['image_url']);
  }






}
