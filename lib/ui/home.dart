import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/core/constants/home/sliver_app_bar.dart';
import 'package:todo_app/core/constants/text_styles.dart';
import 'package:todo_app/core/service.dart';
import '../core/constants/home/home_constant_shelf.dart';
import '../core/constants/spinit/spinit.dart';
import '../core/constants/home/surname_text_form.dart';
import '../core/model/students.dart';
import 'post.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController name = TextEditingController();
  final TextEditingController surname = TextEditingController();
  final TextEditingController number = TextEditingController();
  Service api = Service();

  bool isLoading = false;
  bool isDeleteLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            sliverAppBar(context),
          ];
        },
        body: Scaffold(
          body: isDeleteLoading
              ? spinkitOrange()
              : FutureBuilder(
                  future: api.getArticle(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Students>> snapshot) {
                    if (snapshot.hasData) {
                      List<Students>? res = snapshot.data;
                      return ListView.builder(
                        itemCount: res!.length,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          void deleteUser() {
                            setState(() {
                              isDeleteLoading = true;
                            });
                            Future.delayed(
                                const Duration(milliseconds: 300),
                                () => {
                                      setState(() {
                                        isDeleteLoading = false;
                                      })
                                    });

                            Future.delayed(
                                const Duration(milliseconds: 150),
                                () => {
                                      api.deleteUser(
                                          context, '${res[index].id}'),
                                    });
                            Navigator.pop(context);

                            setState(() {});
                          }

                          void _showMaterialDialog() {
                            dialog(context, deleteUser);
                          }

                          void deleteList(BuildContext context) {
                            _showMaterialDialog();
                          }

                          void updateList(BuildContext context) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostStudents(
                                          id: res[index].id!,
                                          name: res[index].name!,
                                          surname: res[index].surname!,
                                          number: res[index].number!,
                                        )));
                          }

                          return paddingBoxSlidable(
                              deleteList, updateList, res, index);
                        },
                      );
                    }
                    if (snapshot.hasError) {}
                    return Center(child: spinkitOrange());
                  },
                ),
          floatingActionButton: flButton(context),
        ),
      ),
    );
  }

  Future<dynamic> dialog(BuildContext context, void Function() deleteUser) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Are You sure'),
            content: const Text('Do you want to delete this student'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel')),
              TextButton(
                onPressed: () {
                  deleteUser();
                },
                child: const Text('Delete'),
              )
            ],
          );
        });
  }

  Padding paddingBoxSlidable(
      void Function(BuildContext context) deleteList,
      void Function(BuildContext context) updateList,
      List<Students> res,
      int index) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: boxSlidable(deleteList, updateList, res, index),
    );
  }

  Card boxSlidable(
      void Function(BuildContext context) deleteList,
      void Function(BuildContext context) updateList,
      List<Students> res,
      int index) {
    return Card(
      color: Colors.cyan,
      shadowColor: Colors.cyan,
      elevation: 8,
      margin: const EdgeInsets.all(10),
      child: slidableWidget(deleteList, updateList, res, index),
    );
  }

  Slidable slidableWidget(
      void Function(BuildContext context) deleteList,
      void Function(BuildContext context) updateList,
      List<Students> res,
      int index) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          deleteButtonAction(deleteList),
          updateActionButton(updateList),
        ],
      ),
      child: tileListItems(res, index),
    );
  }

  ListTile tileListItems(List<Students> res, int index) {
    return ListTile(
      leading: SizedBox(
          // height: 100.0,
          width: 40.0, // fixed width and height
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: AppStyles().orangeStyle,
            ),
          )),
      title: Text(
        'Name: ${res[index].name!}',
        style: AppStyles().style,
      ),
      subtitle: Text(
        'Surname: ${res[index].surname!}',
        style: AppStyles().style,
      ),
      trailing: Text(
        'Number:${res[index].number}',
        style: AppStyles().style,
      ),
      contentPadding: const EdgeInsets.all(10),
      // horizontalTitleGap: 10,
      minVerticalPadding: 5,
    );
  }

  FloatingActionButton flButton(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.teal,
      child: const Icon(Icons.add),
      onPressed: () {
        _modalBottomSheetMenu(context);
      },
    );
  }

  void _modalBottomSheetMenu(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
        ),
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return DraggableScrollableSheet(
                initialChildSize: 0.75,
                maxChildSize: 0.8,
                minChildSize: 0.25,
                expand: false,
                builder: (context, scrollController) {
                  return Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        starIcon(),
                        SizedBox(
                          height: size.height * 0.05,
                        ),
                        NameTextForm(name: name),
                        SurnameTextForm(surname: surname),
                        NumberTextForm(number: number),
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

                                Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () => {
                                          setState(() {
                                            isDeleteLoading = false;
                                          })
                                        });
                                await Service().addStudents(
                                    name.text.toString(),
                                    surname.text.toString(),
                                    number.text.toString());

                                Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () => {
                                          name.clear(),
                                          surname.clear(),
                                          number.clear(),
                                        });
                                Future.delayed(
                                    const Duration(milliseconds: 300),
                                    () => {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const Home()),
                                              (Route<dynamic> route) => false)
                                        });
                                setState(() {});
                              }
                            },
                            child: const AddButtonText(),
                          ),
                        ),
                        isLoading
                            ? spinkitOrange()
                            : const SizedBox(
                                width: 10,
                              ),
                      ],
                    ),
                  );
                });
          });
        });
  }
}
