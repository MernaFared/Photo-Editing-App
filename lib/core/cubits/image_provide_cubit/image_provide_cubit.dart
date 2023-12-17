
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../screens/edit_photo/filter/data/local/filter_data.dart';
import 'image_provide_states.dart';



class ImageProviderCubit extends Cubit<ImageProviderStates> {
  ImageProviderCubit() : super(ImageProviderInitialState());

  static ImageProviderCubit get(context) => BlocProvider.of(context);

  void changeState(){
    emit(NewState());
  }


  Uint8List? _currentImage;

  List<double> _currentFilter = FilterData.filterList[0].matrix;

  onChangeImageFile(File image) {
    _currentImage = image.readAsBytesSync();
    emit(NewState());
  }

  onChangeImage(Uint8List image) {
    _currentImage = image;
    emit(NewState());
  }

  Uint8List? get currentImage => _currentImage;

  onChangeFilter(List<double> filterData) {
    _currentFilter = filterData;
    emit(NewState());
  }

  List<double> get currentFilter => _currentFilter;



  File? image;
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
      image = File(pickedFile.path);
      emit(PhotoSuccessState());

      onChangeImageFile(image!);

      //debugPrint("Hello");
    } else {
      debugPrint('No image selected');
      emit(PhotoErrorState());
      //showToast(text: "Not found", state: ToastStates.WARNING);
    }
  }


  Uint8List convertFileToUnit8List(File image) {
     return image.readAsBytesSync();
  }



}
