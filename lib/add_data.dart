import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:store_app_localapi/main.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController itemCode = TextEditingController();
  TextEditingController itemName = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController stock = TextEditingController();

  void addData() {
    var url = "http://192.168.100.14/my_store/addData.php";

    http.post(Uri.parse(url), body: {
      "itemcode": itemCode.text,
      "itemname": itemName.text,
      "price": price.text,
      "stock": stock.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: const Text("Add Data"),
        ),
        body: Container(
          padding: const EdgeInsets.all(8),
          child: ListView(
            children: [
              TextFormField(
                controller: itemCode,
                decoration: const InputDecoration(labelText: "Item Code"),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: itemName,
                decoration: const InputDecoration(labelText: "Item Name"),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: price,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: stock,
                decoration: const InputDecoration(labelText: "Stock"),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                child: MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    setState(() {
                      addData();
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => const Home()));
                    setState(() {});
                  },
                  child: const Text("Add"),
                ),
              )
            ],
          ),
        ));
  }
}
