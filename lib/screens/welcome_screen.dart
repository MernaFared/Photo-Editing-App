import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_editing/screens/user_setting/user_setting_screen.dart';
import '../shared/colors.dart';
import '../shared/default_button.dart';
import '../shared/styles.dart';
import 'home/home_layout.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
              "assets/images/welcome.png",

            ),
            fit: BoxFit.fill
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                      CupertinoPageRoute(builder: (context) => const UserSettingScreen()),
                    );

                  },
                  child: const Text(
                    "Skip",
                    style: KWhiteText,
                  )
              ),
            ),
            const Expanded(child: SizedBox(height: 50,)),



            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pixel Free Api",
                    style: KBoldBWhiteText,
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Create personalized, impressive avatars with the help of powerful AI technology.",
                    style: KMediumWhiteText

                  ),
                  const SizedBox(height: 30,),
                  DefaultButton(
                    bgColor: kBlueColor,
                    text: "Continue",
                    textStyle: KButtonTextStyle,
                    borderRadius: 15,
                    onTap: (){
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (context) =>  const TestHomeLayout()),
                      );

                    },
                  ),
                  const SizedBox(height: 20,),
                  // Container(
                  //   width: width,
                  //   padding: EdgeInsets.all(12),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(8),
                  //       topRight: Radius.circular(8),
                  //     )
                  //   ),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Free Trial",
                  //         style: KBlackText,
                  //       ),
                  //       SizedBox(height: 2,),
                  //       Text(
                  //         "Free Trial",
                  //         style: KBlackText,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 20,)

                ],
              ),
            )
          ],
        ),
      )

    );
  }
}


/*

 /// images
                Row(
                  children: [
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
                      child: Container(
                        width: 141.59,
                        height: 141.59,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/142x142"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
                      child: Container(
                        width: 141.59,
                        height: 141.59,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/142x142"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
                      child: Container(
                        width: 141.59,
                        height: 141.59,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: NetworkImage("https://via.placeholder.com/142x142"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

 */


// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: 428,
//           height: 926,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(color: Colors.white),
//           child: Stack(
//             children: [
//               Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                   width: 428,
//                   height: 51.58,
//                   padding: const EdgeInsets.only(
//                     top: 15.36,
//                     left: 29.30,
//                     right: 28.86,
//                     bottom: 13.17,
//                   ),
//                   clipBehavior: Clip.antiAlias,
//                   decoration: const BoxDecoration(),
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Container(
//                           height: double.infinity,
//                           decoration: ShapeDecoration(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(26.34),
//                             ),
//                           ),
//                           child: const Row(
//                             mainAxisSize: MainAxisSize.min,
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               SizedBox(
//                                 width: 59.26,
//                                 height: 21.95,
//                                 child: Text(
//                                   '9:42',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 17,
//                                     fontFamily: 'SF Pro Text',
//                                     fontWeight: FontWeight.w700,
//                                     height: 1.29,
//                                     letterSpacing: -0.41,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 84.94,
//                         height: 14.27,
//                         child: Stack(
//                           children: [
//                             Positioned(
//                               left: 54.87,
//                               top: 0,
//                               child: Container(
//                                 width: 30.07,
//                                 height: 14.27,
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               left: 28.53,
//                               top: 1.10,
//                               child: Container(
//                                 width: 18.66,
//                                 height: 12.99,
//                                 decoration: const BoxDecoration(
//                                   image: DecorationImage(
//                                     image: NetworkImage("https://via.placeholder.com/19x13"),
//                                     fit: BoxFit.fill,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 0,
//                 top: 887,
//                 child: Container(
//                   width: 428,
//                   height: 38.81,
//                   child: Row(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 428,
//                         height: 38.81,
//                         padding: const EdgeInsets.only(
//                           top: 23.72,
//                           left: 138.90,
//                           right: 137.77,
//                           bottom: 9.44,
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 151.32,
//                               height: 5.65,
//                               decoration: ShapeDecoration(
//                                 color: Colors.black,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(112.93),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 left: 363,
//                 top: 72,
//                 child: Text(
//                   'Skip',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontFamily: 'SF Pro Text',
//                     fontWeight: FontWeight.w400,
//                     height: 0.89,
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 left: 18,
//                 top: 699,
//                 child: SizedBox(
//                   width: 381,
//                   child: Text(
//                     'Watch your movie come alive with the perfect sync of music and your videos',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontFamily: 'SF Pro Text',
//                       fontWeight: FontWeight.w400,
//                       height: 1.33,
//                     ),
//                   ),
//                 ),
//               ),
//               const Positioned(
//                 left: 18,
//                 top: 494,
//                 child: SizedBox(
//                   width: 381,
//                   child: Text(
//                     'Let\nit sync \nto the best',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 52,
//                       fontFamily: 'SF Pro Text',
//                       fontWeight: FontWeight.w700,
//                       height: 0.75,
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 18,
//                 top: 768,
//                 child: Container(
//                   width: 392,
//                   height: 56,
//                   child: Stack(
//                     children: [
//                       Positioned(
//                         left: 0,
//                         top: 0,
//                         child: Container(
//                           width: 392,
//                           height: 56,
//                           decoration: ShapeDecoration(
//                             color: const Color(0xFF0A84FF),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                         ),
//                       ),
//                       const Positioned(
//                         left: 160,
//                         top: 23,
//                         child: Text(
//                           'Continue',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontFamily: 'SF Pro Text',
//                             fontWeight: FontWeight.w700,
//                             height: 1,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               /// images
//               Positioned(
//                 left: 54.53,
//                 top: 236,
//                 child: Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
//                   child: Container(
//                     width: 141.59,
//                     height: 141.59,
//                     decoration: ShapeDecoration(
//                       image: const DecorationImage(
//                         image: NetworkImage("https://via.placeholder.com/142x142"),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: -92.27,
//                 top: 268,
//                 child: Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
//                   child: Container(
//                     width: 141.59,
//                     height: 141.59,
//                     decoration: ShapeDecoration(
//                       image: const DecorationImage(
//                         image: NetworkImage("https://via.placeholder.com/142x142"),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 201.32,
//                 top: 207,
//                 child: Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
//                   child: Container(
//                     width: 141.59,
//                     height: 141.59,
//                     decoration: ShapeDecoration(
//                       image: const DecorationImage(
//                         image: NetworkImage("https://via.placeholder.com/142x142"),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: 348.12,
//                 top: 179,
//                 child: Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(-0.20),
//                   child: Container(
//                     width: 141.59,
//                     height: 141.59,
//                     decoration: ShapeDecoration(
//                       image: const DecorationImage(
//                         image: NetworkImage("https://via.placeholder.com/142x142"),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Positioned(
//                 left: -11.51,
//                 top: 190.43,
//                 child: Transform(
//                   transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(0.05),
//                   child: Container(
//                     width: 645.93,
//                     height: 356.61,
//                     child: Stack(children: [
//
//                     ]),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
