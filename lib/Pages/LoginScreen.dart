import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Components/CustomAppBar.dart';
import 'package:shopapp/Components/LoginForm.dart';
import 'package:shopapp/Components/ThemeColors.dart';
import 'package:shopapp/Repository/user_repository.dart';
import 'package:shopapp/login_bloc/bloc.dart';

class LoginScreen extends StatefulWidget {
  final UserRepository _userRepository;

  LoginScreen({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      userRepository: _userRepository,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(title: "Login", isSearchIconEnabled: false),
      body: BlocProvider<LoginBloc>(
        builder: (BuildContext context) => _loginBloc,
        child: LoginForm(userRepository: _userRepository),
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
