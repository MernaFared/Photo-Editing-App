// // ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, implementation_imports
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:merna/screens/home/profile/user_profile_screen.dart';
// import '../cubit/app_cubit.dart';
// import '../screens/home/profile/profile_screen.dart';
// import '../screens/home/settings/settings_screen.dart';
// import '../screens/intro_screen/welcome_screen.dart';
// import '../screens/login/login_screen.dart';
// import '../shared/shared.dart';
// import '../shared/styles.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     var cubit = AppCubit.get(context);
//
//     return Theme(
//       data: Theme.of(context).copyWith(
//         canvasColor: Colors.white, //This will change the drawer background to blue.
//         //other styles
//       ),
//       child: Container(
//         height: height,
//         width: width * .6,
//         child: Card(
//           elevation: 5,
//           child: Stack(
//             children: [
//               Column(
//                 children: [
//                   SizedBox(height:  height * .15,),
//                   if(userId != null)CircleAvatar(
//                     radius: 40,
//                     backgroundImage:  AssetImage(
//                         'assets/images/person.jpg'
//                     )
//                   ),
//                   SizedBox(height: height * .01,),
//                   Text(
//                     "User Name",
//                     style: kBoldBlackText,
//                   ),
//                   SizedBox(height: height * .01,),
//                   Text(
//                     "cubit.userDataModel.email",
//                     style: kSmallGrayText,
//                   ),
//                   SizedBox(height: height * .05,),
//
//
//                   /// My Account
//                   ListTile(
//                     leading: Icon(Icons.person_outline),
//                     title: Text(
//                       'My Account'.tr(),
//                       style: TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: (){
//                       if(userId == null){
//                         Navigator.pop(context);
//                         navigateTo(context, WelcomeScreen());
//                       } else {
//                         Navigator.pop(context);
//                         navigateTo(context, UserProfileScreen());
//                       }
//                     },
//                   ),
//
//
//                   /// Settings
//                   ListTile(
//                     leading: Icon(Icons.settings),
//                     title: Text(
//                       'Settings'.tr(),
//                       style: TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: (){
//                       Navigator.pop(context);
//                       navigateTo(context, SettingsScreen());
//                     },
//                   ),
//                   SizedBox(height: height * .05,),
//
//                   /// Logout
//                   if(userId != null) ListTile(
//                     leading: Icon(Icons.logout),
//                     title: Text(
//                       'Log Out'.tr(),
//                       style: TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: () async{
//                       // SharedPreferences preferences = await SharedPreferences.getInstance();
//                       // await preferences.remove('customerID');
//                       //
//                       // cubit.userDataModel = null;
//                       // userId = null;
//                       //
//                       // navigateAndFinish(context, WelcomeScreen());
//                     },
//                   ),
//
//                   /// Login
//                   if(userId == null) ListTile(
//                     leading: Icon(Icons.login_outlined),
//                     title: Text(
//                       'Log in'.tr(),
//                       style: TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: (){
//                       Navigator.pop(context);
//                       navigateTo(context, LoginScreen());
//                     },
//                   )
//                 ],
//               ),
//               Positioned(
//                   top: height * .06,
//                   left: context.locale.languageCode == 'en' ? width * .03 : null,
//                   right: context.locale.languageCode == 'ar' ? width * .03 : null,
//                   child: IconButton(
//                     icon: Icon(Icons.close,color: Colors.red,),
//                     onPressed: (){
//                       Navigator.pop(context);
//                     },
//                   )
//               )
//             ],
//           )
//         ),
//       ),
//     );
//   }
// }
