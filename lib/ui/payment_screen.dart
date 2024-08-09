import 'package:exec_array/components/round_button.dart';
import 'package:flutter/material.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String selectedCard = 'Visa'; // Initially selected card

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Add Payment Methods',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Segoe UI',
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = 'MasterCard';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: selectedCard == 'MasterCard'
                            ? Colors.blue[50]
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/mastercard.png', // Replace with your asset
                            width: 50,
                          ),
                          if (selectedCard == 'MasterCard')
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 24,
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCard = 'Visa';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                        color: selectedCard == 'Visa'
                            ? Colors.blue[50]
                            : Colors.white,
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/visacard.png', // Replace with your asset
                            width: 60,
                            height: 30,
                          ),
                          if (selectedCard == 'Visa')
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 24,
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name on card',
                  suffixIcon: Icon(Icons.person_2_outlined),
                ),
              ),
        
                 SizedBox(height: 20),
        
             const TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  suffixIcon: Icon(Icons.credit_card_outlined),
                ),
                keyboardType: TextInputType.number,
              ),
        
              SizedBox(height: 20),
            const  Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Expiry date',
                        suffixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  SizedBox(width: 50),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        suffixIcon: Icon(Icons.lock_outline),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 80),
        
        
              RoundButton(
        
                title:'ADD CARD' ,
                onPress: (){
        
                },
               
              ),
            ],
          ),
        ),
      ),
    );
  }
}
