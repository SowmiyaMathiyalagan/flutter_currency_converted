import 'package:flutter/material.dart';

class CurrencyConverted extends StatefulWidget {
  const CurrencyConverted({Key? key}) : super(key: key);

  @override
  State<CurrencyConverted> createState() => _CurrencyConvertedState();
}

class _CurrencyConvertedState extends State<CurrencyConverted> {
  String? valueschoose; // Make it nullable
  String? valueschoose1;

  @override
  Widget build(BuildContext context) {
    final _amount = TextEditingController();
    final _tot = TextEditingController();
    int cal;
    int result;
    var size = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(

          child: Column(
            children: [
              Text(
                "currency Converted",
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: _amount,
                  decoration: InputDecoration(
                      labelText: "Amount",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                  value: this.valueschoose,
                  items: <String>['Srilankan Rupees', 'Indian Rupees']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) => setState(
                        () => this.valueschoose = value,
                      )),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                  value: this.valueschoose1,
                  items: <String>['USD'].map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) => setState(
                        () => this.valueschoose1 = value,
                      )),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: TextField(
                  controller: _tot,
                  decoration: InputDecoration(
                      labelText: "Total",
                      labelStyle:
                          TextStyle(fontSize: 15, color: Colors.grey.shade400),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  if (valueschoose == "Srilankan Rupees" &&
                      valueschoose1 == "USD") {
                    cal = int.parse(_amount.text) * 300;
                    result = cal;
                    _tot.text = result.toString();
                  } else if (valueschoose == "Indian Rupees" &&
                      valueschoose1 == "USD") {
                    cal = int.parse(_amount.text) * 78;
                    result = cal;
                    _tot.text = result.toString();
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  alignment: Alignment.center,
                  height: size.height / 14,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    'Convert',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
