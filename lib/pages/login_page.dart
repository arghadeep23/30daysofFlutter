import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name="";
  bool changeButton = false;
  final _formKey=GlobalKey<FormState>();
  moveToHome(BuildContext context) async
  {
    if(_formKey.currentState!.validate()){
    setState((){changeButton=true;});
                  await Future.delayed(Duration(seconds:1));
                  await Navigator.pushNamed(context,MyRoutes.homeRoute);
                  setState((){changeButton=false;});}
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color:Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
          children: [Image.asset("assets/images/undraw_hey_email_liaa.png",fit: BoxFit.cover
          ),
          SizedBox(
            height:30,
            child: Text("Hi")
          ),
          Text("Welcome $name",style:TextStyle(
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
            ),
            validator: (value) {
              if(value!.isEmpty)
              {
                return "Username cannot be empty";
              }
            },
            onChanged: (value) {name=value; setState((){});
            },
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password", labelText: "Password",
              ),
              validator: (value) {
              if(value!.isEmpty)
              {
                return "Password cannot be empty";
              }
              else if(value.length<6)
              {
                return "Password length should be at least 6";
              }
            },
            ),
            SizedBox(height:40.0,),
            // We can either make the box clickable by using GestureDetector or InkWell , however InkWell shows some animation 
            // that the box is clicked, while the former doesn't
            Material(
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(changeButton?50:5),
              child: InkWell(
                onTap:() => moveToHome(context),                         
                child: AnimatedContainer(
                  duration: Duration(seconds:1),
                  width : changeButton?50:150,
                  height: 40,
                  alignment: Alignment.center,
                  child: changeButton?Icon(Icons.done,color:Colors.white):Text("Login", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold, fontSize: 15)
                  ),
                ),
              ),
            ),
          ],))
          ],
              ),
        )
      )
    );
  }
}