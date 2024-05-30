String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an email address';
  }
  if (!value.contains('@')) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  }
  if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}


String? validateEmpty(String? value,String name) {
  if (value == null || value.isEmpty) {
    return 'Please enter a $name';
  }
  return null;
}