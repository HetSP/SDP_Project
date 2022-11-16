import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sdp_project/Services/controller.dart';
import 'package:sdp_project/main.dart';
import 'package:sdp_project/pages/loading.dart';
import 'package:sdp_project/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';



class Login extends StatelessWidget {

  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        title: Text("Login",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget{
  State<MyStatefulWidget> createState() => StateWidget();
}

class StateWidget extends State<MyStatefulWidget>{

  Controller ctrl = new Controller();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget build(BuildContext context){
    double w = MediaQuery.of(context).size.width;
    double h =  MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: w*0.8,
                height: h*0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/loginpage.gif'),
                    )
                  ),
              ),
            ),
            SizedBox(height: h*0.01,),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Sign in",
                      style: TextStyle(
                        fontSize: w*0.1,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            // SizedBox(),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(0, 0, 255, 1),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  labelText: "Username/Email",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(w*0.06, h*0.01, w*0.06, h*0.01),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(0, 0, 255, 1),
                      ),
                      borderRadius: BorderRadius.circular(25),
                    ),
                  labelText: "Password",
                  labelStyle: TextStyle(
                    fontSize: 18,
                  ),
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
              ),
            ),
            SizedBox(
              height: h*0.04,
            ),
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    String email = emailController.text.toString().trim();
                    String password = passwordController.text.toString().trim();
                    print("Email:  " + email +  " Password : " + password);
                    bool flag = false;
                    try{
                      FirebaseFirestore.instance
                          .collection('users')
                          .get()
                          .then((QuerySnapshot querySnapshot) {
                        querySnapshot.docs.forEach((doc) {
                          // print( "Username : " + doc["username"]);
                          if((doc["email"] == email || doc["username"] == email)&& doc["password"] == password){
                            if(!flag){
                              flag = true;
                              ctrl.setLogin(email);
                            }
                            print("Login Successful!!");
                            Navigator.pushNamed(context, '/mainPage');
                          }
                        });

                      });
                    }
                    catch(Exception){
                      AlertDialog(
                        title: Text('Invalid Credentials'),
                      );
                    }
                    AlertDialog(
                      title: Text('Invalid Credentials'),
                    );
                    print("Invalid credentials");

                    // Navigator.pushNamed(context, "/signup");
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30,15,30,15),
                    child: Text("Login",
                    style: TextStyle(
                      fontSize: 20,
                    ),),
                  ),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                          )
                      )
                  )
              ),
            ),
            SizedBox(height: h*0.17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, '/mainPage');
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don\'t have an account? ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}