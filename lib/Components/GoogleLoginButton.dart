import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp/login_bloc/bloc.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0,right: 8.0),
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        icon: Icon(FontAwesomeIcons.google, color: Colors.white),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).dispatch(
            LoginWithGooglePressed(),
          );
        },
        label: Text('Sign in with Google', style: TextStyle(color: Colors.white,fontSize: 18)),
        color: Colors.redAccent,
      ),
    );
  }
}
