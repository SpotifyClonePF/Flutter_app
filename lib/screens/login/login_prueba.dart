import 'dart:io';
import 'dart:ui';
import 'package:Sound2U/services/firebase_service.dart';
import 'package:Sound2U/styles/colors.dart';
import 'package:Sound2U/widgets/input_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Sound2U/responsive.dart';
import 'package:Sound2U/services/firebase_service_changes.dart';

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

  late bool _isChecked = false;

  double _containerPass = 50, _containerEmail = 50;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submitForm(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      //final email = _emailController.text.trim();
      //final password = _passwordController.text.trim();

      final email = _email.trim();
      final password = _password.trim();

      if (kIsWeb ||
          !(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
        if (await getPeople(email, password)) {
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/fondo.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Center(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
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

                          const Divider(color: Colors.transparent, height: 40),

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

                          const Divider(color: Colors.transparent, height: 20),

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

                          const Divider(color: Colors.transparent, height: 0),

                          /// Remember me and forgot password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    padding: const EdgeInsets.only(top: 2.5),
                                    child: Checkbox(
                                      value: _isChecked,
                                      fillColor: MaterialStateProperty.all(
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
                                    //Navigator.pushNamed(context, '/forgot-password');
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
                          const Divider(color: Colors.transparent, height: 20),

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
                          const Divider(color: Colors.transparent, height: 25),

                          /// OR CONTINUE WITH
                          const Text(
                            'OR CONTINUE WITH',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const Divider(color: Colors.transparent, height: 25),

                          /// Social media buttons
                          Column(
                            children: [
                              InkWell(
                                onTap: () => _submitForm(context),
                                child: Container(
                                  padding: const EdgeInsets.all(13),
                                  decoration: const BoxDecoration(
                                    color: Colors.deepOrange,
                                    /*border: Border(
                                      top: BorderSide(
                                          width: 3.0, color: Colors.black45),
                                      left: BorderSide(
                                          width: 3.0, color: Colors.black45),
                                      right: BorderSide(
                                          width: 3.0, color: Colors.black45),
                                      bottom: BorderSide(
                                          width: 3.0, color: Colors.black45),
                                    ),*/
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                      onTap: () => _submitForm(context),
                                      child: Container(
                                        padding: const EdgeInsets.all(13),
                                        decoration: const BoxDecoration(
                                          color: Colors.blue,
                                          /*border: Border(
                                            top: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            left: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                          ),*/
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Twitter",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
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
                                      onTap: () => _submitForm(context),
                                      child: Container(
                                        padding: const EdgeInsets.all(13),
                                        decoration: const BoxDecoration(
                                          color: MyColors.facebook,
                                          /*border: Border(
                                            top: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            left: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                          ),*/
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Facebook",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
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
                          const Divider(color: Colors.transparent, height: 30),

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
    );
  }
}
