import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/cubits/image_provide_cubit/image_provide_cubit.dart';
import '../../../../../core/cubits/image_provide_cubit/image_provide_states.dart';
import '../../../../../core/new_shared/custom_app_bar_widget.dart';
import '../../data/local/filter_data.dart';


class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late ImageProviderCubit imageProvider;

  //ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    imageProvider = ImageProviderCubit.get(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: 'Filters',
        actionIcon: CupertinoIcons.checkmark_alt,
        actionPressed: () async {
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
      body: Center(
          child: BlocConsumer<ImageProviderCubit,ImageProviderStates>(
            listener: (context,state){},
            builder: (context,state){
              if (imageProvider.currentImage != null) {
                return ColorFiltered(
                  colorFilter: ColorFilter.matrix(imageProvider.currentFilter),
                  child: Image.memory(imageProvider.currentImage!),
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
            height: 95,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: FilterData.filterList.length,
              itemBuilder: (context, index) {
                return BlocConsumer<ImageProviderCubit,ImageProviderStates>(
                    builder: (context,state){
                      if (imageProvider.currentImage != null) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: InkWell(
                            onTap: () {
                              imageProvider.onChangeFilter(
                                FilterData.filterList[index].matrix,
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: FittedBox(
                                    fit: BoxFit.fill,
                                    child: ColorFiltered(
                                      colorFilter: ColorFilter.matrix(
                                        FilterData.filterList[index].matrix,
                                      ),
                                      child: Image.memory(
                                        imageProvider.currentImage!,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  FilterData.filterList[index].filterName,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    },
                    listener: (context,state){}
                );



                //   Consumer<AppImageProvider>(
                //   builder: (context, state, child) {
                //     if (state.currentImage != null) {
                //       return Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 10.0),
                //         child: InkWell(
                //           onTap: () {
                //             state.onChangeFilter(
                //               FilterData.filterList[index].matrix,
                //             );
                //           },
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               SizedBox(
                //                 height: 60,
                //                 width: 60,
                //                 child: FittedBox(
                //                   fit: BoxFit.fill,
                //                   child: ColorFiltered(
                //                     colorFilter: ColorFilter.matrix(
                //                       FilterData.filterList[index].matrix,
                //                     ),
                //                     child: Image.memory(
                //                       state.currentImage!,
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //               const SizedBox(height: 2),
                //               Text(
                //                 FilterData.filterList[index].filterName,
                //                 textAlign: TextAlign.center,
                //                 maxLines: 1,
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodySmall
                //                     ?.copyWith(
                //                       color: Colors.white,
                //                       fontSize: 10,
                //                     ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       );
                //     } else {
                //       return const CircularProgressIndicator.adaptive();
                //     }
                //   },
                // );
              },
            ),
          ),
        ),
      ),
    );
  }
}
