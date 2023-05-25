import 'dart:io';
import 'dart:ui';
import 'package:Dyzr/bean/User.dart';
import 'package:Dyzr/services/firebase_service.dart';
import 'package:Dyzr/styles/colors.dart';
import 'package:Dyzr/widgets/input_text.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Dyzr/responsive.dart';
import 'package:Dyzr/services/firebase_service_changes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import '../../services/google_sign_in.dart';
import '../main_desktop/my_window.dart';
import 'package:Dyzr/bean/User.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  //final _emailController = TextEditingController();
  //final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  String _email = '';
  String _password = '';

  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  late bool _isChecked = false;

  double _containerPass = 55, _containerEmail = 55;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _dialogFuture() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          title: const Text(
            'Coming soon',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  'This feature is coming soon.',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> passwordReset() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Please enter your email'),
          );
        },
      );
      return;
    }

    if (!EmailValidator.validate(email)) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Please enter a valid email'),
          );
        },
      );
      return;
    }

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Password reset email sent'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage =
          'An error occurred while sending the password reset email.';

      if (e.code == 'user-not-found') {
        errorMessage =
            'User not found. Please check your email address and try again.';
      } else if (e.code == 'invalid-email') {
        errorMessage =
            'Invalid email address. Please enter a valid email address and try again.';
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(errorMessage),
          );
        },
      );
    }
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: MyColors.darkGray,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// Close button
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'We will send you an email to reset your password!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                MaterialButton(
                  onPressed: passwordReset,
                  color: MyColors.mainGreen,
                  child: const Text('Reset Password'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //final email = _emailController.text.trim();
      //final password = _passwordController.text.trim();

      final email = _email.trim();
      final password = _password.trim();

      if (kIsWeb ||
          !(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        if (await signIn(email, password)) {
          if (_isChecked) {
            saveData(email, password);
          }
          goToHome();
        }
      } else {
        if (await getPeopleWindows(email, password)) {
          goToHome();
        }
      }

      // Agregar Login AQUI
      print("Email: " + email);
      print("Password: " + password);
    }
  }

  Future<void> saveData(String email, String passwords) async {
    final storage = FileStorage();
    await storage.saveUser(email, passwords);
  }

  void goToHome() {
    Navigator.pushReplacementNamed(
        context, Responsive.isMobile(context) ? '/home' : "/home_desk");
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    bool isHiddenPass = true;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.7),
      body: Column(
        children: [
          if (!kIsWeb && Platform.isWindows)
            WindowTitleBarBox(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: MyColors.mainGreenDark,
                        ),
                        child: MoveWindow()),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: MyColors.mainGreenDark,
                    ),
                    child: const WindowButtons(),
                  ),
                ],
              ),
            ),
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/icons/fondo.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Center(
                  child: LayoutBuilder(builder:
                      (BuildContext context, BoxConstraints constraints) {
                    return SingleChildScrollView(
                      controller: _scrollController,
                      child: Container(
                        width: 500,
                        color: isMobile ? null : Colors.black.withOpacity(0.7),
                        padding: EdgeInsets.all(isMobile ? 40 : 80),
                        child: Form(
                          key: _formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Divider(
                                    color: Colors.transparent,
                                    height: isMobile ? 30 : 0),

                                /// Texto de bienvenida
                                const Text(
                                  'Start sharing \nyour music',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w600,
                                    height: 1.1,
                                  ),
                                  textAlign: TextAlign.center,
                                ),

                                const Divider(
                                    color: Colors.transparent, height: 40),

                                /// Email input
                                Container(
                                  height: _containerEmail,
                                  decoration: const BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: InputText(
                                    label: 'Username or Email',
                                    icon: const Icon(Icons.email),
                                    keyboard: TextInputType.emailAddress,
                                    onChanged: (data) {
                                      _email = data;
                                    },
                                    validator: (data) {
                                      if (data == null || data.isEmpty) {
                                        setState(() {
                                          _containerEmail = 80;
                                        });
                                        return 'Por favor ingrese su correo electrónico';
                                      } /*else if (!data.contains('@') ||
                                          !data.contains('.')) {
                                        setState(() {
                                          _containerEmail = 80;
                                        });
                                        return 'Por favor ingrese un correo electrónico válido';
                                      }*/
                                      setState(() {
                                        _containerEmail = 50;
                                      });
                                      return null;
                                    },
                                  ),
                                ),

                                const Divider(
                                    color: Colors.transparent, height: 20),

                                /// Password input
                                Container(
                                  height: _containerPass,
                                  decoration: const BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  child: InputText(
                                    label: 'Password',
                                    obscureText: isHiddenPass,
                                    showPassword: true,
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: MyColors.darkGray,
                                    ),
                                    onChanged: (data) {
                                      _password = data;
                                    },
                                    validator: (data) {
                                      if (data!.trim().length < 8) {
                                        setState(() {
                                          _containerPass = 80;
                                        });
                                        return 'Invalid password';
                                      }
                                      setState(() {
                                        _containerPass = 50;
                                      });
                                      return null;
                                    },
                                  ),
                                ),

                                const Divider(
                                    color: Colors.transparent, height: 0),

                                /// Remember me and forgot password
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          'Remember me',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 2.5),
                                          child: Checkbox(
                                            value: _isChecked,
                                            fillColor:
                                                MaterialStateProperty.all(
                                                    Colors.grey.shade600),
                                            activeColor: Colors.blueGrey,
                                            onChanged: (value) {
                                              setState(() {
                                                _isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      alignment: Alignment.centerRight,
                                      child: InkWell(
                                        onTap: () {
                                          showMyDialog();
                                        },
                                        child: const Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Agrega aquí cualquier otro widget que quieras incluir a la derecha del CheckboxListTile
                                  ],
                                ),
                                const Divider(
                                    color: Colors.transparent, height: 20),

                                /// Login button
                                InkWell(
                                  onTap: () => _submitForm(context),
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border(
                                        top: BorderSide(
                                          color: Colors.black45,
                                          width: 2,
                                        ),
                                        left: BorderSide(
                                          color: Colors.black45,
                                          width: 2,
                                        ),
                                        right: BorderSide(
                                          color: Colors.black45,
                                          width: 2,
                                        ),
                                        bottom: BorderSide(
                                          color: Colors.black45,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                    child: const Center(
                                      heightFactor: 1.1,
                                      child: Text(
                                        "Listen in",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                ),
                                const Divider(
                                    color: Colors.transparent, height: 25),

                                /// OR CONTINUE WITH
                                const Text(
                                  'OR CONTINUE WITH',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const Divider(
                                    color: Colors.transparent, height: 25),

                                /// Social media buttons
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        final user =
                                            await GoogleSignInApi.login();
                                        if (user == null) {
                                        } else {
                                          setnameUser(
                                              user.displayName.toString(),
                                              user.email);
                                          Navigator.pushReplacementNamed(
                                              context, '/home');
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(13),
                                        decoration: const BoxDecoration(
                                          color: Colors.deepOrange,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Google",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                        color: Colors.transparent, height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: InkWell(
                                            onTap: () => _dialogFuture(),
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              decoration: const BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Twitter",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Expanded(
                                          flex: 1,
                                          child: SizedBox(),
                                        ),
                                        Expanded(
                                          flex: 7,
                                          child: InkWell(
                                            onTap: () => _dialogFuture(),
                                            child: Container(
                                              padding: const EdgeInsets.all(13),
                                              decoration: const BoxDecoration(
                                                color: MyColors.facebook,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  "Facebook",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                    color: Colors.transparent, height: 30),

                                /// Sign up
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/signup');
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text("Don't have an account?",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 10),
                                      Text("Sign up",
                                          style: TextStyle(
                                              color: Colors.lightBlue,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
