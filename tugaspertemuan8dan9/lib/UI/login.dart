import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home.dart';
import 'package:tugaspertemuan8dan9/provider/change_notifier.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isObesecure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            FontAwesomeIcons.github,
            size: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20),
            child: Text("Username")
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autofocus: false,
              controller: usernameController,
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2.0)
                ),
                focusColor: Colors.white,
                border: OutlineInputBorder(),
                hintText: 'Type Your Username here...',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: 20),
            child: Text("Password")
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              autofocus: false,
              controller: passwordController,
              obscureText: context.watch<stateManagement>().isObsecure,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2.0)
                ),
                focusColor: Colors.white,
                hintText: 'Type Your Password here...',
                suffixIcon: IconButton(
                  onPressed: () => context.read<stateManagement>().obsecure(),
                  icon: Icon(isObesecure?Icons.remove_red_eye:Icons.remove_red_eye_outlined)
                ),
                
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.black),),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder:(context) => const homePage(), ));
              },
              child: const Text('LOGIN',style: TextStyle(fontWeight: FontWeight.w700),),
            ),
          )
        ],
      ),
    );
  }
}