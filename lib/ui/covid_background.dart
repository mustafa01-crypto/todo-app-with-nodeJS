import 'package:flutter/material.dart';
import 'package:todo_app/core/model/covid_model.dart';
import 'package:todo_app/core/service.dart';

class CovidBackground extends StatefulWidget {
  const CovidBackground({Key? key}) : super(key: key);

  @override
  _CovidBackgroundState createState() => _CovidBackgroundState();
}

class _CovidBackgroundState extends State<CovidBackground> {
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
            future: client.getCovid(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Resultc>> snapshot) {
              if (snapshot.hasData) {
                List<Resultc>? result = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: result!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration:
                                  const BoxDecoration(color: Color(0xFF53ADA1)),
                              child: Wrap(
                                spacing: 21,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                direction: Axis.vertical,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "ÜLKE: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].country.toString(),
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "BUGÜNKÜ VAKA SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].newCases == ""
                                            ? "0"
                                            : result[index].newCases,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "TOPLAM VAKA SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].totalCases == ""
                                            ? "0"
                                            : result[index].totalCases,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "BUGÜNKÜ VEFAT SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].newDeaths == ""
                                            ? "0"
                                            : result[index].newDeaths,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "TOPLAM VEFAT SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].totalDeaths == ""
                                            ? "0"
                                            : result[index].totalDeaths,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "AKTİF VAKA SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].activeCases == ""
                                            ? "0"
                                            : result[index].activeCases,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                    child: Center(
                                      child: Container(
                                        color: Colors.pink,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "TOPLAM İYİLEŞEN SAYISI: ",
                                        style: styleText(),
                                      ),
                                      Text(
                                        result[index].totalRecovered == ""
                                            ? "0"
                                            : result[index].totalRecovered,
                                        style: styleText(),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                        ),
                      ],
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
