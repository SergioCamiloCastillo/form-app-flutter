import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_app/presentation/blocs/register/register_cubit.dart';
import 'package:form_app/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              FlutterLogo(
                size: 100,
              ),
              _RegisterForm(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  //el _formKey, permite enlazar ese _formKey al <form
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: "Nombre de usuario",
          onChanged: (value) => registerCubit.usernameChanged(value),
          errorMessage:
              username.isPure || username.isValid ? null : "Usuario no valido",
          validator: (value) {
            if (value == null || value.isEmpty) return "Campo requerio";
            if (value.trim().isEmpty) return "Campo requerio";
            if (value.length < 6) return "Debe contener mas de 6 letras";
            return null;
          },
        ),
        const SizedBox(
          height: 10,
        ),
        CustomTextFormField(
          label: "Correo electronico",
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
          validator: (value) {
            if (value == null || value.isEmpty) return "Campo requerio";
            if (value.trim().isEmpty) return "Campo requerio";
            final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegExp.hasMatch(value)) return "No es correo";
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          label: "Contraseña",
          obscureText: true,
          onChanged: (value) => registerCubit.passwordChanged(value),
          errorMessage:
              password.isPure || password.isValid ? null : "Contraseña no valida",
          validator: (value) {
            if (value == null || value.isEmpty) return "Campo requerio";
            if (value.trim().isEmpty) return "Campo requerio";
            if (value.length < 6) return "Debe contener mas de 6 letras";
            return null;
          },
        ),
        const SizedBox(
          height: 20,
        ),
        FilledButton.tonalIcon(
          onPressed: () {
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        ),
      ],
    ));
  }
}
