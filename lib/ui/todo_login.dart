import 'package:flutter/material.dart';
import 'package:todo_app/core/service.dart';

class TodoLogin extends StatefulWidget {
  const TodoLogin({Key? key}) : super(key: key);

  @override
  _TodoLoginState createState() => _TodoLoginState();
}

class _TodoLoginState extends State<TodoLogin> {
  Service api = Service();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();

  bool _flag = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 5,
            ),
            TextFormField(
              autofocus: true,
              controller: t1,
              decoration: newMethod(
                  Icon(
                    Icons.person,
                    color: Theme.of(context).primaryColor,
                  ),
                  "Name"),
            ),
            const Spacer(
              flex: 1,
            ),
            TextFormField(
                controller: t2,
                decoration: newMethod(
                    Icon(
                      Icons.email,
                      color: Theme.of(context).primaryColor,
                    ),
                    "Email")),
            const Spacer(
              flex: 1,
            ),
            TextFormField(
              controller: t3,
              decoration: newMethod(
                  Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                  ),
                  "Password"),
            ),
            const Spacer(
              flex: 1,
            ),
            Container(
              width: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12)),
              child: TextButton(
                  onPressed: () {
                    //   await api.todoRegister(t1.text, t2.text, t3.text);
                    setState(() {
                      _flag = !_flag;
                    });
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration newMethod(Widget icon, String label) {
    return InputDecoration(
      prefixIcon: icon,
      labelText: label,
      focusColor: Colors.orange,
      fillColor: Colors.orange,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26)),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black26)),
    );
  }
}
