import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/cubits/image_provide_cubit/image_provide_cubit.dart';
import '../../core/cubits/image_provide_cubit/image_provide_states.dart';
import '../../core/helper/app_image_picker.dart';
import '../../shared/bottom_button_widget.dart';
import '../../shared/default_button.dart';
import '../../shared/shared.dart';
import 'adjust/presentation/ui/adjust_screen.dart';
import 'components/build_magic_retouch_content.dart';
import 'crop/presentation/ui/crop_screen.dart';
import 'filter/presentation/ui/filter_screen.dart';

class NewEditingPhoto extends StatefulWidget {
  final File image;
  const NewEditingPhoto({Key? key, required this.image}) : super(key: key);

  @override
  State<NewEditingPhoto> createState() => _NewEditingPhotoState();
}

class _NewEditingPhotoState extends State<NewEditingPhoto> {
  bool showMagic = true;
  bool showSmart = false;

  Uint8List? convertedImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(
    );
    var cubit = ImageProviderCubit.get(context);
    //cubit.image=null;

    convertedImage = cubit.convertFileToUnit8List(widget.image);
    cubit.onChangeImage(convertedImage!);

  }
   @override
  Widget build(BuildContext context) {
    var cubit = ImageProviderCubit.get(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        }  , icon: const Icon(Icons.arrow_back_ios)),
        centerTitle: true,
        title:
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(onPressed: (){}  , icon: const Icon(Icons.settings_backup_restore)),
            const SizedBox(width: 5,),
            IconButton(onPressed: (){}  , icon: const Icon(Icons.settings_backup_restore)),
            const SizedBox(width: 5,),
            IconButton(onPressed: (){}  , icon: const Icon(Icons.settings_backup_restore)),

          ],
        ),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: DefaultButton(
            text:'Save' ,
            textStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
            width: 100,
            height: 40,
            bgColor: Colors.blue,
            borderRadius: 8,

            onTap: (){
              // AppImagePicker(source: ImageSource.gallery).pick(
              //   onPick: (File? image) {
              //     if (image != null) {
              //       cubit.onChangeImageFile(image);
              //     }
              //   },
              // );
            },

          ),
        )],
      ),
      body: BlocConsumer<ImageProviderCubit,ImageProviderStates>(
        listener: (context,state){},
        builder: (context,state){
          return Column(
            children: [
              Divider(
                height: 4,
                color: Colors.grey.shade200,
              ),
              // Image.asset('assets/images/rmv2.jpeg',
              //   height: MediaQuery.of(context).size.height * .5,
              //   width: MediaQuery.of(context).size.width * .8,
              //   fit: BoxFit.fitHeight,
              // ),

              Container(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width * .8,
                color: Colors.grey.shade200,
                child:  Image.memory(
                  convertedImage!,
                 // height: MediaQuery.of(context).size.height * .5,
                  //width: MediaQuery.of(context).size.width * .8,
                  fit: BoxFit.fill,
                ),
              ),

              const SizedBox(height: 20,),
              // Row(
              //   children: [
              //     const SizedBox(width: 20,),
              //     TextButton(onPressed: (){
              //       setState(() {
              //         showMagic = true;
              //         showSmart = false;
              //       });
              //     }, child: Text(
              //       "Magic Retouch",
              //       style: TextStyle(
              //           color: showMagic == true ? Colors.white : Colors.grey,
              //           fontWeight: showMagic == true ? FontWeight.bold : null,
              //           fontSize: showMagic == true ? 18 : 16
              //       ),
              //     ),
              //     ),
              //     TextButton(onPressed: (){
              //       setState(() {
              //         showMagic = false;
              //         showSmart = true;
              //       });
              //     }, child: Text(
              //       "Smart Adjust",
              //       style: TextStyle(
              //           color: showSmart == true ? Colors.white : Colors.grey,
              //           fontWeight: showSmart == true ? FontWeight.bold : null,
              //           fontSize: showSmart == true ? 18 : 16
              //       ),
              //     ),
              //     ),
              //   ],
              // ),
              //SizedBox(height: 10,),
              /// magic retouch content
              //if(showMagic == true) const BuildMagicRetouchContent(),

              /// smart adjust content
              // if(showSmart == true) const Column(
              //   children: [
              //     Text("Smart",
              //       style: TextStyle(
              //           color: Colors.white
              //       ),),
              //   ],
              // ),


              // const SizedBox(height:10 ,),
              // Divider(
              //   height: 4,
              //   color: Colors.grey.shade200,
              // ),
              //const Expanded(child: BuildBottomActions()),


            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          width: double.infinity,
          height: 50,
          color: Colors.black,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BottomButtonWidget(
                  icon: CupertinoIcons.crop_rotate,
                  title: 'Crop',
                  onTap: () {
                    navigateTo(context, const CropScreen());
                   // Navigator.pushNamed(context, '/crop');
                  },
                ),
                BottomButtonWidget(
                  icon: Icons.filter_vintage_outlined,
                  title: 'Filters',
                  onTap: () {
                    navigateTo(context, const FilterScreen());
                  },
                ),
                BottomButtonWidget(
                  icon: Icons.tune,
                  title: 'Adjust',
                  onTap: () {
                    navigateTo(context, const AdjustScreen());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
