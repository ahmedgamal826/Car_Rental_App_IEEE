import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField({
    super.key,
    required this.validatorMessage,
    required this.label,
    required this.controller,
  });

  final TextEditingController controller;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool show = true;

  final String validatorMessage;
  final String label;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        obscureText:
            widget.label == 'Password' || widget.label == 'Confirm Password'
                ? widget.show
                : false,
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.validatorMessage}';
          }
          return null;
        },
        controller: widget.controller,
        keyboardType: (() {
          switch (widget.label) {
            case 'ID':
              return TextInputType.number;
              break;

            case 'Phone':
              return TextInputType.number;

            case 'Name':
              return TextInputType.text;

            case 'Emai':
              return TextInputType.emailAddress;

            case 'Password':
              return TextInputType.visiblePassword;

            case 'Confirm Password':
              return TextInputType.visiblePassword;

            // Add more cases as needed with breaks
            default:
              return TextInputType.text;
          }
        })(),
        cursorColor: Colors.blue,
        decoration: InputDecoration(
          suffixIcon:
              widget.label == 'Password' || widget.label == 'Confirm Password'
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          widget.show = !widget.show;
                        });
                      },
                      icon: Icon(Icons.remove_red_eye,
                          color: widget.show ? Colors.grey[500] : Colors.blue),
                    )
                  : const Text(''),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue)),
          label: Text(
            '${widget.label}',
            style: const TextStyle(color: Colors.grey),
          ),
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
