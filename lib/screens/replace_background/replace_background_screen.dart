import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/button_with_image.dart';
import '../../shared/colors.dart';
import '../../shared/drawer.dart';
import '../../shared/shared.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';

class ReplaceBackgroundScreen extends StatefulWidget {
  const ReplaceBackgroundScreen({Key? key}) : super(key: key);

  @override
  State<ReplaceBackgroundScreen> createState() => _ReplaceBackgroundScreenState();
}

class _ReplaceBackgroundScreenState extends State<ReplaceBackgroundScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = TestHomeCubit.get(context);
    cubit.originalImage = null;
    cubit.backgroundImage = null;
    cubit.replaceImage=null;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);


    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text(
            "Replace Background",
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
              if(state is ReplaceBackgroundErrorState){
                showToast(text: state.error ?? "Something went wrong", state: ToastStates.WARNING);
              }
            },
            builder: (context,state){
              return Column(
                children: [
                  const Divider(height: 3,color: Colors.grey,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if(cubit.replaceImage == null) const Text("Original Image",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                        if(cubit.replaceImage == null) const SizedBox(height: 10,),


                         /// Original Image
                        if(cubit.replaceImage == null) InkWell(
                          onTap: (){
                            cubit.pickOriginalImage(false, context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .6,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: cubit.originalImage == null ? const Center(child: Icon(Icons.add,color: Colors.black,size: 40,)) :
                            Image.file(
                              cubit.originalImage!,
                              height: MediaQuery.of(context).size.height * .6,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        if(cubit.replaceImage == null) const SizedBox(height: 10,),

                        if(cubit.replaceImage == null) const Text("Background Image",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),),
                        if(cubit.replaceImage == null) const SizedBox(height: 10,),


                        /// Background Image
                        if(cubit.replaceImage == null)   InkWell(
                          onTap: (){
                            cubit.pickBackgroundImage(false, context);
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * .3,
                            width: MediaQuery.of(context).size.width * .6,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            child: cubit.backgroundImage == null ? const Center(child: Icon(Icons.add,color: Colors.black,size: 40,)) :
                            Image.file(
                              cubit.backgroundImage!,
                              height: MediaQuery.of(context).size.height * .6,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),


                        /// replaced Image
                        if(cubit.replaceImage != null) Image.network(cubit.replaceImage!,
                          height: MediaQuery.of(context).size.height * .7,
                          fit: BoxFit.fill,
                        ),

                        const SizedBox(height: 20,),


                        state is ReplaceBackgroundLoadingState ? myCircularIndicator() : InkWell(
                          onTap: (){
                            if(cubit.originalImage == null){
                              showToast(text: "Please select original image", state: ToastStates.WARNING);
                              return;
                            }
                            if(cubit.backgroundImage == null){
                              showToast(text: "Please select background image", state: ToastStates.WARNING);
                              return;
                            }
                            /// call replace background api here
                            cubit.replaceBackgroundImage(cubit.originalImage!, cubit.backgroundImage!);

                            //
                            // cubit.removeBackgroundImage(cubit.homeImage!);
                            //cubit.removeBackgroundImage( );
                          },
                          child: const ButtonWithImage(text: "Replace Background", image:'assets/images/eraser.png',
                            bgcolor: Colors.blue, textcolor: Colors.white,imagecolor: Colors.white,),
                        ),

                        const SizedBox(height: 20,),




                      ],
                    ),
                  ),

                ],
              );

            }),
        drawer: const MyDrawer()
    );
  }
}
