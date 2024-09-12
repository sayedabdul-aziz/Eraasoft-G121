class RegisterParams {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;

  RegisterParams(
      {this.name, this.email, this.password, this.passwordConfirmation});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": passwordConfirmation
    };
  }
}
