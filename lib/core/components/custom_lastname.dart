import 'package:flutter/material.dart';

class CustomLastname extends StatelessWidget {
  const CustomLastname({super.key});

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your last name';
            }
            return null;
        },
         decoration: InputDecoration(
             border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(4),
                 borderSide: BorderSide.none 
            ),
             hintText: "Lastname",
             filled: true,
             hintStyle: TextStyle(color: Color.fromRGBO(39, 39, 39, 0.5)),
             fillColor: Color.fromRGBO(236, 236, 236, 0.5)
             
         )
      ),
    );
  }
}