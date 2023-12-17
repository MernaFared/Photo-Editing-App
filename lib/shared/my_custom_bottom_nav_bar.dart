import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/home/cubit/home_cubit.dart';
import '../screens/home/cubit/home_states.dart';




class MyCustomBottomNavBar extends StatefulWidget {
  const MyCustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyCustomBottomNavBar> createState() => _MyCustomBottomNavBarState();
}

class _MyCustomBottomNavBarState extends State<MyCustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);
    return BlocConsumer<TestHomeCubit,TestHomeStates>(
        builder: (context,state){
          return Container( //bottom navigation bar on scaffold
            color: const Color(0xffF7F7F7),
            height: 80,
            //shape: const CircularNotchedRectangle(), //shape of notch
            //notchMargin: 10, //notche margin between floating button and bottom appbar
            child: Padding(
              padding:  const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
              child: Row( //children inside bottom appbar
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// home (Photos)
                  InkWell(
                    onTap: (){
                      cubit.bodyScreenIndex = 0;
                      cubit.changeState();
                    },
                    child: Column(
                      children: [
                        Icon(
                            Icons.image_outlined,
                          color: cubit.bodyScreenIndex == 0 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "Photos",
                          style: TextStyle(
                            fontSize: 16,
                            color: cubit.bodyScreenIndex == 0 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                          ),
                        )
                      ],
                    ),




                  ),

                  /// home (Videos)
                  InkWell(
                    onTap: (){
                      cubit.bodyScreenIndex = 1;
                      cubit.changeState();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.video_collection_sharp,
                          color: cubit.bodyScreenIndex == 1 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "Videos",
                          style: TextStyle(
                            fontSize: 16,
                            color: cubit.bodyScreenIndex == 1 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                          ),
                        )
                      ],
                    ),


                  ),

                  /// home (Settings)
                  InkWell(
                    onTap: (){
                      cubit.bodyScreenIndex = 2;
                      cubit.changeState();
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.settings,
                          color: cubit.bodyScreenIndex == 2 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                        ),
                        const SizedBox(height: 3,),
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontSize: 16,
                            color: cubit.bodyScreenIndex == 2 ? const Color(0xff0A84FF) : const Color(0xffC2C2C2),
                          ),
                        )
                      ],
                    ),


                  ),


                ],
              ),
            ),
          );
        },
        listener: (context,state){}
    );
  }
}
