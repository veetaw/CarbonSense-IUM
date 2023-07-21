import 'dart:math';

extension RandomItem<T> on List<T> {
  T random() {
    return this[Random().nextInt(length)];
  }
}
