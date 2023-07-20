import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/authentication/authentication_bloc.dart';
import 'package:youapp_test/application/profile/profile_bloc.dart';
import 'package:youapp_test/application/profileForm/profile_form_bloc.dart';
import 'package:youapp_test/domain/profile/models/profile_form.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/pages/about/helper/datetime_formatter.dart';
import 'package:youapp_test/presentation/pages/about/helper/zodiac_helper.dart';
import 'package:youapp_test/presentation/router/app_route.dart';
import 'package:youapp_test/shared/color_app.dart';
import 'package:youapp_test/shared/font_app.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<ProfileBloc>()..add(const ProfileEvent.getProfile()),
        )
      ],
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () {
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
            },
            authenticated: (value) {
              return Scaffold(
                floatingActionButton: Container(
                  alignment: FractionalOffset.center,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: ColorApp.darkAccent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 100,
                  height: 60,
                  child: InkWell(
                    onTap: () {
                      context
                          .read<AuthenticationBloc>()
                          .add(const AuthenticationEvent.loggedOut());
                    },
                    child: Text('Log Out',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white)),
                  ),
                ),
                backgroundColor: ColorApp.dark,
                body: BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return state.maybeMap(
                      orElse: () {
                        return Container(
                          decoration: BoxDecoration(color: ColorApp.dark),
                          alignment: FractionalOffset.center,
                          child: Text('Opps Something went wrong',
                              style: FontApp.primaryStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        );
                      },
                      initial: (value) {
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorApp.blueAccent),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                      loadFailure: (value) {
                        return Container(
                          decoration: BoxDecoration(color: ColorApp.dark),
                          alignment: FractionalOffset.center,
                          child: Text('Opps Errors',
                              style: FontApp.primaryStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        );
                      },
                      loadInProgress: (value) {
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  ColorApp.blueAccent),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ));
                      },
                      loadSuccess: (value) {
                        return SafeArea(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
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
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.sizeOf(context).width -
                                                300 / 2,
                                        child: Text(
                                          value.profile.username ?? '',
                                          textAlign: TextAlign.center,
                                          style: FontApp.primaryStyle.copyWith(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  //!Form about
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const CardProfile(),
                                  //! edit profile card
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CardEditProfile(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const CardInterest(),
                                  const SizedBox(
                                    height: 100,
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
            },
          );
        },
      ),
    );
  }
}

class CardInterest extends StatelessWidget {
  const CardInterest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            color: ColorApp.darkCard,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Interest',
                      style: FontApp.primaryStyle.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        getIt<AppRouter>().replace(const InterestRoute());
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                state.maybeMap(
                  orElse: () => Container(),
                  loadSuccess: (value) {
                    if (value.profile.interests!.isEmpty) {
                      return Text(
                        'Add in your interest to find a better match',
                        style: FontApp.primaryStyle.copyWith(
                          color: const Color.fromARGB(255, 151, 151, 151),
                        ),
                      );
                    }
                    return SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.profile.interests!.length,
                        itemBuilder: (context, index) {
                          final interest = value.profile.interests![index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 4),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: ColorApp.darkAccent,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                interest,
                                style: FontApp.primaryStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CardEditProfile extends StatefulWidget {
  const CardEditProfile({
    super.key,
  });

  @override
  State<CardEditProfile> createState() => _CardEditProfileState();
}

class _CardEditProfileState extends State<CardEditProfile> {
  double defaultHeight = 120;
  bool isTap = true;

  void onEdit() {
    setState(() {
      isTap = !isTap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileFormBloc, ProfileFormState>(
      buildWhen: (previous, current) =>
          previous.isSubmitting != current.isSubmitting,
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

            //!reset form
            context
                .read<ProfileFormBloc>()
                .add(const ProfileFormEvent.started());
          }, (r) async {
            getIt<AppRouter>().replace(const AboutRoute());
            getIt<ProfileBloc>().add(const ProfileEvent.getProfile());
          });
        });
      },
      builder: (context, state) {
        return BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => Container(),
              loadSuccess: (value) {
                if (value.profile.birthday == null &&
                    value.profile.height == null &&
                    value.profile.weight == null &&
                    value.profile.name == null) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: !isTap ? 700 : 120,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: ColorApp.darkCard,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: BlocBuilder<ProfileFormBloc, ProfileFormState>(
                        builder: (context, stateBluider) {
                          if (stateBluider.isSubmitting) {
                            return IgnorePointer(
                              ignoring: !stateBluider.isSubmitting,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: stateBluider.isSubmitting
                                    ? Colors.black.withOpacity(0.4)
                                    : Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
                          return SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About',
                                      style: FontApp.primaryStyle.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    !isTap
                                        ? TextButton(
                                            onPressed: () {
                                              if (stateBluider.form.birthday!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Birthday cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider.form.name!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Name cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider
                                                      .form.height!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Height cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider
                                                      .form.weight!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Weight cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else {
                                                context
                                                    .read<ProfileFormBloc>()
                                                    .add(ProfileFormEvent
                                                        .createProfile(ProfileForm(
                                                            birthday:
                                                                stateBluider.form
                                                                    .birthday,
                                                            height:
                                                                stateBluider
                                                                    .form.height,
                                                            name: stateBluider
                                                                .form.name,
                                                            weight: stateBluider
                                                                .form.weight)));
                                                context.read<ProfileBloc>().add(
                                                    const ProfileEvent
                                                        .getProfile());
                                                onEdit();
                                              }
                                            },
                                            child: Text(
                                              'Save & Edit',
                                              style: FontApp.primaryStyle
                                                  .copyWith(
                                                      color: Colors
                                                          .yellow.shade600),
                                            ))
                                        : IconButton(
                                            onPressed: onEdit,
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.white,
                                            ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                !isTap
                                    ? const FormEditAddAbout(
                                        isNotEmpty: false,
                                      )
                                    : Text(
                                        'Add in your your to help others know you better',
                                        style: FontApp.primaryStyle.copyWith(
                                            color: const Color.fromARGB(
                                                255, 151, 151, 151)),
                                      )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
                  //! get zodiac and horoscope
                  String dayString = value.profile.birthday!.substring(0, 2);
                  String monthString = value.profile.birthday!.substring(2, 4);
                  String zodiac = getZodiacSign(
                      int.parse(dayString), int.parse(monthString));

                  String horoscope = getHoroscope(
                      int.parse(dayString), int.parse(monthString));
                  //!\

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: !isTap ? 700 : 300,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: ColorApp.darkCard,
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: BlocBuilder<ProfileFormBloc, ProfileFormState>(
                        builder: (context, stateBluider) {
                          if (stateBluider.isSubmitting) {
                            return IgnorePointer(
                              ignoring: !stateBluider.isSubmitting,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: stateBluider.isSubmitting
                                    ? Colors.black.withOpacity(0.4)
                                    : Colors.transparent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
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
                          return SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'About',
                                      style: FontApp.primaryStyle.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    !isTap
                                        ? TextButton(
                                            onPressed: () {
                                              if (stateBluider.form.birthday!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Birthday cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider.form.name!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Name cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider
                                                      .form.height!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Height cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else if (stateBluider
                                                      .form.weight!
                                                      .isValid() ==
                                                  false) {
                                                const snackBar = SnackBar(
                                                  content: Text(
                                                      'Weight cannot be empty'),
                                                  duration:
                                                      Duration(seconds: 2),
                                                );
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(snackBar);
                                              } else {
                                                context
                                                    .read<ProfileFormBloc>()
                                                    .add(ProfileFormEvent
                                                        .updateProfile(ProfileForm(
                                                            birthday:
                                                                stateBluider.form
                                                                    .birthday,
                                                            height:
                                                                stateBluider
                                                                    .form.height,
                                                            name: stateBluider
                                                                .form.name,
                                                            weight: stateBluider
                                                                .form.weight)));
                                                onEdit();
                                                context.read<ProfileBloc>().add(
                                                    const ProfileEvent
                                                        .getProfile());
                                              }
                                            },
                                            child: Text(
                                              'Save & Edit',
                                              style: FontApp.primaryStyle
                                                  .copyWith(
                                                      color: Colors
                                                          .yellow.shade600),
                                            ))
                                        : IconButton(
                                            onPressed: onEdit,
                                            icon: const Icon(
                                              Icons.edit,
                                              size: 20,
                                              color: Colors.white,
                                            ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Visibility(
                                  visible: isTap,
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Birthday:',
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 151, 151, 151)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            value.profile.birthday ?? '',
                                            style: FontApp.primaryStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Horoscope:',
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 151, 151, 151)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            horoscope,
                                            style: FontApp.primaryStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Zodiac:',
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 151, 151, 151)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            zodiac,
                                            style: FontApp.primaryStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Height:',
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 151, 151, 151)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${value.profile.height}',
                                            style: FontApp.primaryStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'Weight:',
                                            style: FontApp.primaryStyle
                                                .copyWith(
                                                    color: const Color.fromARGB(
                                                        255, 151, 151, 151)),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '${value.profile.weight}',
                                            style: FontApp.primaryStyle
                                                .copyWith(color: Colors.white),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                !isTap
                                    ? const FormEditAddAbout(
                                        isNotEmpty: true,
                                      )
                                    : Container()
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}

class FormEditAddAbout extends StatefulWidget {
  final bool isNotEmpty;
  const FormEditAddAbout({
    super.key,
    this.isNotEmpty = false,
  });

  @override
  State<FormEditAddAbout> createState() => _FormEditAddAboutState();
}

class _FormEditAddAboutState extends State<FormEditAddAbout> {
  String selectValueGender = 'Select Gender';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return BlocBuilder<ProfileFormBloc, ProfileFormState>(
          builder: (context, stateBluider) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 57,
                        width: 57,
                        alignment: FractionalOffset.center,
                        decoration: BoxDecoration(
                            color: ColorApp.darkAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          color: Colors.yellow.shade700,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Add Image',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Display Name',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      const TextEditAddName()
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Gender',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 400 / 2,
                        height: 45,
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  color: ColorApp.darkAccent,
                                  height: 150,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Text(
                                          'Female',
                                          style: FontApp.primaryStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                        onTap: () {
                                          // Handle option 1 tap
                                          setState(() {
                                            selectValueGender = 'Female';
                                          });
                                          Navigator.pop(
                                              context); // Close the bottom sheet
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Male',
                                          style: FontApp.primaryStyle
                                              .copyWith(color: Colors.white),
                                        ),
                                        onTap: () {
                                          // Handle option 2 tap
                                          setState(() {
                                            selectValueGender = 'Male';
                                          });
                                          Navigator.pop(
                                              context); // Close the bottom sheet
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  selectValueGender,
                                  style: FontApp.primaryStyle.copyWith(
                                      color: Colors.white.withOpacity(0.3)),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Birthday',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      const TextAddEditBirthday()
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Horoscope',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 400 / 2,
                        height: 50,
                        child: TextFormField(
                          readOnly: true,
                          initialValue: !widget.isNotEmpty
                              ? ''
                              : state.maybeMap(
                                  orElse: () {
                                    return '';
                                  },
                                  loadSuccess: (value) {
                                    String dayString =
                                        value.profile.birthday!.substring(0, 2);
                                    String monthString =
                                        value.profile.birthday!.substring(2, 4);
                                    return getHoroscope(int.parse(dayString),
                                        int.parse(monthString));
                                  },
                                ),
                          textAlign: TextAlign.end,
                          style: FontApp.primaryStyle
                              .copyWith(color: Colors.white, fontSize: 15),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Horoscope',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              hintStyle: FontApp.primaryStyle.copyWith(
                                  color: Colors.white.withOpacity(0.3)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              fillColor: Colors.white.withOpacity(0.1)),
                        ),
                      )
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Zodiac',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width - 400 / 2,
                        height: 50,
                        child: TextFormField(
                          readOnly: true,
                          initialValue: !widget.isNotEmpty
                              ? ''
                              : state.maybeMap(
                                  orElse: () {
                                    return '';
                                  },
                                  loadSuccess: (value) {
                                    String dayString =
                                        value.profile.birthday!.substring(0, 2);
                                    String monthString =
                                        value.profile.birthday!.substring(2, 4);
                                    return getZodiacSign(int.parse(dayString),
                                        int.parse(monthString));
                                  },
                                ),
                          textAlign: TextAlign.end,
                          style: FontApp.primaryStyle
                              .copyWith(color: Colors.white, fontSize: 15),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: 'Zodiac',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              hintStyle: FontApp.primaryStyle.copyWith(
                                  color: Colors.white.withOpacity(0.3)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: ColorApp.darkAccent)),
                              fillColor: Colors.white.withOpacity(0.1)),
                        ),
                      )
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Height',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      const TextEditAddHeight()
                    ],
                  ),
                  //!end form input
                  const SizedBox(
                    height: 20,
                  ),
                  //!form input
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Weight',
                        style: FontApp.primaryStyle.copyWith(
                            color: const Color.fromARGB(255, 151, 151, 151)),
                      ),
                      const TextEditAddWeight()
                    ],
                  ),
                  //!end form input
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class TextEditAddWeight extends StatelessWidget {
  const TextEditAddWeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () {
            return Container();
          },
          loadSuccess: (valueState) {
            context.read<ProfileFormBloc>().add(
                ProfileFormEvent.weightChanged(valueState.profile.weight ?? 0));
            return SizedBox(
              width: MediaQuery.sizeOf(context).width - 400 / 2,
              height: 50,
              child: TextFormField(
                validator: (value) => context
                    .read<ProfileFormBloc>()
                    .state
                    .form
                    .weight!
                    .value
                    .fold(
                        (l) => l.maybeMap(
                              invalidNumber: (value) => 'Invalid Weight',
                              orElse: () => null,
                            ),
                        (r) => null),
                onChanged: (value) => context
                    .read<ProfileFormBloc>()
                    .add(ProfileFormEvent.weightChanged(int.parse(value))),
                initialValue: valueState.profile.weight == null
                    ? null
                    : '${valueState.profile.weight}',
                textAlign: TextAlign.end,
                style: FontApp.primaryStyle
                    .copyWith(color: Colors.white, fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'Add Weight',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    hintStyle: FontApp.primaryStyle
                        .copyWith(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    fillColor: Colors.white.withOpacity(0.1)),
              ),
            );
          },
        );
      },
    );
  }
}

class TextEditAddHeight extends StatelessWidget {
  const TextEditAddHeight({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => Container(),
          loadSuccess: (valueState) {
            context.read<ProfileFormBloc>().add(
                ProfileFormEvent.heightChanged(valueState.profile.height ?? 0));
            return SizedBox(
              width: MediaQuery.sizeOf(context).width - 400 / 2,
              height: 50,
              child: TextFormField(
                validator: (value) => context
                    .read<ProfileFormBloc>()
                    .state
                    .form
                    .height!
                    .value
                    .fold(
                        (l) => l.maybeMap(
                              invalidNumber: (value) => 'Invalid Height',
                              orElse: () => null,
                            ),
                        (r) => null),
                onChanged: (value) => context
                    .read<ProfileFormBloc>()
                    .add(ProfileFormEvent.heightChanged(int.parse(value))),
                initialValue: valueState.profile.height == null
                    ? null
                    : '${valueState.profile.height}',
                textAlign: TextAlign.end,
                style: FontApp.primaryStyle
                    .copyWith(color: Colors.white, fontSize: 15),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'Add Height',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    hintStyle: FontApp.primaryStyle
                        .copyWith(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    fillColor: Colors.white.withOpacity(0.1)),
              ),
            );
          },
        );
      },
    );
  }
}

class TextAddEditBirthday extends StatelessWidget {
  const TextAddEditBirthday({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
          orElse: () => Container(),
          loadSuccess: (valueState) {
            context.read<ProfileFormBloc>().add(
                ProfileFormEvent.birthdayChanged(
                    valueState.profile.birthday == ''
                        ? ''
                        : valueState.profile.birthday!));
            return SizedBox(
              width: MediaQuery.sizeOf(context).width - 400 / 2,
              height: 50,
              child: TextFormField(
                validator: (value) => context
                    .read<ProfileFormBloc>()
                    .state
                    .form
                    .birthday!
                    .value
                    .fold(
                        (l) => l.maybeMap(
                              empty: (value) => 'Cannot be empty',
                              invalidBirthday: (value) => 'Invalid Birthday',
                              orElse: () => null,
                            ),
                        (r) => null),
                onChanged: (value) => context
                    .read<ProfileFormBloc>()
                    .add(ProfileFormEvent.birthdayChanged(value)),
                initialValue: valueState.profile.birthday == ''
                    ? ''
                    : formatDate('${valueState.profile.birthday}'),
                inputFormatters: [DateTextInputFormatter()],
                textAlign: TextAlign.end,
                style: FontApp.primaryStyle
                    .copyWith(color: Colors.white, fontSize: 15),
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                    filled: true,
                    hintText: 'DD MM YYYY',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    hintStyle: FontApp.primaryStyle
                        .copyWith(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    fillColor: Colors.white.withOpacity(0.1)),
              ),
            );
          },
        );
      },
    );
  }
}

class TextEditAddName extends StatelessWidget {
  const TextEditAddName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.maybeMap(
            orElse: () => Container(),
            loadSuccess: (valueState) {
              context.read<ProfileFormBloc>().add(ProfileFormEvent.nameChanged(
                  valueState.profile.name == ''
                      ? ''
                      : valueState.profile.name!));
              return SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
                  validator: (value) => context
                      .read<ProfileFormBloc>()
                      .state
                      .form
                      .name!
                      .value
                      .fold(
                          (l) => l.maybeMap(
                                empty: (value) => 'Cannot be empty',
                                singleLine: (value) => 'Invalid Name',
                                orElse: () => null,
                              ),
                          (r) => null),
                  onChanged: (value) {
                    context
                        .read<ProfileFormBloc>()
                        .add(ProfileFormEvent.nameChanged(value));
                    debugPrint(value);
                  },
                  initialValue: valueState.profile.name == ''
                      ? ''
                      : valueState.profile.name,
                  textAlign: TextAlign.end,
                  style: FontApp.primaryStyle
                      .copyWith(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    hintText: 'Enter Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey.shade400)),
                    hintStyle: FontApp.primaryStyle
                        .copyWith(color: Colors.white.withOpacity(0.3)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorApp.darkAccent)),
                    fillColor: Colors.white.withOpacity(0.1),
                  ),
                ),
              );
            });
      },
    );
  }
}

class CardProfile extends StatelessWidget {
  const CardProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Container(
          height: 200,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: ColorApp.darkAccent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                Positioned(
                    bottom: 0,
                    child: state.maybeMap(
                      orElse: () => Text(
                        '@username',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      ),
                      loadInProgress: (value) => Text(
                        '...',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      ),
                      loadSuccess: (value) => Text(
                        value.profile.username ?? '',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      ),
                      loadFailure: (value) => Text(
                        '@failure',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      ),
                      initial: (value) => Text(
                        '...',
                        style:
                            FontApp.primaryStyle.copyWith(color: Colors.white),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
