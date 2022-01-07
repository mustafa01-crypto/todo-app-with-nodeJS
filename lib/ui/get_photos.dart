import 'package:flutter/material.dart';
import 'package:todo_app/core/model/covid_model.dart';
import 'package:todo_app/core/model/get_all_photos_model.dart';
import 'package:todo_app/core/service.dart';

class AllPhoto extends StatefulWidget {
  const AllPhoto({Key? key}) : super(key: key);

  @override
  _AllPhotoState createState() => _AllPhotoState();
}

class _AllPhotoState extends State<AllPhoto> {
  Service client = Service();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/covid.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: FutureBuilder(
            future: client.getAllPhotos(),
            builder:
                (BuildContext context, AsyncSnapshot<GetAllPhotos> snapshot) {
              if (snapshot.hasData) {
                GetAllPhotos? result = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.network(
                              result!.photos![index].photo.toString())),
                    );
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  TextStyle? styleText() => Theme.of(context).textTheme.headline6;
}
