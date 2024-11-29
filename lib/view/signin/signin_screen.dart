import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/signin/signin_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/view/signin/widgets/custom_email.dart';
import 'package:flutter_application_1/view/signin/widgets/custom_password.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/forgetpass/forgetpass_screen.dart';
import 'package:flutter_application_1/view/signup/signup_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SigninScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27),
            child: BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Sign in successful")),
                  );
                 // NavigationHelper.goto(context, SignupScreen());
                } else if (state is SigninError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 123.h),
                    Text("Sign in", style: TextStyles.font32black),
                    SizedBox(height: 32.h),
                    CustomEmail(),
                    SizedBox(height: 16.h),
                    CustomPassword(),
                    SizedBox(height: 16.h),
                    if (state is SigninLoding)
                      Center(child: CircularProgressIndicator()),
                    if (state is! SigninLoding)
                      CustomContainer(
                        name: "Sign in",
                        ontap: () {
                          bool isValid = _formKey.currentState?.validate() ?? false;
                          BlocProvider.of<SigninCubit>(context).validateAndSignin(isValid);
                        },
                      ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text("Forgot Password ?"),
                        TextButton(
                          onPressed: () {
                            NavigationHelper.goto(context, ForgetpassScreen());
                          },
                          child: const Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            NavigationHelper.goto(context, SignupScreen());
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
