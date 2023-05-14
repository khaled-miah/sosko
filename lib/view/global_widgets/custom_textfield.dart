import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sosko/view/style/dimension_screen.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final bool isPasswordField;
  final  TextEditingController controller;

  const CustomTextField({
    Key key,
    this.hintText,
    this.icon,
    this.isPasswordField = false,
    this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _obscureText = false;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: DimensionScreen.geHeight(context, 65),
      decoration: BoxDecoration(
          color: Color(0xffF6F7FB), borderRadius: BorderRadius.circular(20)),
      child: TextField(
        controller: widget.controller,
        obscureText: _obscureText,
        textAlignVertical: TextAlignVertical.center,
        //textAlign: TextAlign.center,
        decoration: InputDecoration(
          prefixIcon: Icon(
            widget.icon,
            size: 22.0,
            color: Color(0xffCACACA),
          ),
          suffixIcon: widget.isPasswordField
              ? InkWell(
            onTap: (){
              _toggle();
            },
                child: Icon(
                  _obscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                    color: Color(0xffCACACA),
                  ),
              )
              : null,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(25)),
         /* contentPadding:
          EdgeInsets.symmetric(vertical: 22.0),*/
          hintText: widget.hintText,

        ),
      ),
    );
  }
}
