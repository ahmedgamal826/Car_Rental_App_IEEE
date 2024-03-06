import 'package:cars_rental_app/screens/home_page.dart';
import 'package:cars_rental_app/screens/login_screen.dart';
import 'package:cars_rental_app/widget/custom_row.dart';
import 'package:cars_rental_app/widget/custom_text_field.dart';
import 'package:flutter/material.dart';

class RegisterSCreen extends StatefulWidget {
  RegisterSCreen({super.key});

  TextEditingController nameController = TextEditingController(); // name
  TextEditingController idController = TextEditingController(); // id
  TextEditingController phoneController = TextEditingController(); // phone

  TextEditingController emailController = TextEditingController(); // Email
  TextEditingController passwordController =
      TextEditingController(); // Password
  TextEditingController ConfirmpasswordController =
      TextEditingController(); // Confirm Password

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool show = true;

  @override
  State<RegisterSCreen> createState() => _RegisterSCreenState();
}

class _RegisterSCreenState extends State<RegisterSCreen> {
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
                  height: 30,
                ),
                Image.asset(
                  'assets/car_login.png',
                  width: 200,
                ),
                Center(
                  child: Text(
                    "Let's create an account for you! ",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                ),
                CustomTextField(
                  controller: widget.nameController,
                  label: 'Name',
                  validatorMessage: 'Name is required',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: widget.idController,
                  label: 'ID',
                  validatorMessage: 'ID is required',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: widget.phoneController,
                  label: 'Phone',
                  validatorMessage: 'Phone is required',
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
                CustomTextField(
                  controller: widget.ConfirmpasswordController,
                  label: 'Confirm Password',
                  validatorMessage: 'Confirm Password is required',
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
                          if (widget.formKey.currentState!.validate() &&
                              widget.passwordController.text ==
                                  widget.ConfirmpasswordController.text) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          } else if (widget.passwordController.text !=
                              widget.ConfirmpasswordController.text) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('The passwords do not match')));
                          }
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      )),
                ),
                CustomRow(
                    txt: "already have an account?",
                    buttonText: "Login Now",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
