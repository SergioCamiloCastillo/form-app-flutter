part of 'register_cubit.dart';

enum FormStatus { invalid, valid, validating }

class RegisterFormState extends Equatable {
  final FormStatus formStatus;
  final Username username;
  final Email email;
  final Password password;
  final bool isValid;

  const RegisterFormState(
      {this.username = const Username.pure(),
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.formStatus = FormStatus.invalid,
      this.isValid = false});
  RegisterFormState copyWith(
          {FormStatus? formStatus,
          Username? username,
          Email? email,
          bool? isValid,
          Password? password}) =>
      RegisterFormState(
          formStatus: formStatus ?? this.formStatus,
          username: username ?? this.username,
          isValid: isValid ?? this.isValid,
          email: email ?? this.email,
          password: password ?? this.password);
  @override
  List<Object> get props => [formStatus, isValid, username, email, password];
}
