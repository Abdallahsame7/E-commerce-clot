import 'package:flutter/material.dart';

class CustomEmailforget extends StatelessWidget {
      final TextEditingController emailController;

  const CustomEmailforget({super.key, required this.emailController});
  

  @override
  Widget build(BuildContext context) {
    String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@gmail\.com$").hasMatch(value)) {
      return 'Enter a valid @gmail.com email';
    }
    return null;
  }
    return Container(
       decoration: BoxDecoration(
         boxShadow: [
           BoxShadow(
             color: Colors.grey.withOpacity(0.2),
             spreadRadius: 1,
             blurRadius: 2,
             offset: Offset(2, 2)
           )
         ]
       ),
       child: TextFormField( 
        controller: emailController,
        validator: (value) {
          return validateEmail(value);
        }, 
         decoration: InputDecoration(
           border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(4),
               borderSide: BorderSide.none 
          ),
           hintText: "Email Address",
           filled: true,
           hintStyle: TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
           fillColor: Color.fromRGBO(236, 236, 236, 0.5)
           
       )
       )

    );
  }
}