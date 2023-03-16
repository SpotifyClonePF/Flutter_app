import 'package:Sound2U/styles/colors.dart';
import 'package:Sound2U/widgets/input_text.dart';
import 'package:flutter/material.dart';

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
  bool _isScrollbarVisible = true;
  String _email = '';
  String _password = '';
  final bool _obscureText = true;

  final _passwordController = TextEditingController();

  late bool _isChecked = false;

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
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Center(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          _isScrollbarVisible =
              constraints.maxHeight < MediaQuery.of(context).size.height;
          return SizedBox(
            width: 450,
            height: _isScrollbarVisible && constraints.maxHeight > 800
                ? MediaQuery.of(context).size.height
                : null,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                color: Colors.deepPurple[300],
                padding: const EdgeInsets.all(40),
                child: Form(
                  key: _formKey,
                  //autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(color: Colors.transparent, height: 20),
                        const Text(
                          'Start sharing \nyour music',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const Divider(color: Colors.transparent, height: 40),
                        InputText(
                          label: 'Email',
                          icon: const Icon(Icons.email),
                          keyboard: TextInputType.emailAddress,
                          onChanged: (data) {
                            _email = data;
                          },
                          validator: (data) => data == null || data.isEmpty
                              ? 'Por favor ingrese su correo electrónico'
                              : !data.contains('@') || !data.contains('.')
                                  ? 'Por favor ingrese un correo electrónico válido'
                                  : null,
                        ),
                        const Divider(color: Colors.transparent, height: 20),
                        InputText(
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
                              return 'Invalid password';
                            }
                            return null;
                          },
                        ),
                        const Divider(color: Colors.transparent, height: 0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  'Remember me',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Checkbox(
                                  value: _isChecked,
                                  activeColor: Colors.deepPurple,
                                  onChanged: (value) {
                                    setState(() {
                                      _isChecked = value!;
                                    });
                                  },
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
                                    color: Colors.black54,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            // Agrega aquí cualquier otro widget que quieras incluir a la derecha del CheckboxListTile
                          ],
                        ),
                        const Divider(color: Colors.transparent, height: 10),
                        InkWell(
                          onTap: () => _submitForm(context),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                              color: Colors.deepPurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                            child: const Center(
                              child: Text(
                                "Listen in",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        const Divider(color: Colors.transparent, height: 25),
                        const Text(
                          'OR CONTINUE WITH',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Divider(color: Colors.transparent, height: 25),
                        // Buttons social media
                        InkWell(
                          onTap: () => _submitForm(context),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              border: Border(
                                top:
                                    BorderSide(width: 1.0, color: Colors.black),
                                left:
                                    BorderSide(width: 1.0, color: Colors.black),
                                right:
                                    BorderSide(width: 1.0, color: Colors.black),
                                bottom:
                                    BorderSide(width: 1.0, color: Colors.black),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)),
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
                        const Divider(color: Colors.transparent, height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 7,
                              child: InkWell(
                                onTap: () => _submitForm(context),
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
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
                                  padding: const EdgeInsets.all(15),
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    border: Border(
                                      top: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      left: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      right: BorderSide(
                                          width: 1.0, color: Colors.black),
                                      bottom: BorderSide(
                                          width: 1.0, color: Colors.black),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
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
                        const Divider(color: Colors.transparent, height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account?",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                print("Sign up");
                              },
                              child: const Text("Sign up",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// Correct Row example
/*
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const Text(
        "Don't have an account?",
        style: TextStyle(
            fontWeight: FontWeight.bold)
    ),
    const SizedBox(width: 10),
    InkWell(
      onTap: () {
        print("Sign up");
      },
      child: const Text(
          "Sign up",
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold)),
    ),
  ],
)
 */
