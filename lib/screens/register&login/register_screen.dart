import 'package:flutter/material.dart';

import '../../shared/colors.dart';
import '../../shared/default_button.dart';
import '../../shared/shared.dart';
import '../../shared/styles.dart';
import '../auth/login/login.dart';
import '../subscription/subscription_screen.dart';
import 'components/square_tile.dart';
import 'components/text_filed.dart';


class RegisterScreen extends StatefulWidget {
    const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{

  final usernameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  bool securePassword = true;
  bool secureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Colors.grey.shade300,
       body:
       SingleChildScrollView(
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: Column(
             //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150,),
               const Center(
                   child:
               Text('Sign UP',
                 style:  TextStyle(
                   color: Colors.black54,
                   fontSize: 30,
                   fontWeight: FontWeight.w700,
                 ),)
               ),
                const SizedBox(height: 10,),
                Text('Create a new account',
                  style: TextStyle(
                    color:Colors.grey.shade700,
                    fontSize: 18,
                  ),

                ),
                const SizedBox(height: 25,),
                MyTextField( controller: usernameController,
                  hintText: 'UserName',
                  obscureText: false,
                ),
                const SizedBox(height: 10,),
                MyTextField( controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10,),
                MyTextField( controller: passwordController,
                  hintText: 'Password',
                  obscureText: securePassword,
                  suffixIcon: IconButton(
                    icon: Icon(securePassword == true? Icons.visibility:Icons.visibility_off), onPressed: () {
                    securePassword = !securePassword;
                      setState(() {

                      });
                  },


                  ),

                ),
                const SizedBox(height: 10,),

                MyTextField( controller: confirmpasswordController,
                  hintText: 'Confirm Password',
                  obscureText:secureConfirmPassword,
                  suffixIcon: IconButton(
                    icon:Icon(secureConfirmPassword== true? Icons.visibility:Icons.visibility_off),onPressed: () {
                      secureConfirmPassword = !secureConfirmPassword;
                      setState(() {
                      });
                  },
                  ),
                ),
                const SizedBox(height: 30,),
                DefaultButton(
                  height: 60,
                  bgColor: kBlackColor,
                  text: "Sign up",
                  textStyle: KWhiteText,
                  borderRadius: 8,
                  onTap: (){
                    navigateTo(context, const SubscriptionScreen());
                  },
                ),
                const SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness:0.5,
                          color:Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text('Or Continue With',
                          style: TextStyle(color: Colors.grey.shade700),),
                      ),
                      Expanded(
                        child: Divider(
                          thickness:0.5,
                          color:Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath:'assets/images/google.png'),
                    SizedBox(width: 25,),
                    SquareTile(imagePath:'assets/images/apple.png'),
                    SizedBox(width: 25,)

                  ],
                ),
                const SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You already have account?',
                      style: TextStyle(color: Colors.grey[700],
                      fontSize: 18,),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: (){
                        navigateTo(context,   LoginScreen());
                      },
                      child: const Text(
                        'sign in',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
             ],

           ),
         ),
       )
      ,


    );
  }
}
