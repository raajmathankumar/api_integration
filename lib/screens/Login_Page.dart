
import 'package:api_integration/login/api_Call.dart';
import 'package:api_integration/login/login_model.dart';
import 'package:flutter/material.dart';

import 'category_product_Screen.dart';

class LoginPage extends StatefulWidget {
  static const routname = '/loginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool hidePassword = true;
  bool isApiCallProcess = false;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late LoginRequestModel loginRequestModel;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    loginRequestModel = new LoginRequestModel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  margin: const EdgeInsets.symmetric(vertical: 85, horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Theme.of(context).primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: Offset(0, 10),
                          blurRadius: 20)
                    ],
                  ),
                  child: Form(
                    key: globalFormKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25),
                        Text(
                          "Login",
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onSaved: (input) => loginRequestModel.username = input!,

                          decoration: const InputDecoration(
                            hintText: "Email Address",
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45)),
                           /* prefixIcon: Icon(
                              Icons.email,
                              color: Colors.black45,
                            ),*/
                          ),
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.black45),
                          keyboardType: TextInputType.text,
                          onSaved: (input) =>
                              loginRequestModel.password = input!,
                          validator: (input) => input!.length < 3
                              ? "Password should be more than 3 characters"
                              : null,
                          //obscureText: hidePassword,
                          decoration: const InputDecoration(
                          /*  prefixIcon: Icon(
                              Icons.lock,
                            ),*/
                            hintText: "Password",
                            fillColor: Colors.white70,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.black45
                                       )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black45)),
                           /*
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),*/
                          ),
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(

                          onPressed: () {
                            if (validateAndSave()) {
                              print(loginRequestModel.toJson());

                              setState(() {
                                isApiCallProcess = true;
                              });

                              APIService apiService = new APIService();
                              apiService.login(loginRequestModel).then((value) {
                                if (value != null) {
                                  setState(() {
                                    isApiCallProcess = false;
                                  });

                                  if (value.token.isNotEmpty) {

                                    final snackBar = SnackBar(
                                        content: Text("Login Successful"));
                                    scaffoldKey.currentState
                                        ?.showSnackBar(snackBar);
                                    Navigator.of(context).pushNamed(CategoryProductScreen.routname);
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.error));
                                    scaffoldKey.currentState
                                        ?.showSnackBar(snackBar);
                                  }
                                }
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),

                        ),
                        SizedBox(height: 15),
                      ],
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

  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
