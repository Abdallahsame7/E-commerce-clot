import 'package:flutter/material.dart';

class CustomPassword extends StatefulWidget {
  final TextEditingController passwordController;
  const CustomPassword({super.key, required this.passwordController});

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
      bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.2),
             spreadRadius: 1,
             blurRadius: 1,
             offset: Offset(1, 1)
           )
         ]
       ),
      child: TextFormField(
        controller:widget.passwordController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
            }  else if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
        },
        obscureText: !clicked,
         decoration: InputDecoration(
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4),
                 borderSide: BorderSide.none 
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  clicked = !clicked;
                });
            }, 
            icon: Icon(
              clicked ? Icons.visibility : Icons.visibility_off
            )
            ),
      
             hintText: "Password",
             filled: true,
             hintStyle: TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
             fillColor: Color.fromRGBO(236, 236, 236, 0.5),
      
         )
      ),
    );
  }
}