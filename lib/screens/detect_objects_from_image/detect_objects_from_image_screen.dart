import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/button_with_image.dart';
import '../../shared/colors.dart';
import '../../shared/drawer.dart';
import '../../shared/shared.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';

class DetectObjectsFromImageScreen extends StatefulWidget {
  const DetectObjectsFromImageScreen({Key? key}) : super(key: key);

  @override
  State<DetectObjectsFromImageScreen> createState() => _DetectObjectsFromImageScreenState();
}

class _DetectObjectsFromImageScreenState extends State<DetectObjectsFromImageScreen> {

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


    return Scaffold(
        backgroundColor: const Color(0xffF7F7F7),
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text(
            "Detect Objects",
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
              if(state is DetectObjectsErrorState){
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
                        const SizedBox(height: 50,),


                        state is DetectObjectsLoadingState ? myCircularIndicator() : InkWell(
                          onTap: (){
                            if(cubit.homeImage == null){
                              showToast(text: "Please select image", state: ToastStates.WARNING);
                              return;
                            }

                            cubit.detectObjectsFromImage(cubit.homeImage!);
                            //cubit.removeBackgroundImage( );
                          },
                          child: const ButtonWithImage(text: "Detect Objects", image:'assets/images/eraser.png',
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
