import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_editing/screens/home/cubit/home_cubit.dart';
import 'package:photo_editing/screens/welcome_screen.dart';


import 'core/cubits/adjust_cubit/adjust_cubit.dart';
import 'core/cubits/image_provide_cubit/image_provide_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => TestHomeCubit()),
        BlocProvider(create: (BuildContext context) => ImageProviderCubit()),
        BlocProvider(create: (BuildContext context) => AdjustCubit()),

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Photo Editing',
          home: WelcomeScreen()
      ),
    );
  }
}

