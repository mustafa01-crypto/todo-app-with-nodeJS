import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Column(
            children: [
              Expanded(
                flex: 4,
                child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    child: Column(
                      children: [flutterLogo(), containerTabs(context)],
                    )),
              ),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Spacer(
                          flex: 3,
                        ),
                        emailField(),
                        passwordField(),
                        Spacer(),
                        passForgot(),
                        Spacer(
                          flex: 3,
                        ),
                        loginButton(context),
                        buildWrapButton(),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Expanded flutterLogo() {
    return Expanded(
        child: Container(
            color: Colors.white, child: Center(child: FlutterLogo())));
  }

  Container containerTabs(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, bottom: 5),
        child: barTabs(context),
      ),
    );
  }

  TabBar barTabs(BuildContext context) {
    return TabBar(
      labelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: Theme.of(context).textTheme.headline5,
      unselectedLabelStyle: Theme.of(context).textTheme.headline6,
      indicatorColor: Colors.amber,
      //indicatorWeight: 4,
      tabs: [
        Tab(
          text: "   Login   ",
        ),
        Tab(
          text: "   SignUp    ",
        ),
      ],
    );
  }

  TextField emailField() {
    return TextField(
      decoration: InputDecoration(
          labelText: "Email",
          icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Icon(Icons.email_outlined))),
    );
  }

  TextField passwordField() {
    return TextField(
      decoration: InputDecoration(
          labelText: "Password",
          icon: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber,
              ),
              child: Icon(Icons.lock_outline))),
    );
  }

  Widget passForgot() =>
      Align(alignment: Alignment.centerRight, child: Text("Forgot Password"));

  Container loginButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.055,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(Colors.deepOrangeAccent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ))),
          onPressed: () {},
          child: Text("Login",
              style: TextStyle(color: Colors.white, fontSize: 24))),
    );
  }

  Wrap buildWrapButton() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(
          child: Text("SignUp"),
          onPressed: () => print("aa"),
        )
      ],
    );
  }
}
