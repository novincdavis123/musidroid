import 'package:flutter/material.dart';
import 'package:musidroid/db/SQLHelper.dart';
import 'package:musidroid/screens/Musihome.dart';
import 'package:musidroid/screens/Registration%20page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formkey = GlobalKey<FormState>();
  var showpass = true;
  final TextEditingController coemail = TextEditingController();
  final TextEditingController copass = TextEditingController();
  var email;
  var pass;

  void logincheck(String cemail, String cpass) async {
    setState(() {});
    var data = await SQLHelper.checklogin(cemail, cpass);
    print(data);
    if (data.isEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => RegPage()));
    } else if (data.isNotEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Musify()));
    }
  }

  @override
  Widget build(BuildContext context) {
    // void logincheck(String email, String password)async {
    //   var data= await SQLHelper.checklogin(email,password);
    //   if (data != null){
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Splashscreen()));
    //     print('Login Succesful');
    //   }
    // }
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
                "LOGIN SCREEN",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 30),
              child: TextFormField(
                controller: coemail,
                decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Please enter your email Id',
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                validator: (email) {
                  if (email!.isEmpty ||
                      !email.contains("@") ||
                      !email.contains(".com")) {
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
                controller: copass,
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
                      logincheck(coemail.text, copass.text);
                    } else {}
                  },
                  child: const Text("LOG IN")),
            ),
            Row(
              children: [
                Text('Not a user?'),
                Padding(
                  padding: EdgeInsets.only(top: 7),
                  child: TextButton(
                    child: Text("Register Here"),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => RegPage()));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

///Immutable : No change happens
///In Stateful we use createState to change the screen to mutable state.
///Mutable   : Changes Happen
