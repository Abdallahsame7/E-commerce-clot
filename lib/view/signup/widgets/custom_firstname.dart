import 'package:flutter/material.dart';

class CustomFirstname extends StatelessWidget {
  final TextEditingController firstname;
  const CustomFirstname({super.key, required this.firstname});

  @override
  Widget build(BuildContext context) {
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
        controller: firstname,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your first name';
            }
            return null;
        },
         decoration: InputDecoration(
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4),
                 borderSide: BorderSide.none 
            ),
             hintText: "Firstname",
             filled: true,
             hintStyle: TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
             fillColor: Color.fromRGBO(236, 236, 236, 0.5)
             
         )
      ),
    );
  }
}