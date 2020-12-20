class Sport {
  final int id;
  final String icon;
  final String name;

  Sport(this.id, this.icon, this.name);
  @override
  String toString() {
    return name;
  }
}
