
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/my_custom_bottom_nav_bar.dart';
import 'cubit/home_cubit.dart';
import 'cubit/home_states.dart';

class TestHomeLayout extends StatefulWidget {
  const TestHomeLayout({Key? key}) : super(key: key);

  @override
  State<TestHomeLayout> createState() => _TestHomeLayoutState();
}

class _TestHomeLayoutState extends State<TestHomeLayout> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit = TestHomeCubit.get(context);
    cubit.bodyScreenIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    var cubit = TestHomeCubit.get(context);
    return BlocConsumer<TestHomeCubit,TestHomeStates>(
        builder: (context,state){
          return Scaffold(
            body: cubit.bodyScreens[cubit.bodyScreenIndex],
            bottomNavigationBar: const MyCustomBottomNavBar(),
          );
        },
        listener: (context,state){}
    );
  }
}
