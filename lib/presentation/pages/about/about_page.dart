import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp_test/application/authentication/authentication_bloc.dart';
import 'package:youapp_test/application/profile/profile_bloc.dart';
import 'package:youapp_test/injection.dart';
import 'package:youapp_test/presentation/pages/about/helper/datetime_formatter.dart';
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
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: ColorApp.darkCard, borderRadius: BorderRadius.circular(15)),
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
                      fontSize: 15),
                ),
                IconButton(
                    onPressed: () {
                      getIt<AppRouter>().replace(const InterestRoute());
                    },
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
            Text(
              'Add in your interest to find a better match',
              style: FontApp.primaryStyle
                  .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
            )
          ],
        ),
      ),
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
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: !isTap ? 700 : 120,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
          color: ColorApp.darkCard, borderRadius: BorderRadius.circular(15)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return state.maybeMap(
            orElse: () => Container(),
            loadSuccess: (value) {
              if (value.profile.birthday == null &&
                  value.profile.height == null &&
                  value.profile.weight == null &&
                  value.profile.interest == null &&
                  value.profile.name == null) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      onEdit();
                                    },
                                    child: Text(
                                      'Save & Edit',
                                      style: FontApp.primaryStyle.copyWith(
                                          color: Colors.yellow.shade600),
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
                            ? const FormEditAddAbout()
                            : Text(
                                'Add in your your to help others know you better',
                                style: FontApp.primaryStyle.copyWith(
                                    color: const Color.fromARGB(
                                        255, 151, 151, 151)),
                              )
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          );
        },
      ),
    );
  }
}

class FormEditAddAbout extends StatefulWidget {
  const FormEditAddAbout({
    super.key,
  });

  @override
  State<FormEditAddAbout> createState() => _FormEditAddAboutState();
}

class _FormEditAddAboutState extends State<FormEditAddAbout> {
  String selectValueGender = 'Select Gender';

  @override
  Widget build(BuildContext context) {
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
                style: FontApp.primaryStyle.copyWith(color: Colors.white),
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
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
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
                'Gender',
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
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
                          style: FontApp.primaryStyle
                              .copyWith(color: Colors.white.withOpacity(0.3)),
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
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
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
                'Horoscope',
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.end,
                  style: FontApp.primaryStyle
                      .copyWith(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Horoscope',
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
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.end,
                  style: FontApp.primaryStyle
                      .copyWith(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      filled: true,
                      hintText: 'Zodiac',
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
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.end,
                  style: FontApp.primaryStyle
                      .copyWith(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.text,
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
                'Weight',
                style: FontApp.primaryStyle
                    .copyWith(color: const Color.fromARGB(255, 151, 151, 151)),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width - 400 / 2,
                height: 50,
                child: TextFormField(
                  textAlign: TextAlign.end,
                  style: FontApp.primaryStyle
                      .copyWith(color: Colors.white, fontSize: 15),
                  keyboardType: TextInputType.text,
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
              )
            ],
          ),
          //!end form input
        ],
      ),
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
