import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ProductFromCreate extends StatefulWidget {
  const ProductFromCreate({super.key});

  @override
  State<ProductFromCreate> createState() => _ProductFromCreateState();
}

class _ProductFromCreateState extends State<ProductFromCreate> {
  final dio = Dio();
  final baseApi = "https://testpos.trainingzenter.com/lab_dpu/food/create/";
  final productName = TextEditingController();
  final productCover = TextEditingController();
  final productDescription = TextEditingController();
  final productPrice = TextEditingController();
  late String productOwner = "66130151_66130413";
  late String msg = "";

  Future<dynamic> ProductCreate() async {
    if (productName.text == '' ||
        productCover.text == '' ||
        productDescription.text == '' ||
        productPrice.text == '') {
      setState(() {
        msg = "Please add all food data";
      });
      return false;
    }
    try {
      await dio
          .post(baseApi,
              data: {
                "food_name": productName.text,
                "food_cover": productCover.text,
                "food_description": productDescription.text,
                "food_price": productPrice.text,
                "food_owner": productOwner
              },
              options: Options(
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json'
                },
              ))
          .then((response) => {Navigator.pushNamed(context, "product")});
    } catch (e) {
      if (!context.mounted) return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Add Menu'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (msg != "")
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    msg,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Food Name"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productCover,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Food Cover"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productDescription,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Food Description"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: productPrice,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Food Price"),
                ),
              ),
              TextButton(
                  onPressed: ProductCreate,
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: Text(
                    "Save data",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          ),
        ));
  }
}
