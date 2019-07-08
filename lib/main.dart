import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Pages/NewHomeScreen.dart';
import 'package:shopapp/Repository/user_repository.dart';
import 'package:shopapp/route_generator.dart';

import 'Components/ThemeColors.dart';
import 'Pages/LoginScreen.dart';
import 'Pages/SplashScreen.dart';
import 'autentication_bloc/bloc.dart';

main() {
  runApp(App());
}

class App extends StatefulWidget {
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final UserRepository _userRepository = UserRepository();
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: _userRepository);
    _authenticationBloc.dispatch(AppStarted());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) => _authenticationBloc,
      child: MaterialApp(

        darkTheme: ThemeData(
            primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                  size: 30.0,
                ),
            fontFamily: 'Montserrat-Bold',
            brightness: Brightness.dark,
            primaryColor: kprimaryColor,
            primaryColorDark: kprimaryDarkColor,
            primaryColorLight: kprimaryLightColor,
            accentColor: ksecondaryDarkColor,
            bottomAppBarColor: ksecondaryDarkColor,
            buttonColor: ksecondaryColor,
            canvasColor: Colors.black,
            sliderTheme: SliderThemeData.fromPrimaryColors(
                primaryColor: kprimaryColor,
                primaryColorDark: kprimaryDarkColor,
                primaryColorLight: kprimaryLightColor,
                valueIndicatorTextStyle: TextStyle())),
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryIconTheme: Theme.of(context).primaryIconTheme.copyWith(
                  size: 30.0,
                ),
            fontFamily: 'Montserrat-Bold',
            brightness: Brightness.dark,
            primaryColor: kprimaryColor,
            primaryColorDark: kprimaryDarkColor,
            primaryColorLight: kprimaryLightColor,
            accentColor: ksecondaryDarkColor,
            bottomAppBarColor: ksecondaryDarkColor,
            buttonColor: ksecondaryColor,
//            canvasColor: Colors.black,
            sliderTheme: SliderThemeData.fromPrimaryColors(
                primaryColor: kprimaryColor,
                primaryColorDark: kprimaryDarkColor,
                primaryColorLight: kprimaryLightColor,
                valueIndicatorTextStyle: TextStyle())),
        home: BlocBuilder(
          bloc: _authenticationBloc,
          builder: (BuildContext context, AuthenticationState state) {
            if (state is Uninitialized) {
              return SplashScreen();
            }
            if (state is Unauthenticated) {
              return LoginScreen(userRepository: _userRepository);
            }
            if (state is Authenticated) {
              //Added for test
              return NewHomeScreen();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _authenticationBloc.dispose();
    super.dispose();
  }
}
