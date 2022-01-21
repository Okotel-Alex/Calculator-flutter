import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){
    if(buttonText == "C"){
       _output = "0";
       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    }
    else if(buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "×"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    }
    else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already contains a decimal");
        return;

      }
      else {
        _output = _output + buttonText;
      }
    }

    else if(buttonText == "="){
      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "×"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    }
    else {

      _output = _output + buttonText;

    }

    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });

  }

  Widget buildButton(String buttonText){
    return  Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.grey,
      margin: EdgeInsets.fromLTRB(0, 8.0, 0,0),
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black38),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MY CALCULATOR"),
        centerTitle: true,
      ),

      backgroundColor: Colors.cyan,

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0),
                            topLeft: Radius.circular(25.0),
                            bottomLeft: Radius.circular(25.0),
                        ),
                      shape: BoxShape.rectangle,
                      color: Colors.grey,

                    ),
                    constraints: BoxConstraints.tightForFinite(
                      width: 310,
                      height: 200,
                    ),
                    margin: EdgeInsets.fromLTRB(20.0, 20.0, 30.0, 10.0),
                    //width: 388.0,
                    //height: 180.0,
                    //padding: EdgeInsets.all(80.0),
                    padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                      child: Text(output,
                        style: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                  ),
                ],
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  buildButton("7"),
                ],
              ),

              //SizedBox(width: 10.0,),

              Row(
                children: [
                  buildButton("8"),
                ],
              ),

              //SizedBox(width: 10.0,),

              Row(
                children: [
                  buildButton("9"),
                ],
              ),

              //SizedBox(width: 10.0,),

              Row(
                children: [
                  buildButton("+"),
                ],
              ),

              SizedBox(width: 10.0,),

            ],
          ),

          SizedBox(width: 10.0,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      buildButton("4"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("5"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("6"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("-"),
                    ],
                  ),

                  SizedBox(width: 10.0,),

                ],
              ),
            ],
          ),

          SizedBox(width: 10.0,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      buildButton("1"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("2"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("3"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("×"),
                    ],
                  ),

                  SizedBox(width: 10.0,),

                ],
              ),
            ],
          ),

          SizedBox(width: 10.0,),

          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      buildButton("C"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("0"),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("="),
                    ],
                  ),

                  //SizedBox(width: 10.0,),

                  Row(
                    children: [
                      buildButton("/"),
                    ],
                  ),

                  SizedBox(width: 10.0,),

                ],
              ),
            ],
          ),


        ],
      ),
    );
  }
}
