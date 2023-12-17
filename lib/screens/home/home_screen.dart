import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/colors.dart';
import '../../shared/default_button.dart';
import '../../shared/drawer.dart';
import '../../shared/shared.dart';
import '../edit_photo/new_editing_photo.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_states.dart';

class TestHomeScreen extends StatefulWidget {
  const TestHomeScreen({Key? key}) : super(key: key);

  @override
  State<TestHomeScreen> createState() => _TestHomeScreenState();
}

class _TestHomeScreenState extends State<TestHomeScreen> {
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
          "Photos",
          style: TextStyle(
            color: kBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<TestHomeCubit,TestHomeStates>(
        listener: (context,state){},
        builder: (context,state){
          return Column(
            children: [
              /// white container
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GridView.builder(
                          itemCount: cubit.myImages.length + 1, //5

                          itemBuilder: (context, index){
                            if(index == 0){
                              return InkWell(
                                onTap: (){
                                  cubit.pickMultiImage(context);
                                },
                                child: Container(
                                  height: 120,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(5)
                                  ),
                                  child: const Center(child: Icon(Icons.add,color: Colors.black,size: 40,)),
                                ),
                              );

                            } else {
                              return  Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                child: InkWell(
                                  onTap: (){
                                    navigateTo(context, NewEditingPhoto(
                                      image: cubit.myImages[index - 1],
                                    ));
                                  },
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade300,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        cubit.myImages[index - 1],
                                        fit: BoxFit.fill,
                                      ),
                                    ),


                                  ),
                                ),
                              );
                            }
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                        ),
                      ),





                      /// image container
                      // Row(
                      //   children: [
                      //     InkWell(
                      //       onTap: (){
                      //         cubit.pickImage(false, context);
                      //       },
                      //       child: Container(
                      //         height: 120,
                      //         width: 120,
                      //         decoration: BoxDecoration(
                      //             color: Colors.grey.shade300,
                      //             borderRadius: BorderRadius.circular(5)
                      //         ),
                      //         child: const Center(child: Icon(Icons.add,color: Colors.black,size: 40,)),
                      //       ),
                      //     ),
                      //     const SizedBox(width: 20,),
                      //
                      //     if(cubit.homeImage != null) Container(
                      //       height: 120,
                      //       width: 120,
                      //       decoration: BoxDecoration(
                      //           color: Colors.grey.shade300,
                      //           borderRadius: BorderRadius.circular(5)
                      //       ),
                      //       child: ClipRRect(
                      //         borderRadius: BorderRadius.circular(5),
                      //         child: Image.file(
                      //           cubit.homeImage!,
                      //           fit: BoxFit.fill,
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //   ],
                      // ),

                     if(cubit.myImages.isEmpty) Column(
                        children: [
                          const SizedBox(height: 80,),
                          const Center(
                            child: Text(
                              "Let's Go!",
                              style: TextStyle(
                                  color: kBlackColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 8,),
                          Center(
                            child: Text(
                              "Just add your photo here\nand let us do our magic",
                              style: TextStyle(
                                color: kBlackColor.withOpacity(.7),
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      )


                    ],
                  ),

                ),
              ),
              const SizedBox(height: 20,),
              /// button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DefaultButton(
                  bgColor: kBlueColor,
                  borderRadius: 10,
                  text: "sda",
                  onTap: (){},
                ),
              ),
              //SizedBox(height: 20,),
            ],
          );
        },
      ),
      drawer: const MyDrawer()
    );
  }
}
