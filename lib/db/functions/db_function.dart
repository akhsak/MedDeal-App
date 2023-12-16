import 'package:flutter/material.dart';
import 'package:stockapp/db/model/datamodel.dart';

ValueNotifier<List<Items>>itemlistnotifier=ValueNotifier([]);


void additems(Items value){
  itemlistnotifier.value.add(value);
  print(value.toString());
}