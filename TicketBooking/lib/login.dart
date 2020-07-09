import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'services/GetLogin.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController passportNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.send),
        onPressed: () async {
          if (passportNumberController.text != '' &&
              passwordController.text != '') {
            // if a passWord and a passport number has enterd
            bool res = await GetLogin.login(
                passportNumberController.text, passwordController.text);
            if (res) {
              print("logged In");
              Toast.show(
                "Login successfull",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
              Navigator.popAndPushNamed(this.context, '/booking');
            } else {
              Toast.show(
                "Login Faild Please try again",
                this.context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
              );
            }
          } else {
            Toast.show(
              "Please fill Passport Number and Password",
              this.context,
              gravity: Toast.BOTTOM,
              duration: Toast.LENGTH_LONG,
            );
          }
        },
      ),
      appBar: AppBar(
        title: Text("Aeroplene ticket Booking"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Image.asset('assets/round-trip-ticket.gif'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter the passport no : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      controller: passportNumberController,
                      keyboardType: TextInputType.number,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Passport No",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Enter the Password : ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Enter the Password",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
