import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:store_app_localapi/detail.dart';
import 'package:store_app_localapi/main.dart';
import 'package:store_app_localapi/model/res_get_data.dart';
import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final Data? data;
  const EditData({Key? key, required this.data}) : super(key: key);

  @override
  State<EditData> createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController? itemCodeController;
  TextEditingController? itemNameController;
  TextEditingController? priceController;
  TextEditingController? stockController;

  void editdata() {
    var url = "http://192.168.100.14/my_store/editData.php";

    http.post(Uri.parse(url), body: {
      "id": widget.data?.id,
      "itemcode": itemCodeController?.text,
      "itemname": itemNameController?.text,
      "price": priceController?.text,
      "stock": stockController?.text
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    itemCodeController = TextEditingController(text: widget.data?.itemCode);
    itemNameController = TextEditingController(text: widget.data?.itemName);
    priceController = TextEditingController(text: widget.data?.price);
    stockController = TextEditingController(text: widget.data?.stock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text("Edit Data"),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            TextFormField(
              controller: itemCodeController,
              decoration: const InputDecoration(labelText: "Item Code"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: itemNameController,
              decoration: const InputDecoration(labelText: "Item Name"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: priceController,
              decoration: const InputDecoration(labelText: "Price"),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: stockController,
              decoration: const InputDecoration(labelText: "Stock"),
            ),
            Container(
              padding: const EdgeInsets.all(30),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: () {
                  setState(() {
                    editdata();
                  });
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (_) => const Home()));
                  setState(() {});
                },
                child: const Text("Change"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
