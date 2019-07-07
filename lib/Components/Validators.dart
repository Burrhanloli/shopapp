class Validators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})');

  static isValidEmail(String email) {
    if(email.isEmpty){
      return true;
    }
    return _emailRegExp.hasMatch(email);
  }

  static isValidPassword(String password) {
    if(password.isEmpty){
      return true;
    }
    return _passwordRegExp.hasMatch(password);
  }
}