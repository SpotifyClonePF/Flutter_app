import 'dart:ui';
import 'package:flutter/material.dart';
import '../../styles/colors.dart';
import '../../widgets/input_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final ScrollController _scrollController = ScrollController();
  String _email = '';
  String _password = '';
  final bool _obscureText = true;
  final _passwordController = TextEditingController();
  late bool _isChecked = false;
  double _containerPass = 50, _containerEmail = 50;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //final email = _emailController.text.trim();
      //final password = _passwordController.text.trim();

      final email = _email.trim();
      final password = _password.trim();

      // Agregar Login AQUI
      print("Email: " + email);
      print("Password: " + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

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

                              const Divider(color: Colors.transparent, height: 50),

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
                                  label: 'Email',
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
                                    } else if (!data.contains('@') ||
                                        !data.contains('.')) {
                                      setState(() {
                                        _containerEmail = 80;
                                      });
                                      return 'Por favor ingrese un correo electrónico válido';
                                    }
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
                                  obscureText: true,
                                  showPassword: true,
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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

                              const Divider(color: Colors.transparent, height: 20),

                              /// Confirm Password input
                              Container(
                                height: _containerPass,
                                decoration: const BoxDecoration(
                                  color: Colors.black45,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: InputText(
                                  label: 'Confirm Password',
                                  obscureText: true,
                                  showPassword: true,
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
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

                              const Divider(color: Colors.transparent, height: 50),

                              /// Login button
                              InkWell(
                                onTap: () => _submitForm(context),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: Colors.blueGrey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)
                                    ),
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
                                      "SIGN UP",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(color: Colors.transparent, height: 25),
                              
                              /// Login
                              InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, '/login');
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text("Already have an account?",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)
                                    ),
                                    SizedBox(width: 10),
                                    Text("Login",
                                        style: TextStyle(
                                            color: Colors.lightBlue,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold)
                                    ),
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
