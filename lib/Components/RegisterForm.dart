import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/Components/RegisterButton.dart';
import 'package:shopapp/autentication_bloc/bloc.dart';
import 'package:shopapp/register_bloc/bloc.dart';

class RegisterForm extends StatefulWidget {
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool _isObsecure = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterBloc _registerBloc;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isRegisterButtonEnabled(RegisterState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _registerBloc = BlocProvider.of<RegisterBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: _registerBloc,
      listener: (BuildContext context, RegisterState state) {
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registering...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).dispatch(LoggedIn());
          Navigator.of(context).pop();
        }
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Registration Failure'),
                    Icon(Icons.error),
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
      },
      child: BlocBuilder(
        bloc: _registerBloc,
        builder: (BuildContext context, RegisterState state) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              child: ListView(
                children: <Widget>[
                  Container(
//                    alignment: Alignment.center,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: _emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          prefixIcon: Icon(Icons.email),
                          hintText: "Enter your email.",
                          labelText: 'Email',
                        ),
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isEmailValid ? 'Invalid Email' : null;
                        },
                      ),
                    ),
                  ),
                  Container(
//                    alignment: Alignment.center,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: _passwordController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0)),
//          icon: Icon(Icons.lock),
                            labelText: "Password",
                            hintText: 'Enter your password',
                            // Here is key idea
                            suffixIcon: IconButton(
                              onPressed: () =>
                                  setState(() {
                                    return _isObsecure = !_isObsecure;
                                  }),
                              icon: _isObsecure
                                  ? Icon(Icons.visibility)
                                  : Icon(
                                Icons.visibility_off,
                              ),
                            )),
                        obscureText: _isObsecure,
                        autovalidate: true,
                        autocorrect: false,
                        validator: (_) {
                          return !state.isPasswordValid
                              ? 'Invalid Password'
                              : null;
                        },
                      ),
                    ),
                  ),
                  RegisterButton(
                    onPressed: isRegisterButtonEnabled(state)
                        ? _onFormSubmitted
                        : null,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _registerBloc.dispatch(
      EmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _registerBloc.dispatch(
      PasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _registerBloc.dispatch(
      Submitted(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
