import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
      body: SafeArea(
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
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      hintText: 'Enter Username/Email',
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
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.visibility_off_outlined,
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
                ),
                const SizedBox(
                  height: 25,
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)))),
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
                      style: FontApp.primaryStyle.copyWith(color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        AutoRouter.of(context).replace(const RegisterRoute());
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
      ),
    );
  }
}
