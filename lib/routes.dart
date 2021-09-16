import 'package:flutter/widgets.dart';

import 'screens/error/error_screen.dart';
import 'screens/notifications/notifications_screen.dart';
import 'screens/expedition_detail/expedition_detail_screen.dart';
import 'screens/help_center/help_center_screen.dart';
import 'screens/new_expedition/new_expedition_screen.dart';
import 'screens/otp/otp_screen.dart';
import 'screens/forgot_password/forgot_password_screen.dart';
import 'screens/profile/profile_screen.dart.dart';
import 'screens/sign_in/sign_in_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'screens/complete_profile/complete_profile_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/unknown_route/unknown_route_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),//after http course // add remember me feature
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  ExpeditionDetailScreen.routeName: (context) => ExpeditionDetailScreen(),
  NewExpeditionScreen.routeName: (context) => NewExpeditionScreen(),
  HelpCenterScreen.routeName: (context) => HelpCenterScreen(),//after native device features course
  NotificationsScreen.routeName: (context) => NotificationsScreen(),//after push notif course
  UnknownRouteScreen.routeName: (context) => UnknownRouteScreen(),
  ErrorScreen.routeName: (context) => ErrorScreen(),//for OTP verification => email not sent error and 401- 403 errors

  

};
