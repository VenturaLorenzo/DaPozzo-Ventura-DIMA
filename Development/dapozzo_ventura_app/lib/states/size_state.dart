import 'package:dapozzo_ventura_app/data/models/size_model.dart';

abstract class SizeState {}

class SizeStateUninitialized extends SizeState {}

class SizeStateCurrent extends SizeState {
 final String currentSize;
 SizeStateCurrent(this.currentSize);
}
