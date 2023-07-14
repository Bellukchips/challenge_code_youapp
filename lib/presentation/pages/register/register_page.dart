import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/register/register_bloc.dart';
import 'package:youapp_test/domain/register/models/register_form.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/color_app.dart';
import 'package:youapp_test/shared/font_app.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        getIt<AppRouter>().replace(const LoginRoute());
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorApp.dark,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          buildWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          listener: (context, state) {
            state.registerFailureSuccessOption.fold(
                () => null,
                (either) => either.fold((l) {
                      final snackBar = SnackBar(
                        content: Text(l.map(
                          unexpected: (value) =>
                              'Unexpected error ${value.error}',
                          serverError: (value) => 'Server error',
                        )),
                        duration: const Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      //! Reset Form
                      context
                          .read<RegisterBloc>()
                          .add(const RegisterEvent.started());
                    }, (r) async {
                      const snackBar = SnackBar(
                        content: Text('Register Success'),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      Timer(const Duration(seconds: 3), () {
                        getIt<AppRouter>().replace(const LoginRoute());
                      });
                    }));
          },
          builder: (context, state) {
            return BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (state.isSubmitting) {
                  return IgnorePointer(
                    ignoring: !state.isSubmitting,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: state.isSubmitting
                          ? Colors.black.withOpacity(0.4)
                          : Colors.transparent,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ColorApp.blueAccent),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                              Text(
                                'Back',
                                style: FontApp.primaryStyle.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              )
                            ],
                          ),
                          //! Form Login
                          const SizedBox(
                            height: 60,
                          ),
                          Text(
                            'Register',
                            style: FontApp.primaryStyle.copyWith(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const FormInputEmail(),
                          const SizedBox(
                            height: 15,
                          ),
                          const FormInputUsername(),
                          const SizedBox(
                            height: 15,
                          ),
                          const FormInputCreatePassword(),
                          const SizedBox(
                            height: 15,
                          ),
                          const FormInputConfirmPassword(),
                          const SizedBox(
                            height: 25,
                          ),
                          TextButton(
                              onPressed: () {
                                context.read<RegisterBloc>().add(
                                    RegisterEvent.submit(RegisterForm(
                                        email: state.registerForm.email,
                                        username: state.registerForm.username,
                                        password: state.registerForm.password,
                                        passwordConfirm: state
                                            .registerForm.passwordConfirm)));
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5)))),
                              child: Container(
                                alignment: FractionalOffset.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    gradient: LinearGradient(
                                      end: const Alignment(0.95, -0.31),
                                      begin: const Alignment(-0.95, 0.31),
                                      colors: [
                                        ColorApp.blueAccent,
                                        const Color(0xFF4599DB)
                                      ],
                                    )),
                                height: 44,
                                width: MediaQuery.sizeOf(context).width,
                                child: Text(
                                  'Register',
                                  style: FontApp.primaryStyle.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )),
                          //! End Form Login
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Have an Account?',
                                style: FontApp.primaryStyle
                                    .copyWith(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context)
                                      .replace(const LoginRoute());
                                },
                                child: Text(
                                  'Login here',
                                  style: FontApp.primaryStyle.copyWith(
                                      color: Colors.yellow.shade800,
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class FormInputConfirmPassword extends StatelessWidget {
  const FormInputConfirmPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          validator: (value) => context
              .read<RegisterBloc>()
              .state
              .registerForm
              .passwordConfirm!
              .value
              .fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidPassword: (value) =>
                            'Password must be 8 characters',
                        orElse: () => null,
                      ),
                  (r) => null),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.passwordChangedConfirm(value)),
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          obscureText: !state.passwordVisibilityConfirm,
          decoration: InputDecoration(
              errorText: state.registerForm.passwordConfirm !=
                      state.registerForm.password
                  ? 'Password not matches with password created'
                  : state.registerForm.passwordConfirm!.value.fold(
                      (l) => l.maybeMap(
                            empty: (value) => 'Cannot empty',
                            invalidPassword: (value) =>
                                'Password must be 8 characters',
                            orElse: () => null,
                          ),
                      (r) => null),
              suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<RegisterBloc>()
                        .add(const RegisterEvent.togglePasswordConfirm());
                  },
                  icon: Icon(
                    !state.passwordVisibilityConfirm
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.yellow.shade800,
                  )),
              filled: true,
              hintText: 'Confirm Password',
              hintStyle: FontApp.primaryStyle
                  .copyWith(color: Colors.white.withOpacity(0.3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              fillColor: Colors.white.withOpacity(0.1)),
        );
      },
    );
  }
}

class FormInputCreatePassword extends StatelessWidget {
  const FormInputCreatePassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          validator: (value) => context
              .read<RegisterBloc>()
              .state
              .registerForm
              .password!
              .value
              .fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidPassword: (value) =>
                            'Password must be 8 characters',
                        orElse: () => null,
                      ),
                  (r) => null),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.passwordChangedCreate(value)),
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          obscureText: !state.passwordVisibilityCreate,
          decoration: InputDecoration(
              errorText: state.registerForm.password!.value.fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidPassword: (value) =>
                            'Password must be 8 characters',
                        orElse: () => null,
                      ),
                  (r) => null),
              suffixIcon: IconButton(
                  onPressed: () {
                    context
                        .read<RegisterBloc>()
                        .add(const RegisterEvent.togglePasswordCreate());
                  },
                  icon: Icon(
                    !state.passwordVisibilityCreate
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.yellow.shade800,
                  )),
              filled: true,
              hintText: 'Create Password',
              hintStyle: FontApp.primaryStyle
                  .copyWith(color: Colors.white.withOpacity(0.3)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              fillColor: Colors.white.withOpacity(0.1)),
        );
      },
    );
  }
}

class FormInputUsername extends StatelessWidget {
  const FormInputUsername({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          validator: (value) => context
              .read<RegisterBloc>()
              .state
              .registerForm
              .username!
              .value
              .fold(
                  (l) => l.maybeMap(
                        orElse: () => null,
                        empty: (value) => 'Cannot be empty',
                      ),
                  (r) => null),
          onChanged: (value) => context
              .read<RegisterBloc>()
              .add(RegisterEvent.usernameChanged(value)),
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              errorText: state.registerForm.username!.value.fold(
                  (l) => l.maybeMap(
                        orElse: () => null,
                        empty: (value) => 'Cannot be empty',
                      ),
                  (r) => null),
              hintText: 'Enter Username',
              hintStyle: FontApp.primaryStyle
                  .copyWith(color: Colors.white.withOpacity(0.3)),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              fillColor: Colors.white.withOpacity(0.1)),
        );
      },
    );
  }
}

class FormInputEmail extends StatelessWidget {
  const FormInputEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterBloc, RegisterState>(
      builder: (context, state) {
        return TextFormField(
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          keyboardType: TextInputType.emailAddress,
          validator: (value) =>
              context.read<RegisterBloc>().state.registerForm.email!.value.fold(
                  (l) => l.maybeMap(
                        invalidEmail: (value) => 'Invalid Email',
                        empty: (value) => 'Cannot be empty',
                        orElse: () => null,
                      ),
                  (r) => null),
          onChanged: (value) {
            context.read<RegisterBloc>().add(RegisterEvent.emailChanged(value));
          },
          decoration: InputDecoration(
              errorText: state.registerForm.email!.value.fold(
                  (l) => l.maybeMap(
                        invalidEmail: (value) => 'Invalid Email',
                        empty: (value) => 'Cannot be empty',
                        orElse: () => null,
                      ),
                  (r) => null),
              hintText: 'Enter Email',
              hintStyle: FontApp.primaryStyle
                  .copyWith(color: Colors.white.withOpacity(0.3)),
              filled: true,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: ColorApp.dark)),
              fillColor: Colors.white.withOpacity(0.1)),
        );
      },
    );
  }
}
