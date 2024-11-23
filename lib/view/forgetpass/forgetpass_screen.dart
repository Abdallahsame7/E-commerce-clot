import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/core/components/custom_emailforget.dart';
import 'package:flutter_application_1/core/components/custom_pop.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/forgetpass/passsented_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetpassScreen extends StatelessWidget {
  const ForgetpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 63.h,),
          
              CustomPop(
                ontap:() {
                  NavigationHelper.back(context);
                }, 
                ),
                SizedBox(height: 20.h,),
              Text("Forgot Password" , style: TextStyles.font32black,),
          
              SizedBox(height: 32.h,),
              CustomEmailforget(),

              SizedBox(height: 40.h,),
              CustomContainer(
                name: "Continue",
                ontap: () {
                  if (_formKey.currentState!.validate()) {
                      NavigationHelper.goto(context, PasssentedScreen());
                     }
                       else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Please fill all the fields')));
                     }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}