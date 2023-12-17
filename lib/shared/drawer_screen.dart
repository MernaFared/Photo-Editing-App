// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:merna/screens/home/profile/user_profile_screen.dart';
// import 'package:merna/shared/shared.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../cubit/app_cubit.dart';
// import '../screens/home/profile/profile_screen.dart';
// import '../screens/home/settings/settings_screen.dart';
// import '../screens/intro_screen/welcome_screen.dart';
// import '../screens/login/login_screen.dart';
// import 'colors.dart';
//
// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({Key? key}) : super(key: key);
//
//   @override
//   _DrawerScreenState createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     var cubit = AppCubit.get(context);
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       color: Colors.blueGrey,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 20,left: 25),
//         child: SingleChildScrollView(
//           child: Column(
//             //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Row(
//               //   children: [
//               //     CircleAvatar(
//               //       child: ClipRRect(
//               //         borderRadius: BorderRadius.circular(20),
//               //         child: const Image(
//               //           image: AssetImage('assets/images/appIcon.png'),
//               //           fit: BoxFit.cover,
//               //         ),
//               //       ),
//               //     ),
//               //     const SizedBox(width: 10,),
//               //     Text(
//               //       'Home Service'.tr(),
//               //       style: const TextStyle(
//               //           color: Colors.white,
//               //           fontSize: 22,
//               //           fontWeight: FontWeight.bold
//               //       ),
//               //     )
//               //   ],
//               // ),
//
//               const SizedBox(height: 25,),
//
//               Column(
//                 children: [
//
//                   SizedBox(height: height * .05,),
//
//                   /// My Account
//                   ListTile(
//                     leading: const Icon(Icons.person_outline),
//                     title: Text(
//                       'My Account'.tr(),
//                       style: const TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: (){
//                       if(userId == null){
//                         //Navigator.pop(context);
//                         navigateTo(context,  const WelcomeScreen());
//                       } else {
//                         //cubit.closeDrawer();
//                         navigateTo(context, const UserProfileScreen());
//                       }
//                     },
//                   ),
//
//                   /// Settings
//                   ListTile(
//                     leading: const Icon(Icons.settings),
//                     title: Text(
//                       'Settings'.tr(),
//                       style: const TextStyle(
//                           color: Colors.black54
//                       ),
//                     ),
//                     onTap: (){
//                       //cubit.closeDrawer();
//                       navigateTo(context, const SettingsScreen());
//                     },
//                   ),
//                   SizedBox(height: height * .05,),
//
//                   /// Logout
//                   if(userId != null) ListTile(
//                     leading: const Icon(Icons.logout),
//                     title: Text(
//                       'Log Out'.tr(),
//                       style: const TextStyle(
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
//                       // navigateAndFinish(context, const WelcomeScreen());
//                     },
//                   ),
//
//                   /// Login
//                   if(userId == null) ListTile(
//                     leading: const Icon(Icons.login_outlined),
//                     title: Text(
//                       'Log in'.tr(),
//                       style: const TextStyle(
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
//               const SizedBox(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
