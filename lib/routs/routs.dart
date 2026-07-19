import 'package:flutter/material.dart';

import '../Setting_page/Notification_page/Notification_page.dart';
import '../Setting_page/setting_page.dart';
import '../main_screens/Home.dart';
import '../main_screens/login_page.dart';
import '../main_screens/signup_page.dart';
import '../main_screens/welcome_page.dart';

import '../onboarding/client/client_onboarding_page.dart';
import '../onboarding/freelancer/freelancer_onboarding_page.dart';
import '../profile/profile_page.dart';
import '../main_screens/Chosing_page.dart';
import '../sub_screen/SupportPage.dart';
import '../sub_screen/post_page.dart';
import '../sub_screen/project_page.dart';
import '../widgets/auth_gate.dart';


class AppRoutes {

  static Map<String, WidgetBuilder> routes(
      VoidCallback toggleTheme
      ) {

    return {

      AuthGate.id: (context) =>
          AuthGate(
            onToggleTheme: toggleTheme,
          ),


      WelcomePageTwo.id: (context) =>
          WelcomePageTwo(
            onToggleTheme: toggleTheme,
          ),


      WelcomePageOne.id: (context) =>
      const WelcomePageOne(),


      SupportPage.id: (context) =>
      const SupportPage(),


      ProjectsPage.id: (context) =>
      const ProjectsPage(),


      CreatePostScreen.id: (context) =>
      const CreatePostScreen(),


      HomePage.id: (context) =>
      const HomePage(),


      SettingsPage.id: (context) =>
      const SettingsPage(),


      NotificationScreen.id: (context) =>
      const NotificationScreen(),


      ProfilePage.id: (context) =>
      const ProfilePage(),


      ClientOnboardingPage.id: (context) =>
      const ClientOnboardingPage(),


      FreelancerOnboardingPage.id: (context) =>
      const FreelancerOnboardingPage(),


      SignUpScreen.id: (context) =>
      const SignUpScreen(),


      LoginScreen.id: (context) =>
      const LoginScreen(),

    };
  }
}