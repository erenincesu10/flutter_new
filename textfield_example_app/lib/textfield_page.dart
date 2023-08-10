import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTextfieldPage extends StatefulWidget {
  const MyTextfieldPage({super.key});

  @override
  State<MyTextfieldPage> createState() => _MyTextfieldPageState();
}

class _MyTextfieldPageState extends State<MyTextfieldPage> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  bool emailValid = false;
  final _emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

   void _validateEmail(String email) {
    setState(() {
      emailValid = _emailRegExp.hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Textfield App"),
      ),
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.blue,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white60,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
              width: 2
            )
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.normal,fontStyle: FontStyle.normal,decoration: TextDecoration.none),

                    labelText: "Enter Name-Surname"
                  ),
                  onSubmitted: (value) {
                    FocusScope.of(context).unfocus();
                  },
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: 20,),
                TextFormField(
                                  onChanged: (value) {
                _validateEmail(value);
              },
                  style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),
                  controller: _emailController,
                  decoration: InputDecoration(
                                        labelStyle: TextStyle(fontStyle: FontStyle.normal,decoration: TextDecoration.none),

                    labelText: "Enter Email",
                    errorText: !emailValid ? "Check email" : null
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  style: TextStyle(color: Colors.green,decoration: TextDecoration.underline),
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontStyle: FontStyle.normal,decoration: TextDecoration.none),
                    labelText: "Enter Phone Number"
                  ),
                  
                  keyboardType: TextInputType.phone,
                  maxLines: 1,
                  maxLength: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}