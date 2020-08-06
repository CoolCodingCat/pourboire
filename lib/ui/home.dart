import 'package:flutter/material.dart';
import 'package:untitled/util/hexcolor.dart';
import 'package:untitled/util/calculations.dart';

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;

  Color _purple = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: _purple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Total par personne',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: _purple,
                      )),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('${calculateTotalPerPerson(_tipPercentage, _billAmount, _personCounter)} €',
                        style: TextStyle(
                          color: _purple,
                          fontSize: 34.9,
                          fontWeight: FontWeight.bold,

                        )),
                      ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.blueGrey.shade100,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: _purple),
                    decoration: InputDecoration(
                      prefixText: 'Montant de la note  ',
                      prefixIcon: Icon(Icons.euro_symbol),
                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Nombre de parts",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                              onTap: () {
                                setState(() {
                                  if (_personCounter > 1) {
                                    _personCounter--;
                                  } else {
                                    //do nothing
                                  }
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Text('-',
                                      style: TextStyle(
                                          color: _purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0)),
                                ),
                              )),
                          Text(
                            '$_personCounter',
                            style: TextStyle(
                              color: _purple,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  _personCounter++;
                                });
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                margin: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purple.withOpacity(0.1),
                                ),
                                child: Center(
                                  child: Text('+',
                                      style: TextStyle(
                                          color: _purple,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0)),
                                ),
                              )
                          ),

                        ],
                      ),


                    ],

                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Pourboire',
                          style: TextStyle(
                            color: Colors.grey.shade700,
                          )),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text('${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)} €',
                        style: TextStyle(
                          color: _purple,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        )),
                      )
                    ],
                  ),
                  //slider
                  Column(
                    children: <Widget>[
                      Text('$_tipPercentage%',
                      style: TextStyle(
                        color: _purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      )),
                      Slider(
                          min: 0,
                          max: 100,
                          activeColor: _purple,
                          inactiveColor: Colors.grey,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                        setState(() {
                          _tipPercentage = value.round();
                        });
                      })
                    ],
                  )
                ],

              ),

            )
          ],
        ),
      ),
    );

//    calculateTotalPerPerson(double totalTip, double billAmount, int splitBy) {
//       var totalPerPerson = (totalTip + billAmount)/splitBy;
//       return totalPerPerson;
//
//    }
//    calculateTotalTip(double billAMount, int splitBy, int tipPercentage) {
//      double totalTip = 0.0;
//
//      if(billAMount < 0 || billAMount.toString().isEmpty || billAMount == null) {
//        //no go !
//
//      } else {
//        totalTip = (billAMount * tipPercentage) /100;
//      }
//      return totalTip;
//    }
  }
}
