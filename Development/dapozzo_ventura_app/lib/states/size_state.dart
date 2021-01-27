abstract class SizeState {}

class SizeStateUninitialized extends SizeState {}

class SizeStateCurrent extends SizeState {
  final String currentSize;
  SizeStateCurrent(this.currentSize);
}
