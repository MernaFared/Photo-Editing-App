import 'package:flutter/material.dart';

import '../../../shared/button_with_image.dart';
import '../../../shared/colors.dart';
import '../../../shared/default_button.dart';
import '../../../shared/default_form_field.dart';
import '../../../shared/shared.dart';
import '../../../shared/styles.dart';
import '../../subscription/subscription_screen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:const Icon(Icons.close,color: Colors.black,), onPressed: () {
          Navigator.pop(context);
        },),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Sign Up',
          style: TextStyle(color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(height:4,color:Colors.grey.shade400),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30,),
                  const Text('Enter your first name to sign in or\ncreate account',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          backgroundColor:Colors.white,
                          borderColor: Colors.grey,
                          borderRadius: 10,
                          prefixIcon: const Icon(Icons.account_circle,color: Colors.grey,),
                          controller: firstNameController,
                          validatorFun: (String? value){
                            if (value!.isEmpty)
                            {
                              return "First Name is Required";
                            }
                          },

                          hintText: 'First Name',
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: CustomTextFormField(
                          backgroundColor:Colors.white,
                          borderColor: Colors.grey,
                          borderRadius: 10,
                          prefixIcon: const Icon(Icons.account_circle,color: Colors.grey,),
                          controller: lastNameController,
                          validatorFun: (String? value){
                            if (value!.isEmpty)
                            {
                              return "Last Name is Required";
                            }
                          },

                          hintText: 'Last Name',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  CustomTextFormField(
                    backgroundColor:Colors.white,
                    borderColor: Colors.grey,
                    borderRadius: 10,
                    prefixIcon: const Icon(Icons.email_outlined,color: Colors.grey,),
                    controller: emailController,
                    validatorFun: (String? value){
                      if (value!.isEmpty)
                      {
                        return "Email is Required";
                      }
                    },

                    hintText: 'Your Email',
                  ),
                  const SizedBox(height: 20,),
                  DefaultButton(
                    height: 60,
                    bgColor: kBlueColor,
                    text: "Sign Up",
                    textStyle: KWhiteText,
                    borderRadius: 10,
                    onTap: (){
                      navigateTo(context, const SubscriptionScreen());
                    },
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: Container(height: 1,color: Colors.grey,)) ,
                      const SizedBox(width: 10,),
                      const Text("or",style: TextStyle(color: Colors.black,fontSize: 18),),
                      const SizedBox(width: 10,),
                      Expanded(child: Container(height: 1,color: Colors.grey,)),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  const ButtonWithImage(
                    image:'assets/images/apple.png',
                    imagecolor: Colors.white,
                    text: 'Sign Up with Apple',
                    bgcolor: Colors.black,
                    textcolor: Colors.white,

                  ),

                  const SizedBox(height: 15,),
                  ButtonWithImage(
                    image:'assets/images/google.png',
                    text: 'Sign Up with Google',
                    bgcolor: Colors.grey.shade200,
                    textcolor: Colors.black,

                  ),
                  const SizedBox(height: 15,),
                  ButtonWithImage(
                    image:'assets/images/facebook2.png',
                    text: 'Sign Up with Facebook',
                    bgcolor: Colors.grey.shade200,
                    textcolor: Colors.black,

                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: Checkbox(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(width: 1.0, color: Color(0xffB8B6C2)),
                          ),
                          value: checkBoxValue,
                          checkColor: Colors.white,
                          activeColor: kBlueColor,
                          onChanged: (value){
                            setState(() {
                              checkBoxValue = value!;

                            });



                          },
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Text(
                        "I accept privacy policy",
                        style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 16
                        ),

                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have Account?',
                        style: TextStyle(color: Colors.grey[700],
                            fontSize: 18),
                      ),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: (){
                          navigateTo(context,RegisterScreen());
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),




                ],

              ),
            ),


          ],
        ),
      ),
    );
  }
}
