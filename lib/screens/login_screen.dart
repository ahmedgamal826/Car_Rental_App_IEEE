import 'package:cars_rental_app/screens/home_page.dart';
import 'package:cars_rental_app/screens/register_screen.dart';
import 'package:cars_rental_app/widget/custom_row.dart';
import 'package:cars_rental_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool show = true;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: widget.formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: ListView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'assets/car_login.png',
                  width: 200,
                ),
                Center(
                  child: Text(
                    'Login Now',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: widget.emailController,
                  label: 'Email',
                  validatorMessage: 'Email is required',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: widget.passwordController,
                  label: 'Password',
                  validatorMessage: 'Password is required',
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.blue),
                      onPressed: () {
                        setState(() {
                          if (widget.formKey.currentState!.validate()) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) => HomePage()));
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )),
                ),
                CustomRow(
                    txt: "don't have an account?",
                    buttonText: "Register Now",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterSCreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
