import 'package:flutter/material.dart';
import 'package:todo_app/core/service.dart';
import '../core/constants/home/home_constant_shelf.dart';
import '../core/constants/spinit/spinit.dart';
import '../core/constants/post/post_constant_shelf.dart';
import 'home.dart';

// ignore: must_be_immutable
class PostStudents extends StatefulWidget {
  PostStudents(
      {Key? key,
      required this.id,
      required this.name,
      required this.surname,
      required this.number})
      : super(key: key);

  String id;
  String name;
  String surname;
  String number;

  @override
  _PostStudentsState createState() => _PostStudentsState();
}

class _PostStudentsState extends State<PostStudents> {
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController number = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final snackBar = SnackBar(
      content: const Text('Success'),
      backgroundColor: (const Color(0xFF21B7CA)),
      action: SnackBarAction(
        textColor: Colors.white,
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    return SafeArea(
      child: Scaffold(
        appBar: animatedAppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                UpdateAnimatedText(size: size),
                postNameForm(name, widget.name),
                postSurnameForm(surname, widget.surname),
                numberFormPadding(number, widget.number),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: size.height * 0.065,
                  width: size.width * 0.95,
                  child: TextButton(
                    style: textButtonStyle(),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(const Duration(milliseconds: 300), () {
                          setState(() {
                            isLoading = false;
                          });
                        });
                        await Service().updateStudent(
                            widget.id.toString(),
                            name.text.toString(),
                            surname.text.toString(),
                            number.text.toString());
                        Future.delayed(
                            const Duration(milliseconds: 150),
                            () => {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar)
                                });
                        Future.delayed(
                            const Duration(milliseconds: 300),
                            () => {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                      (Route<dynamic> route) => false)
                                });
                      }
                    },
                    child: const UpdateText(),
                  ),
                ),
                isLoading
                    ? spinkitOrange()
                    : const SizedBox(
                        height: 10,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
