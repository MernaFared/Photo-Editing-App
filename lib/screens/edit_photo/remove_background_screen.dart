import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/button_with_image.dart';
import '../../shared/default_button.dart';
import '../../shared/shared.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';


class RemoveBackground extends StatefulWidget {
  const RemoveBackground({Key? key}) : super(key: key);

  @override
  State<RemoveBackground> createState() => _RemoveBackgroundState();
}

class _RemoveBackgroundState extends State<RemoveBackground> {


  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        //leading: Container(),
        backgroundColor:Colors.black,
        actions: [
          TextButton(onPressed: (){      ///function

          },
              child: const Text('Reset',
              style:TextStyle( color: Colors.grey,
             fontSize: 18 ),))
        ],
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


                    state is RemoveBackgroundLoadingState ? myCircularIndicator() : InkWell(
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

                    const SizedBox(height: 20,),




                  ],
                ),
              ),

            ],
          );

        })

    );
  }
}
