import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      Navigator.of(context).pushNamed('/Signin');
    }
  }

 

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double text = MediaQuery.textScaleFactorOf(context);

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: RichText(
                  text: TextSpan(
                      text: "SignUp",
                      style: TextStyle(
                        fontSize: text * 27,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Holtwood One SC',
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '>>>',
                          style: TextStyle(
                            fontSize: text * 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Holtwood One SC',
                            color: Colors.deepOrange,
                          ),
                        ),
                      ]),
                ),
              ),
              Container(
                height: height * 0.9,
                width: width * 1.2,
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.1, vertical: height * 0.1),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorHeight: 3.0,
                        decoration: InputDecoration(
                          hintText: 'Name',
                          // labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: (BorderRadius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          filled: true,
                          fillColor: Colors.deepOrange,
                          prefixIcon: Icon(Icons.person),
                        ),
                        validator: MultiValidator([
                          RequiredValidator(errorText: "This field is Required"),
                        ]),
                      ),
                      SizedBox(height: height * 0.03),
                      TextFormField(
                       
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorHeight: 3.0,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          // labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: (BorderRadius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          filled: true,
                          fillColor: Colors.deepOrange,
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator:  MultiValidator([
                          EmailValidator(errorText: "not valid"),
                          RequiredValidator(errorText: "This field is Required"),
                        ]),
                      ),
                      SizedBox(height: height * 0.03),
                      TextFormField(
                        obscureText: true,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        cursorHeight: 3.0,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          // labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: (BorderRadius.circular(25.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          filled: true,
                          fillColor: Colors.deepOrange,
                          prefixIcon: Icon(Icons.security),
                        ),
                        validator: MultiValidator([
                           RequiredValidator(errorText: "This field is Required"),
                           MinLengthValidator(6, errorText: "At least 6 characters Required"),
                         ]),

                      ),
                      SizedBox(height: height * 0.04),
                      Container(
                        height: height * 0.08,
                        width: width * 1.2,
                        child: RaisedButton(
                          onPressed: validate,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: text * 23.0,
                                fontWeight: FontWeight.bold),
                          ),
                          color: Colors.yellow[700],
                        ),
                      ),
                     
                      SizedBox(height: height * 0.02),
                      Container(
                        child: SignInButton(
                          Buttons.Google,
                          text: "Sign up with Google",
                          elevation: 2.8,
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
