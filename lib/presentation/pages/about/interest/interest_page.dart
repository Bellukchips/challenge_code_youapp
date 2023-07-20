import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:textfield_tags/textfield_tags.dart';
import 'package:youapp_test/application/profileForm/profile_form_bloc.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/color_app.dart';
import 'package:youapp_test/shared/font_app.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class InterestPage extends StatefulWidget {
  const InterestPage({super.key});

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  double? _distanceToField;
  TextfieldTagsController? _controller;
  List<String>? interests;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        getIt<AppRouter>().replace(const AboutRoute());
        return false;
      },
      child: BlocConsumer<ProfileFormBloc, ProfileFormState>(
        listener: (context, state) {
          state.createProfileFailureOption.fold(() => null, (either) {
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
            }, (r) async {
              getIt<AppRouter>().replace(const AboutRoute());
            });
          });
        },
        builder: (context, state) {
          return BlocBuilder<ProfileFormBloc, ProfileFormState>(
            builder: (context, state) {
              if (state.isSubmitting) {
                return IgnorePointer(
                  ignoring: true,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black.withOpacity(0.4),
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
              return Scaffold(
                backgroundColor: ColorApp.dark,
                body: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              TextButton(
                                onPressed: () {
                                  interests = _controller?.getTags;
                                  context.read<ProfileFormBloc>().add(
                                      ProfileFormEvent.interestChanged(
                                          interests!));
                                  Timer(
                                    const Duration(milliseconds: 500),
                                    () {
                                      context.read<ProfileFormBloc>().add(
                                          ProfileFormEvent.updateInterests(
                                              state.interests));
                                    },
                                  );
                                },
                                child: Text(
                                  'Save',
                                  style: FontApp.primaryStyle.copyWith(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Tell everyone about yourself',
                            style: TextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 252, 202, 128),
                                    Colors.yellow
                                  ],
                                ).createShader(
                                    const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'What interest you?',
                            style: FontApp.primaryStyle.copyWith(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextFieldTags(
                            textfieldTagsController: _controller,
                            initialTags: const [],
                            textSeparators: const [' ', ','],
                            letterCase: LetterCase.normal,
                            validator: (String tag) {
                              if (_controller!.getTags!.contains(tag)) {
                                return 'you already entered that';
                              }
                              return null;
                            },
                            inputfieldBuilder: (context, tec, fn, error,
                                onChanged, onSubmitted) {
                              return ((context, sc, tags, onTagDelete) {
                                return TextField(
                                  controller: tec,
                                  style: FontApp.primaryStyle.copyWith(
                                      color: const Color.fromARGB(
                                          113, 184, 184, 184),
                                      fontSize: 15),
                                  focusNode: fn,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.1),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorApp.darkAccent,
                                        width: 3.0,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(
                                            color: ColorApp.darkAccent)),
                                    hintText: _controller!.hasTags
                                        ? ''
                                        : "Enter Interest...",
                                    hintStyle: FontApp.primaryStyle
                                        .copyWith(color: Colors.white),
                                    errorText: error,
                                    prefixIconConstraints: BoxConstraints(
                                        maxWidth: _distanceToField! * 0.74),
                                    prefixIcon: tags.isNotEmpty
                                        ? SingleChildScrollView(
                                            controller: sc,
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                                children:
                                                    tags.map((String tag) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                    Radius.circular(20.0),
                                                  ),
                                                  color: ColorApp.darkAccent,
                                                ),
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 5.0),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0,
                                                        vertical: 5.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      child: Text(
                                                        tag,
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onTap: () {
                                                        print("$tag selected");
                                                      },
                                                    ),
                                                    const SizedBox(width: 4.0),
                                                    InkWell(
                                                      child: const Icon(
                                                        Icons.cancel,
                                                        size: 14.0,
                                                        color: Color.fromARGB(
                                                            255, 233, 233, 233),
                                                      ),
                                                      onTap: () {
                                                        onTagDelete(tag);
                                                      },
                                                    )
                                                  ],
                                                ),
                                              );
                                            }).toList()),
                                          )
                                        : null,
                                  ),
                                  onChanged: onChanged,
                                  onSubmitted: onSubmitted,
                                );
                              });
                            },
                          ),
                        ],
                      ),
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
