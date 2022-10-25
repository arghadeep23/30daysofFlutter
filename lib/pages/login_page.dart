import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child: SingleChildScrollView(
        child: Column(
        children: [Image.asset("assets/images/undraw_secure_login_pdn4.png",fit: BoxFit.cover
        ),
        SizedBox(
          height:30,
          child: Text("Hi")
        ),
        Text("Welcome",style:TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
        child: Column(children: [
          TextFormField(
          decoration: InputDecoration(
            hintText: "Enter Username", labelText: "Username",
          ),),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter Password", labelText: "Password",
            )
          ),
          SizedBox(height:40.0,),
          ElevatedButton(
            child: Text("Login"),
            style: TextButton.styleFrom(minimumSize: Size(150,40)),
            onPressed: (){Navigator.pushNamed(context,MyRoutes.homeRoute);},
          )
        ],))
        ],
      )
      )
    );
  }
}