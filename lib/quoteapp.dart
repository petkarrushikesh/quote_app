import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart'; // Import the flutter_share package

class Quote extends StatefulWidget {
  @override
  _QuoteState createState() => _QuoteState();
}

class _QuoteState extends State<Quote> {
  int index = 0;
  List quotes = [
    "Life is like a bicycle. To keep your balance, you must keep moving.",
    "Act as if what you do makes a difference. It does.",
    "Success is not final, failure is not fatal: it is the courage to continue that counts",
    "Never bend your head. Always hold it high. Look the world straight in the eye.",
    "What you get by achieving your goals is not as important as what you become by achieving your goals.",
    "Believe you can and you're halfway there.",
    "If you cannot do great things do small things in a a great way"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Quotes App'), // Set your app title here
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              shareQuote(quotes[index % quotes.length]);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.orange.shade400,Colors.red.shade600 ],
          ),
        ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20),
              width: 400,
              height: 300,
              child: Card(
                color: Color(0xff9f3f9e),
                child: Center(
                  child: Text(
                    quotes[index % quotes.length],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Rowdies', fontSize: 30,),
                  ),
                ),
              ),
            ),
          ),
          TextButton.icon(
            onPressed: ShowQuotes,
            icon: Icon(Icons.wb_sunny,color:Colors.yellow,),
            label: Text("Inspire Me",style:TextStyle(color: Colors.cyanAccent) ,),
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.purple.shade600)),
          )
        ],
      ),
      ),
    );
  }

  void ShowQuotes() {
    setState(() {
      index++;
    });
  }

  // Function to share the current quote
  void shareQuote(String quote) async {
    await FlutterShare.share(
      title: 'Inspiring Quote',
      text: quote,
    );
  }
}
