import 'package:flutter/material.dart';
import 'package:registration/forgotpassword.dart';
import 'package:registration/home.dart';
import 'package:registration/profile.dart';
import 'package:registration/registration.dart';
import 'package:registration/services/firebase_auth_service.dart';

class LoginPage extends StatefulWidget {

  

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        SizedBox(height: 50,
        ),
        Text("Welcome Back",
      style: TextStyle(color: Colors.black,
      fontSize: 30,fontWeight: FontWeight.bold,
      ),
      ),
      Text("Enter your credentials to login",
      style: TextStyle(color: Colors.black,
      fontSize: 12,fontWeight: FontWeight.normal
      ),
      ),
      SizedBox(height: 25,
      ),
     Container(
  margin: EdgeInsets.symmetric(
    horizontal: 30,
  ),
  child: TextField(
    controller: emailController,
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.person,
        color: Color.fromARGB(255, 38, 82, 104),
      ),
      hintText: "Email",
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 38, 82, 104),
        fontSize: 15,
      ),
      filled: true,
      fillColor: Color.fromARGB(255, 141, 211, 199),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.all(12),
    ),
  ),
),
SizedBox(
  height: 20,
),
Container(
  margin: EdgeInsets.symmetric(
    horizontal: 30,
  ),
  child: TextField(
    controller: passwordController,
    obscureText: true, // For password fields
    decoration: InputDecoration(
      prefixIcon: Icon(
        Icons.password,
        color: Color.fromARGB(255, 38, 82, 104),
      ),
      hintText: "Password",
      hintStyle: TextStyle(
        color: Color.fromARGB(255, 38, 82, 104),
        fontSize: 15,
      ),
      filled: true,
      fillColor: Color.fromARGB(255, 141, 211, 199),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.all(12),
    ),
  ),
),
SizedBox(height: 20,),
ElevatedButton(
  style: ElevatedButton.styleFrom(
  backgroundColor: Color.fromARGB(255, 23, 87, 73),
  padding:EdgeInsets.symmetric(horizontal: 130,vertical: 12),
  ),
  onPressed:()async{
    setState(() {
      isLoading = true;
    });
   await login (email: emailController.text, 
    password: passwordController.text,
    context: context);
    setState(() {
      isLoading = false;
    });
    },
 child: isLoading ? CircularProgressIndicator() :Text("Login",style: TextStyle(fontSize: 20,color: Colors.white),),

),
SizedBox(height: 30,),

GestureDetector(
  onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>ForgotPassword()) );
    },
    child: Text("Forgot password?",style: TextStyle(
      fontSize: 15,color:  Color.fromARGB(255, 27, 90, 60)),)),
    SizedBox(height: 50),
    Text("Don't have an account?"),
    GestureDetector(
  onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context)=>Registration()) );
    },
    child: Text("Sign Up",style: TextStyle(
      fontSize: 15,color: Color.fromARGB(255, 27, 90, 60)
    ),),),
  ],
  ),
  );
  }
}