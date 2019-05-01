import 'package:flutter/material.dart';
import 'package:shopapp/Components/ThemeColors.dart';

class inputBoxState extends StatefulWidget {
  @override
  _inputBoxStateState createState() => _inputBoxStateState();
}

class _inputBoxStateState extends State<inputBoxState> {
  bool loggedIn = false;
  String _email, _password;

  final formKey = GlobalKey<FormState>();
  final mainKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: loggedIn == false
            ? Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autocorrect: false,
                    decoration: InputDecoration(
                      hintText: 'Please enter Email.',
                      labelText: 'Email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelStyle: Theme.of(context).textTheme.title,
                      icon: Icon(
                        Icons.mail,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    onSaved: (str) => _email = str,
                  ),
                  TextFormField(
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Please enter your password',
                      labelText: 'Password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      labelStyle: Theme.of(context).textTheme.title,
                      icon: Icon(
                        Icons.vpn_key,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    validator: (str) =>
                    !(str.length <= 7) ? "Not a Valid Password" : null,
                    onSaved: (str) => _password = str,
                  ),
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: onPressed,
                  )
                ],
              ),
            )
            : Center(
          child: Column(
            children: <Widget>[
              Text("Welcome"),
              RaisedButton(
                child: Text("Log Out"),
                onPressed: () {
                  setState(() {
                    loggedIn = false;
                  });
                },
              )
            ],
          ),
        ));
  }

  String validateEmail(String value) {
    String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email is Required";
    } else if(!regExp.hasMatch(value)){
      return "Invalid Email";
    }else {
      return null;
    }
  }

  void onPressed() {
    var form = formKey.currentState;

    if (form.validate()) {
      form.save();
      setState(() {
        loggedIn = true;
      });
    }

    var snackbar = SnackBar(
      content: Text("welcome"),
      duration: Duration(milliseconds: 5000),
    );
    mainKey.currentState.showSnackBar(snackbar);
  }
}
