
abstract class TestHomeStates {}

class TestHomeInitialState extends TestHomeStates {}

class NewState extends TestHomeStates {}


class PhotoSuccessState extends TestHomeStates {}
class PhotoErrorState extends TestHomeStates {}


class LoadingState extends TestHomeStates {}
class SuccessState extends TestHomeStates {}
class ErrorState extends TestHomeStates {}


class RemoveBackgroundLoadingState extends TestHomeStates {}
class RemoveBackgroundSuccessState extends TestHomeStates {}
class RemoveBackgroundErrorState extends TestHomeStates {
  final String? error;

  RemoveBackgroundErrorState({this.error});
}

class DetectObjectsLoadingState extends TestHomeStates {}
class DetectObjectsSuccessState extends TestHomeStates {}
class DetectObjectsErrorState extends TestHomeStates {
  final String? error;

  DetectObjectsErrorState({this.error});
}

class ReplaceBackgroundLoadingState extends TestHomeStates {}
class ReplaceBackgroundSuccessState extends TestHomeStates {}
class ReplaceBackgroundErrorState extends TestHomeStates {
  final String? error;

  ReplaceBackgroundErrorState({this.error});
}
class ImageDenoisingLoadingState extends TestHomeStates {}
class ImageDenoisingSuccessState extends TestHomeStates {}
class ImageDenoisingErrorState extends TestHomeStates {
  final String? error;

  ImageDenoisingErrorState({this.error});
}


class FlipImageLoadingState extends TestHomeStates {}
class FlipImageSuccessState extends TestHomeStates {}
class FlipImageErrorState extends TestHomeStates {
  final String? error;

  FlipImageErrorState({this.error});

}
class AlignmentImageLoadingState extends TestHomeStates {}
class AlignmentImageSuccessState extends TestHomeStates {}
class AlignmentImageErrorState extends TestHomeStates {
  final String? error;

  AlignmentImageErrorState({this.error});
}
class BinarizeImageLoadingState extends TestHomeStates {}
class BinarizeImageSuccessState extends TestHomeStates {}
class BinarizeImageErrorState extends TestHomeStates {
  final String? error;

  BinarizeImageErrorState({this.error});
}

class ConvertColorSpaceLoadingState extends TestHomeStates {}
class ConvertColorSpaceSuccessState extends TestHomeStates {}
class ConvertColorSpaceErrorState extends TestHomeStates {
  final String? error;

  ConvertColorSpaceErrorState({this.error});
}

class ApplyWaterMarkLoadingState extends TestHomeStates {}
class ApplyWaterMarkSuccessState extends TestHomeStates {}
class ApplyWaterMarkErrorState extends TestHomeStates {
  final String? error;

  ApplyWaterMarkErrorState({this.error});
}