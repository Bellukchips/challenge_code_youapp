import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/authentication/authentication_bloc.dart';
import 'package:youapp_test/application/login/login_bloc.dart';
import 'package:youapp_test/domain/login/models/login_form.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/color_app.dart';
import 'package:youapp_test/shared/font_app.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.dark,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          state.loginFailureOption.fold(() => null, (either) {
            either.fold((l) {
              final snackBar = SnackBar(
                content: Text(l.map(
                  badRequest: (value) => 'Bad Request',
                  tokenNotProvided: (value) => 'Token Not Provided',
                  unauthenticated: (value) => 'Unauthenticated',
                  unexpected: (value) => 'Unexpected error ${value.error}',
                  serverError: (value) => 'Server error',
                  invalidEmailAndPasswordCombination: (value) =>
                      'Invalid Email and Password',
                )),
                duration: const Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              //!reset form
              context.read<LoginBloc>().add(const LoginEvent.started());
            }, (r) async {
              context
                  .read<AuthenticationBloc>()
                  .add(AuthenticationEvent.loggedIn(r));
              getIt<AppRouter>().replace(const AboutRoute());
            });
          });
        },
        builder: (context, state) {
          return BlocBuilder<LoginBloc, LoginState>(
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
                          'Login',
                          style: FontApp.primaryStyle.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        const FormInputEmailLogin(),
                        const SizedBox(
                          height: 25,
                        ),
                        const FormInputPasswordLogin(),
                        const SizedBox(
                          height: 25,
                        ),
                        TextButton(
                            onPressed: () {
                              if (state.form.email.isValid() == false ||
                                  state.form.password.isValid() == false) {
                                const snackBar = SnackBar(
                                  content:
                                      Text('Email & Password Cannot be empty'),
                                  duration: Duration(seconds: 2),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } else {
                                context.read<LoginBloc>().add(LoginEvent.submit(
                                    LoginForm(
                                        email: state.form.email,
                                        password: state.form.password)));
                              }
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
                                'Login',
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
                              'No Account?',
                              style: FontApp.primaryStyle
                                  .copyWith(color: Colors.white),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context)
                                    .replace(const RegisterRoute());
                              },
                              child: Text(
                                'Register Here',
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
    );
  }
}

class FormInputPasswordLogin extends StatelessWidget {
  const FormInputPasswordLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          validator: (value) =>
              context.read<LoginBloc>().state.form.password.value.fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidPassword: (value) =>
                            'Password must be 8 characters',
                        orElse: () => null,
                      ),
                  (r) => null),
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginEvent.passwordChanged(value)),
          keyboardType: TextInputType.visiblePassword,
          obscureText: !state.passwordVisibility,
          decoration: InputDecoration(
              errorText: state.form.password.value.fold(
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
                        .read<LoginBloc>()
                        .add(const LoginEvent.togglePassword());
                  },
                  icon: Icon(
                    !state.passwordVisibility
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    color: Colors.yellow.shade800,
                  )),
              filled: true,
              hintText: 'Enter Password',
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

class FormInputEmailLogin extends StatelessWidget {
  const FormInputEmailLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          style: FontApp.primaryStyle.copyWith(color: Colors.white),
          validator: (value) =>
              context.read<LoginBloc>().state.form.email.value.fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidEmail: (value) => 'Invalid email',
                        orElse: () => null,
                      ),
                  (r) => null),
          onChanged: (value) =>
              context.read<LoginBloc>().add(LoginEvent.emailChanged(value)),
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              errorText: state.form.email.value.fold(
                  (l) => l.maybeMap(
                        empty: (value) => 'Cannot empty',
                        invalidEmail: (value) => 'Invalid email',
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
