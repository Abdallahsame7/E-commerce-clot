import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/forgetpass/forgetpass_cubit.dart';
import 'package:flutter_application_1/controller/onbaording/onboarding_cubit.dart';
import 'package:flutter_application_1/controller/signin/signin_cubit.dart';
import 'package:flutter_application_1/controller/signup/signup_cubit.dart';
import 'package:flutter_application_1/core/shared/sharedPref.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/view/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cacheInitialization();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => SigninCubit()),
            BlocProvider(create: (_) => SignupCubit()),
            BlocProvider(create: (_) => ForgetpassCubit()),
            BlocProvider(create: (_) => OnboardingCubit()),
          ],
          child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen(),
          ),
        );
      }
    );
    
  }
}
