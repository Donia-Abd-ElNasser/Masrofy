

import 'package:go_router/go_router.dart';
import 'package:masrofy/screens/Auth/login/view/login_view.dart';
import 'package:masrofy/screens/Auth/register/view/register_view.dart';
import 'package:masrofy/screens/onboarding/view/onboarding_screen.dart';
import 'package:masrofy/screens/onboarding/view/splash_screen.dart';
import 'package:masrofy/screens/onboarding/view/welcome_screen.dart';

abstract class AppRoutes {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kOnBoardingView = '/onboardingView';
    static const kWelcomeView = '/welcomeView';
  static GoRouter getRouter() {
    return GoRouter(
     
      routes: [
         GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
          GoRoute(path: kRegisterView, builder: (context, state) => const RegisterView()),
       GoRoute(path: kOnBoardingView, builder: (context, state) => const OnboardingView()),
        GoRoute(path: kLoginView, builder: (context, state) => const LoginView()),
         GoRoute(path: kWelcomeView, builder: (context, state) => const WelcomeView()),
        GoRoute(
          path: kLoginView,
          builder: (context, state) => const LoginView(),
        ),
      //  GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
        
      ],
    );
  }
}