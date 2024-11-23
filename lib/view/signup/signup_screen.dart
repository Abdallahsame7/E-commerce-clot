import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/core/components/custom_emailcreate.dart';
import 'package:flutter_application_1/core/components/custom_firstname.dart';
import 'package:flutter_application_1/core/components/custom_lastname.dart';
import 'package:flutter_application_1/core/components/custom_passcreate.dart';
import 'package:flutter_application_1/core/components/custom_pop.dart';
import 'package:flutter_application_1/core/styles/styles.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final _formKey = GlobalKey<FormState>();

    return  Scaffold(
      body: Form(
        key: _formKey ,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 63,),
                CustomPop(
                  ontap: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 20,),
          
                Text("Create Account",style: TextStyles.font32black,),
          
                SizedBox(height: 30,),
                CustomFirstname(),
          
                SizedBox(height: 16,),
                CustomLastname(),
          
                SizedBox(height: 16,),
                CustomEmailcreate(),
          
                SizedBox(height: 16,),
                CustomPasscreate(),
          
                SizedBox(height: 40,),
                CustomContainer(
                  name: "Create Account",
                  ontap: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing...')),
                        );
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
      ),
    );
  }
}