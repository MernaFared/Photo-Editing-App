import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import '../edit_photo/new_editing_photo.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';


import '../../shared/button_with_image.dart';
import '../../shared/drawer.dart';

class ApplyWatermarkScreen extends StatefulWidget {
  const ApplyWatermarkScreen({Key? key}) : super(key: key);

  @override
  State<ApplyWatermarkScreen> createState() => _ApplyWatermarkScreenState();
}

class _ApplyWatermarkScreenState extends State<ApplyWatermarkScreen> {

  double? thresholdValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = TestHomeCubit.get(context);
    cubit.homeImage = null;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text(
            "Apply Watermark",
            style: TextStyle(
                color: kBlackColor,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<TestHomeCubit,TestHomeStates>(
            listener: (context,state){
              if(state is ApplyWaterMarkErrorState){
                showToast(text: state.error ?? "Something went wrong", state: ToastStates.WARNING);
              }
            },
            builder: (context,state){
              return Container(
                height: height,
                width: width,
                child: Column(
                  children: [
                    const Divider(height: 3,color: Colors.grey,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              cubit.pickImage(false, context);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * .6,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                              ),
                              child: cubit.homeImage == null ? const Center(child: Icon(Icons.add,color: Colors.black,size: 40,)) :
                              Image.file(
                                cubit.homeImage!,
                                height: MediaQuery.of(context).size.height * .6,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),








                          const SizedBox(height: 20,),
                          state is ApplyWaterMarkLoadingState ? myCircularIndicator() : InkWell(
                            onTap: (){
                              if(cubit.homeImage == null){
                                showToast(text: "Please select image", state: ToastStates.WARNING);
                                return;
                              }


                               cubit.binarizeImage(cubit.homeImage!, thresholdValue!.toInt());


                            },
                            child: const ButtonWithImage(text: "Apply Watermark", image:'assets/images/eraser.png',
                              bgcolor: Colors.blue, textcolor: Colors.white,imagecolor: Colors.white,),
                          ),

                          const SizedBox(height: 20,),




                        ],
                      ),
                    ),

                  ],
                ),
              );

            }),
        drawer: const MyDrawer()
    );
  }
}
