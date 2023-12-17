import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/default_button.dart';
import '../../shared/styles.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  bool freeTrial = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// first container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xff1C1C1C),
                borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff3E3D40)
                        ),
                        child: const Text(
                          "Restore",
                          style: TextStyle(
                              color: Color(0xffA3A3A3),
                              fontSize: 16
                          ),
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                       InkWell(
                         onTap: (){
                           Navigator.pop(context);
                         },
                         child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Color(0xffA3A3A3),
                          child:
                          // IconButton( icon:const Icon(Icons.close,color: Color(0xff3E3D40),size:15,),onPressed:(){
                          //   Navigator.pop(context);
                          // } ,),
                          Icon(Icons.close,color: Color(0xff3E3D40),size: 15,),
                      ),
                       )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                    "Start Your\nMembership\nNow",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20,),



                  const Text(
                    "50% off an magic avatars",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "50% off an magic avatars",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "50% off an magic avatars",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "50% off an magic avatars",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            /// second container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xff1C1C1C),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Annual Plans",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffA5A5A5),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: const Color(0xffD95989)
                        ),
                        child: const Text(
                          "71% OFF",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "\$40 / year",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            /// third container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: const Color(0xff1C1C1C),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: [
                  const Text(
                    "7-Day free trial",
                    style: TextStyle(
                        color: kWhiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  CupertinoSwitch(
                    value: freeTrial,
                    onChanged: (value){
                      freeTrial = value;
                      setState(() {});
                    },
                    thumbColor: kWhiteColor,
                    activeColor: kBlueColor,
                    trackColor: const Color(0xff2A292E),


                  ),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Center(
              child: Text(
                "No Commitment. Cancel anytime",
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xff4C4C4C),
                ),
              ),
            ),
            /// continue button
            Padding(
              padding: const EdgeInsets.all(20),
              child: DefaultButton(
                bgColor: kBlueColor,
                text: "Continue",
                textStyle: KWhiteText,
                borderRadius: 10,
                onTap: (){},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
