abstract class DatasourceAbstract<T> {
  Future<List<T>> getAll();
  Future<void> edit(T element);
  Future<void> delete(T element);
  Future<void> create(T element);
}

