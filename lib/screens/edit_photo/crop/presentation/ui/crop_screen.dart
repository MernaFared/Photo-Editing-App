import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/cubits/image_provide_cubit/image_provide_cubit.dart';
import '../../../../../core/cubits/image_provide_cubit/image_provide_states.dart';
import '../../../../../core/library/crop_image/src/crop_controller.dart';
import '../../../../../core/library/crop_image/src/crop_image.dart';
import '../../../../../core/new_shared/custom_app_bar_widget.dart';
import '../widgets/bottom_icon_button_widget.dart';

class CropScreen extends StatefulWidget {
  const CropScreen({Key? key}) : super(key: key);

  @override
  State<CropScreen> createState() => _CropScreenState();
}

class _CropScreenState extends State<CropScreen> {
  late CropController controller;
  late ImageProviderCubit imageProvider;

  @override
  void initState() {
    imageProvider = ImageProviderCubit.get(context);
    controller = CropController(
      aspectRatio: 1,
      defaultCrop: const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Crop',
        actionIcon: CupertinoIcons.checkmark_alt,
        actionPressed: () async {
          ui.Image bitmap = await controller.croppedBitmap();
          ByteData? data = await bitmap.toByteData(
            format: ImageByteFormat.png,
          );
          Uint8List image = data!.buffer.asUint8List();
          imageProvider.onChangeImage(image);
          if (!mounted) return;
          Navigator.of(context).pop();



        },
      ),
      body: Center(
          child: BlocConsumer<ImageProviderCubit,ImageProviderStates>(
            listener: (context,state){},
            builder: (context,state){
              if (imageProvider.currentImage != null) {
                return CropImage(
                  controller: controller,
                  image: Image.memory(imageProvider.currentImage!),
                  alwaysMove: true,
                );

              } else {
                return const CircularProgressIndicator.adaptive();
              }

            },
          )


      ),

      bottomNavigationBar: Container(
        color: Colors.black,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: 60,
            color: Colors.black,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.rotateRight();
                    },
                    child: const Icon(
                      Icons.rotate_90_degrees_cw_outlined,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.rotateLeft();
                    },
                    child: const Icon(
                      Icons.rotate_90_degrees_ccw_outlined,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = null;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: const Icon(
                      Icons.crop_free,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 1;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: const Icon(
                      Icons.crop_square,
                      color: Colors.white,
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 1 / 2;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '1:2',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 2 / 1;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '2:1',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 4 / 3;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '4:3',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 3 / 4;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '3:4',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 16 / 9;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '16:9',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  BottomIconButtonWidget(
                    onTap: () {
                      controller.aspectRatio = 9 / 16;
                      controller.crop = const Rect.fromLTRB(0.1, 0.1, 0.9, 0.9);
                    },
                    child: Text(
                      '9:16',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
