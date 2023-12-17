
import 'package:flutter/material.dart';
import '../../shared/colors.dart';
import '../../shared/shared.dart';
import '../../shared/styles.dart';
import '../auth/login/login.dart';
import '../subscription/subscription_screen.dart';
import 'Components/build_setting_widget.dart';

class UserSettingScreen extends StatelessWidget {
   const UserSettingScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: kGrayColor,
      appBar:AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: kWhiteColor ,
        title: const Text('Setting',
          style: KappbarBlackText ),
      ),
       body:SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Column( crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               const SizedBox(height: 20,),
               const Text('Profile',
               style: KBoldGrayText),
               const SizedBox(height: 10,),
               InkWell(
                 onTap: (){
                   navigateTo(context, LoginScreen());
                 },
                 child: const BuildSettingWidget(title: 'Sign in or Create Free Account',
                   style:TextStyle(
                     color: kBlue2Color,
                     fontSize: 18,

                   ),
                 ),
               ),
               const SizedBox(height: 70,),
               const Text('Subscription',
                   style: KBoldGrayText),
               const SizedBox(height: 10,),
               InkWell(
                 onTap: (){},
                 child:Container(
                   width: double.infinity,
                   padding: const EdgeInsets.all(15.0),
                   decoration: const BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(
                       topRight: Radius.circular(10),
                       topLeft: Radius.circular(10),
                     )
                   ),
                   child: const Column( crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text('Free Trial',
                       style: KBlackText),
                       SizedBox(height: 10,),
                       Text('Auto-Renewal:Mar 9, 2024',
                       style:KGrayText,),

                     ],
                   ),

                 )

               ),

               const SizedBox(height: 2,),
               InkWell(
                   onTap: (){},
                   child:Container(
                     width: double.infinity,
                     padding: const EdgeInsets.all(15.0),
                     decoration: const BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(
                           bottomRight: Radius.circular(10),
                           bottomLeft: Radius.circular(10),
                         )
                     ),
                     child: InkWell(
                       onTap: (){
                         navigateTo(context, SubscriptionScreen());
                       },
                       child: const Text('Manage Subscription',
                         style:TextStyle(
                         color: kBlue2Color,
                         fontSize: 18,


                       ),
                       ),
                     )

                   )

               ),
               const SizedBox(height: 70,),
               const Text('Subscription',
                   style: KBoldGrayText),
               const SizedBox(height: 10,),
               InkWell(
                 onTap: (){},
                 child: const BuildSettingWidget(title:'Appearance',
                   style:KBlackText,
                   showicon: true,
                 ),
               ),
               const SizedBox(height: 70,),
               const Text('Help Center',
                   style: KBoldGrayText),
               const SizedBox(height: 10,),
               InkWell(
                   onTap: (){},
                   child:Container(
                       width: double.infinity,
                       padding: const EdgeInsets.all(15.0),
                       decoration: const BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.only(
                             topRight: Radius.circular(10),
                             topLeft: Radius.circular(10),
                           )
                       ),
                     child: const Row(
                       children: [
                         Text('FAQ',
                           style: KBlackText,),
                         Expanded (child: SizedBox()),
                         Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                       ],
                     ),


                   )

               ),
               const SizedBox(height: 2,),
               InkWell(
                   onTap: (){},
                   child:Container(
                     width: double.infinity,
                     padding: const EdgeInsets.all(15.0),
                     decoration: const BoxDecoration(
                         color: Colors.white,

                     ),
                     child: const Row(
                       children: [
                         Text('Send Feedback',
                           style: KBlackText,),
                         Expanded (child: SizedBox()),
                         Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                       ],
                     ),

                   )

               ),
               const SizedBox(height: 2,),
               InkWell(
                   onTap: (){},
                   child:Container(
                     width: double.infinity,
                     padding: const EdgeInsets.all(15.0),
                     decoration: const BoxDecoration(
                       color: Colors.white,

                     ),
                     child: const Row(
                       children: [
                         Text("See What's New",
                           style: KBlackText,),
                         Expanded (child: SizedBox()),
                         Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                       ],
                     ),

                   )

               ),
               const SizedBox(height: 20,),
],
         ),
    ),
       ),
    );
  }
}
