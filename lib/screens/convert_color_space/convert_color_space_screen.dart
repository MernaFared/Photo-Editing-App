import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../shared/button_with_image.dart';
import '../../shared/colors.dart';
import '../../shared/drawer.dart';
import '../../shared/shared.dart';
import '../home/cubit/home_cubit.dart';
import '../home/cubit/home_states.dart';

class ConvertColorSpaceScreen extends StatefulWidget {
  const ConvertColorSpaceScreen({Key? key}) : super(key: key);

  @override
  State<ConvertColorSpaceScreen> createState() => _ConvertColorSpaceScreenState();
}

class _ConvertColorSpaceScreenState extends State<ConvertColorSpaceScreen> {

  String? colorSpace;

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
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xffF7F7F7),
          title: const Text(
            "Convert Color",
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
              if(state is ConvertColorSpaceErrorState){
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
                        const SizedBox(height: 20,),

                        /// Direction Drop Down
                        DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            isExpanded: true,
                            hint: const Text(
                              'Select color Space',
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            items: ['RGB','HSV','LAB']
                                .map((item) =>
                                DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                        color: Colors.black
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                                .toList(),
                            value: colorSpace,
                            onChanged: (String? value) {
                              setState(() {
                                colorSpace = value;
                              });

                            },
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 25,
                            ),
                            iconSize: 14,
                            iconEnabledColor: Colors.grey.shade500,
                            iconDisabledColor: Colors.grey.shade500,
                            buttonHeight: 55,
                            buttonWidth: double.infinity,
                            buttonPadding: const EdgeInsets.only(left: 16, right: 16),
                            buttonDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.grey.shade300,
                            ),
                            buttonElevation: 0,
                            itemHeight: 40,
                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                            dropdownMaxHeight: 200,
                            dropdownWidth: 360,
                            dropdownPadding: null,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: kGrayColor,
                            ),
                            dropdownElevation: 8,
                            scrollbarRadius: const Radius.circular(40),
                            scrollbarThickness: 6,
                            scrollbarAlwaysShow: true,
                            offset: const Offset(-10, 0),
                          ),
                        ),

                        const SizedBox(height: 20,),
                        state is ConvertColorSpaceLoadingState ? myCircularIndicator() : InkWell(
                          onTap: (){
                            if(cubit.homeImage == null){
                              showToast(text: "Please select image", state: ToastStates.WARNING);
                              return;
                            }
                            if(colorSpace == null){
                              showToast(text: "Please select color space value", state: ToastStates.WARNING);
                              return;
                            }

                            cubit.convertColorSpace(cubit.homeImage!, colorSpace!);


                          },
                          child: const ButtonWithImage(text: "Convert Color Space", image:'assets/images/eraser.png',
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
