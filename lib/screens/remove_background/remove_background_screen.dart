import 'package:flutter/material.dart';
import 'dart:convert'; // Import the dart:convert library
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/button_with_image.dart';
import '../../shared/colors.dart';
import '../../shared/drawer.dart';
import '../../shared/shared.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';

class RemoveBackgroundScreen extends StatefulWidget {
  const RemoveBackgroundScreen({Key? key}) : super(key: key);

  @override
  State<RemoveBackgroundScreen> createState() => _RemoveBackgroundScreenState();
}

class _RemoveBackgroundScreenState extends State<RemoveBackgroundScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = TestHomeCubit.get(context);
    cubit.homeImage = null;
    cubit.image = null;

  }

  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);


    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text(
            "Remove Background",
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
              if(state is RemoveBackgroundErrorState){
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
                      children: [
                        if(cubit.image == null) InkWell(
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
                        if(cubit.image != null) Image.network(cubit.image!,
                          height: MediaQuery.of(context).size.height * .6,
                          fit: BoxFit.fill,
                        ),

                        const SizedBox(height: 50,),


                        if(cubit.image == null) state is RemoveBackgroundLoadingState ? myCircularIndicator() : InkWell(
                          onTap: (){
                            if(cubit.homeImage == null){
                              showToast(text: "Please select image", state: ToastStates.WARNING);
                              return;
                            }

                            cubit.removeBackgroundImage(cubit.homeImage!);
                            //cubit.removeBackgroundImage( );
                          },
                          child: const ButtonWithImage(text: "Remove Background", image:'assets/images/eraser.png',
                            bgcolor: Colors.blue, textcolor: Colors.white,imagecolor: Colors.white,),
                        ),

                        if(cubit.image != null) InkWell(
                          onTap: (){


                          },
                          child: const ButtonWithImage(text: "Save", image:'assets/images/eraser.png',
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
