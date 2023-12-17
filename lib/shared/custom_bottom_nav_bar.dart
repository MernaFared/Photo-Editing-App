// // ignore_for_file: implementation_imports, must_be_immutable
//
// import 'package:easy_localization/src/public_ext.dart';
// import 'package:flutter/material.dart';
// import 'package:merna/screens/home/main_screen/main_screen.dart';
// import '../screens/home/settings/settings_screen.dart';
// import '../shared/colors.dart';
// import '../shared/shared.dart';
//
// class CustomBottomNavBar extends StatefulWidget {
//   int selectedIndex = 0;
//   CustomBottomNavBar({Key? key, this.selectedIndex = 0}) : super(key: key);
//
//   @override
//   _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
// }
//
// class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
//
//   void _onItemTapped(int index) {
//
//     /// Main screen (index = 0) Accepted Requests
//     if(index == 0) {
//       navigateAndFinish(context, const MainScreen());
//     }
//
//     /// New Tasks screen (index = 1)
//     if(index == 1) {
//       navigateAndFinish(context, const MainScreen());
//     }
//     /// Completed Requests screen (index = 2)
//     if(index == 2) {
//       navigateAndFinish(context, const MainScreen());
//     }
//
//     /// Settings screen (index = 3)
//     if(index == 3) {
//       navigateTo(context, const SettingsScreen());
//
//     }
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Theme(
//       data: Theme.of(context).copyWith(
//         // sets the background color of the `BottomNavigationBar`
//         canvasColor: Colors.white,
//         // sets the active color of the `BottomNavigationBar` if `Brightness` is light
//         //primaryColor: Colors.red,
//
//       ),
//       child: ClipRRect(
//         borderRadius:const BorderRadius.only(
//           topLeft: Radius.circular(30.0),
//           topRight: Radius.circular(30.0),
//         ),
//         child: BottomNavigationBar(
//
//           backgroundColor: Colors.white,
//           type: BottomNavigationBarType.shifting,
//           currentIndex:  widget.selectedIndex,
//           selectedItemColor: kMainColor,
//           unselectedItemColor: const Color(0xff9B9B9B),
//           //selectedLabelStyle: TextStyle(color: Color(0xff40304D),fontSize: 12),
//           showSelectedLabels: false,
//
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   padding: widget.selectedIndex == 0 ? const EdgeInsets.all(8) : null,
//                   decoration: widget.selectedIndex == 0 ? BoxDecoration(
//                     color: kSecondColor,
//                     borderRadius: BorderRadius.circular(30)
//                   ) : null,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                        Icons.home,
//                         color: widget.selectedIndex == 0 ? kMainColor : const Color(0xff9B9B9B),
//                       ),
//                       if(widget.selectedIndex == 0)  Text(
//                         'Home'.tr(),
//                         style: const TextStyle(
//                           fontSize: 11,
//                           color: kMainColor
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               label: 'Home'.tr(),
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   padding: widget.selectedIndex == 1 ? const EdgeInsets.all(8) : null,
//                   decoration: widget.selectedIndex == 1 ? BoxDecoration(
//                       color: kSecondColor,
//                       borderRadius: BorderRadius.circular(30)
//                   ) : null,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.task_outlined,
//                         color: widget.selectedIndex == 1 ? kMainColor : const Color(0xff9B9B9B),
//                       ),
//                       if(widget.selectedIndex == 1)  Text(
//                         'New'.tr(),
//                         style: const TextStyle(
//                             fontSize: 11,
//                             color: kMainColor
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               label: 'New'.tr(),
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   padding: widget.selectedIndex == 2 ? const EdgeInsets.all(8) : null,
//                   decoration: widget.selectedIndex == 2 ? BoxDecoration(
//                       color: kSecondColor,
//                       borderRadius: BorderRadius.circular(30)
//                   ) : null,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.task_alt_rounded,
//                         color: widget.selectedIndex == 2 ? kMainColor : const Color(0xff9B9B9B),
//                       ),
//
//                       if(widget.selectedIndex == 2)  Text(
//                         'Completed'.tr(),
//                         style: const TextStyle(
//                             fontSize: 11,
//                             color: kMainColor
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               label: 'Completed'.tr(),
//             ),
//             BottomNavigationBarItem(
//               icon: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 10),
//                 child: Container(
//                   padding: widget.selectedIndex == 3 ? const EdgeInsets.all(8) : null,
//                   decoration: widget.selectedIndex == 3 ? BoxDecoration(
//                       color: kSecondColor,
//                       borderRadius: BorderRadius.circular(30)
//                   ) : null,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Icon(
//                         Icons.settings,
//                         color: widget.selectedIndex == 3 ? kMainColor : const Color(0xff9B9B9B),
//                       ),
//                       if(widget.selectedIndex == 3)  Text(
//                         'Settings'.tr(),
//                         style: const TextStyle(
//                             fontSize: 11,
//                             color: kMainColor
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               label: 'Settings'.tr(),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
