import 'dart:ffi';
import 'dart:math';

import 'package:flash_chat_flutter/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';
import 'package:flash_chat_flutter/coin_data.dart';
import 'dart:io' show Platform;
import 'package:flutter/rendering.dart';
// import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

class PriceScreen extends StatefulWidget {
  static const String id = 'price screen';

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

var refreshKey = GlobalKey<RefreshIndicatorState>();
Random random = new Random();
int limit = random.nextInt(10);

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = 'USD';

  DropdownButton<String> androidDropdownbutton() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedcurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedcurrency = value;
          //2: Call getData() when the picker/dropdown changes.
          getData();
        });
      },
    );
  }

  CupertinoPicker IOSpicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      backgroundColor: Colors.blue,
      itemExtent: 30.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  // Widget getpicker() {
  //   if (Platform.isIOS) {
  //     return IOSpicker();
  //   } else if (Platform.isAndroid) {
  //     return androidDropdownbutton();
  //   }
  // }

  //value had to be updated into a Map to store the values of all three cryptocurrencies.
  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedcurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Column makeCards() {
    List<CryptoCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        CryptoCard(
          cryptoCurrency: crypto,
          selectedCurrency: selectedcurrency,
          value: isWaiting ? '?' : coinValues[crypto],
        ),
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BitFi", style: TextStyle(fontSize: 16)),
        actions: [
          IconButton(
              icon: Icon(Icons.chat_bubble),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              }),
          IconButton(
            icon: Icon(Icons.logout),
            // / iconSize: 200.0,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        child: Container(
          height: 100.0,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: 30.0),
          child: Platform.isIOS ? IOSpicker() : androidDropdownbutton(),
        ),
      ),

      // IconButton(
      //    icon: Icon(Icons.chat_bubble),
      //    onPressed: () {
      //      Navigator.push(
      //        context,
      //        MaterialPageRoute(builder: (context) => ChatScreen()),
      //      );
      // //    }),

      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              makeCards(),
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // children: <Widget>[
              //   CryptoCard(
              //     cryptoCurrency: 'BTC',
              //     //7. Finally, we use a ternary operator to check if we are waiting and if so, we'll display a '?' otherwise we'll show the actual price data.
              //     value: isWaiting ? '?' : coinValues['BTC'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   CryptoCard(
              //     cryptoCurrency: 'ETH',
              //     value: isWaiting ? '?' : coinValues['ETH'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   CryptoCard(
              //     cryptoCurrency: 'LTC',
              //     value: isWaiting ? '?' : coinValues['LTC'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   CryptoCard(
              //     cryptoCurrency: 'BAT',
              //     value: isWaiting ? '?' : coinValues['BAT'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   CryptoCard(
              //     cryptoCurrency: 'JPY',
              //     value: isWaiting ? '?' : coinValues['JPY'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   CryptoCard(
              //     cryptoCurrency: 'XRP',
              //     value: isWaiting ? '?' : coinValues['XRP'],
              //     selectedCurrency: selectedcurrency,
              //   ),
              //   // CryptoCard(
              //   //   cryptoCurrency: 'USD',
              //   //   value: isWaiting ? '?' : coinValues['USD'],
              //   //   selectedCurrency: selectedcurrency,
              //   // ),
              //   // CryptoCard(
              //   //   cryptoCurrency: 'ETH',
              //   //   value: isWaiting ? '?' : coinValues['ETH'],
              //   //   selectedCurrency: selectedcurrency,
              //   // ),
              //   // CryptoCard(
              //   //   cryptoCurrency: 'ETH',
              //   //   value: isWaiting ? '?' : coinValues['ETH'],
              //   //   selectedCurrency: selectedcurrency,
              //   // ),
            ],
          ),
        ),
      ),
    );

    // height: 150.0,
    // alignment: Alignment.center,
    // padding: EdgeInsets.only(bottom: 30.0),
    // color: Colors.lightBlue,
    // child: Platform.isIOS ? IOSpicker() : androidDropdownbutton(),
    // // IconButton(
    // //    icon: Icon(Icons.chat_bubble),
    // //    onPressed: () {
    // //      Navigator.push(
    // //        context,
    // //        MaterialPageRoute(builder: (context) => ChatScreen()),
    // //      );
    // //    }),
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      limit = random.nextInt(10);
    });
  }
}

//1: Refactor this Padding Widget into a separate Stateless Widget called CryptoCard, so we can create 3 of them, one for each cryptocurrency.
class CryptoCard extends StatelessWidget {
  //2: You'll need to able to pass the selectedCurrency, value and cryptoCurrency to the constructor of this CryptoCard Widget.
  const CryptoCard({
    this.value,
    this.selectedCurrency,
    this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $cryptoCurrency = $value $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
// / height: 150.0,
// alignment: Alignment.center,
// padding: EdgeInsets.only(bottom: 30.0),
// color: Colors.lightBlue,
// child: Platform.isIOS ? IOSpicker() : androidDropdownbutton(),
// child: IconButton(
//     icon: Icon(Icons.chat_bubble),
//     onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ChatScreen()),
//       );
//     }),
