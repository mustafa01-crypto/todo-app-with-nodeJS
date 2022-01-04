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
              controller: t1,
              decoration: newMethod("Name"),
            ),
            const Spacer(
              flex: 1,
            ),
            TextFormField(controller: t2, decoration: newMethod("Email")),
            const Spacer(
              flex: 1,
            ),
            TextFormField(
              controller: t3,
              decoration: newMethod("Password"),
            ),
            const Spacer(
              flex: 1,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.green,
                    shape: const StadiumBorder()),
                onPressed: () async {
                  await api.todoRegister(t1.text, t2.text, t3.text);
                  setState(() {
                    _flag = !_flag;
                  });
                },
                child: const Text("Register")),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration newMethod(String hint) {
    return InputDecoration(
      hintText: hint,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black)),
    );
  }
}
