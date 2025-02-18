class Ticker {
  const Ticker();
  Stream<int> tick({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
  Stream<int> tick_2({required int ticks}) {
    return Stream.periodic(const Duration(seconds: 1), (x) => ticks + x)
        .take(ticks);
  }
}