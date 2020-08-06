import 'package:flutter/material.dart';

calculateTotalTip(double billAMount, int splitBy, int tipPercentage) {
  double totalTip = 0.0;

  if(billAMount < 0 || billAMount.toString().isEmpty || billAMount == null) {
    //no go !

  } else {
    totalTip = (billAMount * tipPercentage) /100;
  }
  return totalTip;
}

calculateTotalPerPerson(int tipPercentage, double billAmount, int splitBy) {
  var totalPerPerson = (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount)/splitBy;
  return totalPerPerson.toStringAsFixed(2);

}