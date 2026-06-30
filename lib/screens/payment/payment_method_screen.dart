import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {

  int selected = 0;

  final methods = [
    {
      "title": "UPI",
      "subtitle": "Google Pay • PhonePe • Paytm",
      "icon": Icons.qr_code,
    },
    {
      "title": "Credit / Debit Card",
      "subtitle": "Visa • MasterCard",
      "icon": Icons.credit_card,
    },
    {
      "title": "Net Banking",
      "subtitle": "All Banks Supported",
      "icon": Icons.account_balance,
    },
    {
      "title": "Cash",
      "subtitle": "Pay at Parking",
      "icon": Icons.payments,
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Payment Method"),
      ),

      body: Column(

        children: [

          Expanded(

            child: ListView.builder(

              itemCount: methods.length,

              itemBuilder: (context,index){

                final item = methods[index];

                return Card(

                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),

                  child: RadioListTile(

                    value: index,

                    groupValue: selected,

                    onChanged: (value){

                      setState(() {

                        selected = value!;

                      });

                    },

                    title: Text(
                      item["title"].toString(),
                    ),

                    subtitle: Text(
                      item["subtitle"].toString(),
                    ),

                    secondary: Icon(
                      item["icon"] as IconData,
                      color: Colors.blue,
                    ),
                  ),
                );

              },

            ),

          ),

          Padding(

            padding: const EdgeInsets.all(20),

            child: SizedBox(

              width: double.infinity,

              height: 55,

              child: ElevatedButton(

                onPressed: (){

                  Navigator.pushNamed(
                    context,
                    "/payment-success",
                  );

                },

                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),

              ),

            ),

          )

        ],

      ),

    );

  }

}