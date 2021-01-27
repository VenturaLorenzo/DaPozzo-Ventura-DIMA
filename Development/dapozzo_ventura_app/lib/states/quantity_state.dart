import 'package:equatable/equatable.dart';

abstract class QuantityState  extends Equatable{}

class QuantityStateUninitialized extends QuantityState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class  QuantityStateCurrent extends QuantityState {
  int currentQuantity;
  QuantityStateCurrent(this.currentQuantity);

  @override
  // TODO: implement props
  List<Object> get props => [currentQuantity];
}