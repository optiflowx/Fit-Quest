/// Extensions for [List].
/// This is a collection of useful extensions for working with lists and iterables.
/// You can make your own extensions by adding them to the [Iterable] or [List] classes.
extension ListExtensions<T> on Iterable<T> {
  // Get all non-null elements
  List<T> whereNotNull() => where((e) => e != null).toList();

  // Get all null elements
  List<T> whereNull() => where((e) => e == null).toList();

  // Add a spacer between each element
  List<T> spacer(T widget) {
    if (isEmpty) return [];
    
    return fold<List<T>>([first], (acc, curr) {
      if (acc.isEmpty) {
        return [curr];
      }
      return curr == first ? acc : [...acc, widget, curr];
    });
  }
}
