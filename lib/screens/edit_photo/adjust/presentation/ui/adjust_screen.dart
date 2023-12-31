import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/cubits/adjust_cubit/adjust_cubit.dart';
import '../../../../../core/cubits/image_provide_cubit/image_provide_cubit.dart';
import '../../../../../core/cubits/image_provide_cubit/image_provide_states.dart';
import '../../../../../core/new_shared/bottom_button_widget.dart';
import '../../../../../core/new_shared/custom_app_bar_widget.dart';
import '../widgets/custom_slider_widget.dart';

class AdjustScreen extends StatefulWidget {
  const AdjustScreen({Key? key}) : super(key: key);

  @override
  State<AdjustScreen> createState() => _AdjustScreenState();
}

class _AdjustScreenState extends State<AdjustScreen> {
  AdjustCubit? adjustProvider;

  late ImageProviderCubit imageProvider;

 // ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      imageProvider = ImageProviderCubit.get(context);

      adjustProvider = AdjustCubit.get(context);
      if (adjustProvider != null) {
        adjustProvider!.adjustImage();
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Adjust',
        actionIcon: CupertinoIcons.checkmark_alt,
        actionPressed: () {
          // screenshotController.capture().then((Uint8List? image) {
          //   if (image != null) {
          //     imageProvider.onChangeImage(image);
          //     if (!mounted) return;
          //     Navigator.of(context).pop();
          //   }
          // }).catchError((onError) {
          //   debugPrint(onError);
          // });
        },
      ),
      body: adjustProvider != null
          ? Stack(
              children: [
                Center(
                  child: BlocConsumer<ImageProviderCubit,ImageProviderStates>(
                     listener: (context,state){},
                    builder: (context,state){
                      if (imageProvider.currentImage != null) {
                        return ColorFiltered(
                          colorFilter: ColorFilter.matrix(
                            adjustProvider!.adj.matrix,
                          ),
                          child: Image.memory(imageProvider.currentImage!),
                        );

                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }

                    },
                    )


                  // Consumer<AppImageProvider>(
                  //   builder: (context, state, child) {
                  //     if (state.currentImage != null) {
                  //       return ColorFiltered(
                  //         colorFilter: ColorFilter.matrix(
                  //           adjustProvider!.adj.matrix,
                  //         ),
                  //         child: Image.memory(state.currentImage!),
                  //       );
                  //
                  //     }
                  //     return const CircularProgressIndicator.adaptive();
                  //   },
                  // ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: adjustProvider!.showBrightness,
                              child: CustomSliderWidget(
                                value: adjustProvider!.brightness,
                                onChanged: (value) {
                                  adjustProvider!.adjustImage(b: value);
                                  setState(() {});
                                },
                              ),
                            ),
                            Visibility(
                              visible: adjustProvider!.showContrast,
                              child: CustomSliderWidget(
                                value: adjustProvider!.contrast,
                                onChanged: (value) {
                                  setState(() {
                                    adjustProvider!.adjustImage(c: value);
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: adjustProvider!.showSaturation,
                              child: CustomSliderWidget(
                                value: adjustProvider!.saturation,
                                onChanged: (value) {
                                  setState(() {
                                    adjustProvider!.adjustImage(s: value);
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: adjustProvider!.showHue,
                              child: CustomSliderWidget(
                                value: adjustProvider!.hue,
                                onChanged: (value) {
                                  setState(() {
                                    adjustProvider!.adjustImage(h: value);
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: adjustProvider!.showSepia,
                              child: CustomSliderWidget(
                                value: adjustProvider!.sepia,
                                onChanged: (value) {
                                  setState(() {
                                    adjustProvider!.adjustImage(se: value);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          adjustProvider!.adjustImage(
                            b: 0.0,
                            c: 0.0,
                            s: 0.0,
                            h: 0.0,
                            se: 0.0,
                          );

                          setState(() {});
                        },
                        child: Text(
                          'RESET',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
      bottomNavigationBar: adjustProvider != null
          ? Container(
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
                        BottomButtonWidget(
                          isSelected: adjustProvider!.showBrightness,
                          icon: CupertinoIcons.brightness,
                          title: 'Brightness',
                          onTap: () {
                            adjustProvider!.showSlider(b: true);
                            setState(() {});
                          },
                        ),
                        BottomButtonWidget(
                          isSelected: adjustProvider!.showContrast,
                          icon: Icons.contrast,
                          title: 'Contrast',
                          onTap: () {
                            adjustProvider!.showSlider(c: true);
                            setState(() {});
                          },
                        ),
                        BottomButtonWidget(
                          isSelected: adjustProvider!.showSaturation,
                          icon: Icons.water_drop,
                          title: 'Saturation',
                          onTap: () {
                            adjustProvider!.showSlider(s: true);
                            setState(() {});
                          },
                        ),
                        BottomButtonWidget(
                          isSelected: adjustProvider!.showHue,
                          icon: Icons.filter_tilt_shift,
                          title: 'Hue',
                          onTap: () {
                            adjustProvider!.showSlider(h: true);
                            setState(() {});
                          },
                        ),
                        BottomButtonWidget(
                          isSelected: adjustProvider!.showSepia,
                          icon: Icons.motion_photos_on,
                          title: 'Sepia',
                          onTap: () {
                            adjustProvider!.showSlider(se: true);
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}
