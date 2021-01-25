import 'package:dapozzo_ventura_app/data/models/size_model.dart';

abstract class SizeState {}

class SizeStateUninitialized extends SizeState {}

class SizeStateInitialized extends SizeState {
  List<SizeModel> sizes;
  SizeModel currentSize;
  SizeStateInitialized(this.sizes, this.currentSize);
}
