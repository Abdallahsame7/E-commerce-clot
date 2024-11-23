import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/core/components/custom_email.dart';
import 'package:flutter_application_1/core/components/custom_password.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/forgetpass/forgetpass_screen.dart';
import 'package:flutter_application_1/view/signup/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
      final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27 ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 123 ,),
            
                Text("Sign in",style: TextStyles.font32black,),
                SizedBox(height: 32.h,),
                
                CustomEmail(),
                SizedBox(height: 16.h,),
          
                CustomPassword(),
                SizedBox(height: 16.h,),
          
                CustomContainer(
                name: "Sign in",
                ontap: () {
                  setState(() {});
                   if (_formKey.currentState?.validate() ?? false) {
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("successsssssssssssss")));
                   }
                   else{
                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please fill all the fields")));
                   }
                },
                ),
          
                 SizedBox(height: 16.h,),
                Row(
                  children: [
                    Text("Forgot Password ?"),
                    TextButton(onPressed: () {
                        NavigationHelper.goto(context, ForgetpassScreen());
                    }, child: const Text("Reset Password",style: TextStyle(color: Colors.black),)),
                  ],
                ),
                
                SizedBox(height: 16.h,),
                 Row(
                  children: [
                  const  Text("Dont have an account ?"),
                    TextButton(onPressed: () {
                      NavigationHelper.goto(context, SignupScreen());
                    }, child: const Text("Create Account",style: TextStyle(color: Colors.black),)),
                  ],
                )
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}