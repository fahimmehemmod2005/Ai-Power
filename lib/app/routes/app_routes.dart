part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const SPLASH = _Paths.SPLASH;
  static const MULTI = _Paths.MULTI;
  static const SIGNUP = _Paths.SIGNUP;
  static const LOGIN = _Paths.LOGIN;
  static const FORGOTVIEWS = _Paths.FORGOTVIEWS;
  static const OTP = _Paths.OTP;
  static const RESETPASSWORD = _Paths.RESETPASSWORD;
  static const BACKTOLOGIN = _Paths.BACKTOLOGIN;
}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const SPLASH = '/splash';
  static const MULTI = '/multi';
  static const SIGNUP = '/signup';
  static const LOGIN = '/login';
  static const FORGOTVIEWS = '/forgot_views';
  static const OTP = '/otp';
  static const RESETPASSWORD = '/resetpassword';
  static const BACKTOLOGIN = '/backtologin';
}
