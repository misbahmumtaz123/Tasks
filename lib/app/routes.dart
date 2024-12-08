import 'package:go_router/go_router.dart';
import '../Screens/Dashboard/DashBoardScreen.dart';
import '../Screens/SignUp/SignUpScreen.dart';
import '../Screens/login/loginScreen.dart';
import '../Screens/otpverification/otpverificationScreen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) =>  SignupScreen(),
    ),
    GoRoute(
      path: '/otp',
      builder: (context, state) => OtpVerificationScreen(),
    ),
    GoRoute(
      path: '/dashboard',
      builder: (context, state) => HomeScreen(),
    ),
  ],
);

