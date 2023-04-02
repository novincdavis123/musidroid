import 'package:flutter/material.dart';
import 'package:musidroid/db/SQLHelper.dart';
import 'Loginscreen.dart';

class RegPage extends StatefulWidget {
  @override
  State<RegPage> createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  var formkey = GlobalKey<FormState>();

  var showpass = true;
  var confirmpass;

  final email = TextEditingController();
  final pass = TextEditingController();
  //final copass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void NewUser(String email, String password) async {
      var id = await SQLHelper.addNewUser(email, password);
      if (id != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      }
    }

    return Scaffold(
      /*appBar: AppBar(title: Text("LOGIN SCREEN")
      ),*/
      body: Form(
        key: formkey,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40),
              child: Text(
                "REGISTRATION PAGE",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Please enter your email Id',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (email) {
                  if (email!.isEmpty || !email.contains("@gmail.com")) {
                    return "Enter a Vaild email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: TextFormField(
                controller: pass,
                obscureText: showpass,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Please enter your password',
                    prefixIcon: const Icon(Icons.password_rounded),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (showpass) {
                              showpass = false;
                            } else {
                              showpass = true;
                            }
                          });
                        },
                        icon: Icon(showpass == true
                            ? Icons.visibility
                            : Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (password) {
                  confirmpass = password;
                  if (password!.isEmpty || password.length < 5) {
                    return "Password is Invalid";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ElevatedButton(
                  onPressed: () {
                    final valid = formkey.currentState!.validate();
                    if (valid) {
                      NewUser(email.text, pass.text);
                    } else {
                      return null;
                    }
                  },
                  child: const Text("SIGN UP")),
            ),
            Padding(
                padding: EdgeInsets.only(top: 7),
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Login Here')))
          ],
        ),
      ),
    );
  }
}

///Immutable : No change happens
///In Stateful we use createState to change the screen to mutable state.
///Mutable   : Changes Happen
