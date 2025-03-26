import 'dart:io';

import 'package:doctor_app/core/routers/routing.dart';
import 'package:doctor_app/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter {

  static Route? generateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routing.splash:
        return _buildRoute(SplashView());
      case Routing.onboarding:
        return _buildRoute(Scaffold());
      case Routing.signIn:
        return _buildRoute(Scaffold());
      case Routing.otp:
        return _buildRoute(Scaffold());
      case Routing.home:
        return _buildRoute(Scaffold());
      case Routing.profile:
        return _buildRoute(Scaffold());  
        
      default:
        return null;
    }
  }




 static Route<dynamic> _buildRoute(Widget page) {
    return Platform.isIOS
        ? CupertinoPageRoute(
            builder: (_) => page,
          )
        : MaterialPageRoute(builder: (_) => page);
  }
}