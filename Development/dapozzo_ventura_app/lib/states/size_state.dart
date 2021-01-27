import 'package:dapozzo_ventura_app/data/models/size_model.dart';
import 'package:equatable/equatable.dart';

abstract class SizeState extends Equatable {}

class SizeStateUninitialized extends SizeState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SizeStateCurrent extends SizeState {
 final String currentSize;
 SizeStateCurrent(this.currentSize);

  @override
  // TODO: implement props
  List<Object> get props => [this.currentSize];
}
