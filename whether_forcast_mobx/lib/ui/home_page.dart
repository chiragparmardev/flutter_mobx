import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:whether_forcast_mobx/models/wheater_mobx.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(child: Observer(builder: (_) {
          return Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(wheater.url))),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(children: [
                const SizedBox(
                  height: 40,
                ),
                Observer(builder: (_) {
                  return Visibility(
                      child: Text(
                    wheater.wheater,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ));
                }),
                const SizedBox(
                  height: 50,
                ),
                Observer(builder: (_) {
                  return wheater.wheaterEnum == WheaterEnum.isLoaded
                      ? Text(
                          '${wheater.degree.toStringAsFixed(2)} °C',
                          style: const TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 5,
                          ),
                        );
                }),
                const SizedBox(
                  height: 60,
                ),
                TextFormField(
                  keyboardType: TextInputType.streetAddress,
                  validator: (value) => value!.isEmpty ? 'Enter city' : null,
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Enter city',
                    filled: true,
                    suffixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      gapPadding: 2,
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Observer(builder: (_) {
                  return IconButton.filled(
                      iconSize: 35,
                      padding: const EdgeInsets.all(15),
                      color: Colors.white,
                      onPressed: onPressed(),
                      icon: const Icon(Icons.search));
                })
              ]),
            ),
          );
        })));
  }

  void Function()? onPressed() {
    return () {
      if (searchController.text.isNotEmpty) {
        wheater.getWheater(searchController.text);
        wheater.setWheaterEnumdelay();
        searchController.clear();
        wheater.changeWhaterImage();
      } else {
        var snackBar = const SnackBar(
          content: Text('Please Enter city'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    };
  }
}
