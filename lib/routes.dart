import 'package:flutter/widgets.dart';
import 'package:trancentum_ui_kit/screens/otp/otp_screen.dart';
import 'package:trancentum_ui_kit/screens/profile/profile_screen.dart';

import 'screens/login_success/login_success_screen.dart';
import './screens/forgot_password/forgot_password_screen.dart';
import './screens/sign_in/sign_in_screen.dart';
import './screens/splash/splash_screen.dart';
import './screens/complete_profile/complete_profile_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/sign_in_web/sign_in_web_page.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  SignInWebPage.routeName: (context) => SignInWebPage(),
};
