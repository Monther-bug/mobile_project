class FormValidators {
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  static String? validateLoginFields({
    required String email,
    required String password,
  }) {
    if (email.isEmpty || password.isEmpty) {
      return 'Please enter all fields';
    }
    
    final emailError = FormValidators.email(email);
    if (emailError != null) return emailError;
    
    return null;
  }

  static String? validateRegisterFields({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) {
    if (name.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      return 'Please enter all fields';
    }
    
    final nameError = FormValidators.name(name);
    if (nameError != null) return nameError;
    
    final emailError = FormValidators.email(email);
    if (emailError != null) return emailError;
    
    final passwordError = FormValidators.password(password);
    if (passwordError != null) return passwordError;
    
    final confirmError = FormValidators.confirmPassword(confirmPassword, password);
    if (confirmError != null) return confirmError;
    
    return null;
  }
}
