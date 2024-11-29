import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/forgetpass/forgetpass_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/core/components/custom_container.dart';
import 'package:flutter_application_1/view/forgetpass/widgets/custom_emailforget.dart';
import 'package:flutter_application_1/core/components/custom_pop.dart';
import 'package:flutter_application_1/core/shared/navigation_helper.dart';
import 'package:flutter_application_1/core/styles/styles.dart';
import 'package:flutter_application_1/view/forgetpass/passsented_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetpassScreen extends StatelessWidget {
  const ForgetpassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: BlocBuilder<ForgetpassCubit, ForgetpassState>(
          builder: (context, state) {
            final cubit = context.read<ForgetpassCubit>();
    
            if (state is ForgetpassSuccess) {
              // Navigate to the PasssentedScreen
              WidgetsBinding.instance.addPostFrameCallback((_) {
                NavigationHelper.goto(context, PasssentedScreen());
              });
            }
    
            if (state is ForgetpassError) {
              // Show error Snackbar
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              });
            }
    
            return Form(
              key: cubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 63.h),
                  CustomPop(
                    ontap: () {
                      NavigationHelper.back(context);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    "Forgot Password",
                    style: TextStyles.font32black,
                  ),
                  SizedBox(height: 32.h),
                  CustomEmailforget(),
                  SizedBox(height: 40.h),
                  CustomContainer(
                    name: "Continue",
                    ontap: () {
                      cubit.validateAndProceed(context);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
