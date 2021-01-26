abstract class QuantityState {}

class QuantityStateUninitialized extends QuantityState {}

class  QuantityStateCurrent extends QuantityState {
  int currentQuantity;
  QuantityStateCurrent(this.currentQuantity);
}