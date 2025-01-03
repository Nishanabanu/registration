import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration/bottom_navigation_screen.dart';
import 'package:registration/profile.dart';

Future<void> signup({
  required String username,
required String email,
required BuildContext context,
required String password})async{
 try{
  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
  Navigator.push(context,
    MaterialPageRoute(builder: (context)=>BottomNavigation()) );
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Registration Successful...")));

 }catch(e)  {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString())));
   
 }
}


Future<void>login({required String email,required String password,required context})async{
  try{
  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  Navigator.push(context,
    MaterialPageRoute(builder: (context)=>BottomNavigation()) );
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successful...")));

 }catch(e)  {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text(e.toString())));
   
 }

}