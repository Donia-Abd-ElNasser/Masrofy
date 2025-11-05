import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



import 'package:masrofy/screens/Auth/views/phone_view.dart';
import 'package:masrofy/screens/Auth/views/verify_phone_view.dart';
import 'package:masrofy/screens/budget/view/budget_view.dart';
import 'package:masrofy/screens/home/view/home_view.dart';
import 'package:masrofy/screens/home/view/widgets/custom_navigation_bar.dart';
import 'package:masrofy/screens/notification/view/notification.dart';
import 'package:masrofy/screens/reports/view/reports_view.dart';
import 'package:masrofy/screens/transaction/view/transaction_view.dart';
import 'package:masrofy/screens/onboarding/view/onboarding_screen.dart';
import 'package:masrofy/screens/onboarding/view/splash_screen.dart';
import 'package:masrofy/screens/onboarding/view/welcome_screen.dart';
import 'package:masrofy/screens/wallet/view/wallet_view.dart';

abstract class AppRoutes {
  static const kSplashView = '/';
  static const kWelcomeView = '/welcome';
  static const kOnBoardingView = '/onboarding';
  static const kVerifyView = '/verify';
  static const kPhoneView = '/phone';
  static const kTransactionView = '/transaction';
static const kHomeView='/home';

  static const kNotificationView = '/notification';
  static const kWalletView = '/wallet';
  static const kReportsView = '/reports';
static const kBudgetView='/budget';
  static GoRouter getRouter() {
    return GoRouter(
      initialLocation: kWelcomeView,
      routes: [

    animatedRoute(
          path: kSplashView,
          child: const SplashScreen(),
        ),
        animatedRoute(
          path: kWelcomeView,
          child: const WelcomeView(),
        ),
        animatedRoute(
          path: kOnBoardingView,
          child: const OnboardingView(),
        ),
        animatedRoute(
          path: kVerifyView,
          child:  VerifyPhoneView(),
        ),
        animatedRoute(
          path: kPhoneView,
          child: const PhoneView(),
        ),



        ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: const CustomBottomNav(),
        );
      },
      routes: [
    
        animatedRoute(
          path: kTransactionView,
          child: const TransactionView(),
        ),
         animatedRoute(
          path: kHomeView,
          child: const HomeView(),
        ),
         animatedRoute(
          path: kBudgetView,
          child: const BudgetView(),
        ),
        animatedRoute(
          path: kWalletView,
          child: const WalletView(),
        ),
        animatedRoute(
          path: kNotificationView,
          child:  NotificationView(),
        ),
        animatedRoute(
          path: kReportsView,
          child: const AnalyticsAndReportsView(),
        ),
      ],),]
    );
  }

 




  static GoRoute animatedRoute({
    required String path,
    required Widget child,
  }) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        transitionDuration: const Duration(milliseconds: 450),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final slideAnimation = Tween<Offset>(
            begin: const Offset(1, 0), 
            end: Offset.zero,
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );

          final fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          );

          return SlideTransition(
            position: slideAnimation,
            child: FadeTransition(opacity: fadeAnimation, child: child),
          );
        },
        child: child,
      ),
    );
  }
}
