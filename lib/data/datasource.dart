class DataSource {
  final _datasource = [];
  static DataSource _instance;

  DataSource._internal();

    static DataSource getInstance() {
      if(_instance == null){
        _instance = DataSource._internal();
      }
      return _instance;
    }

    void insert(operation) => _datasource.add(operation);

    List getAll() => _datasource;

    int length() {
      if(null){
        return 0;
      }
      return _datasource.length;
    }

    void getCleaned() {
      _datasource.clear();
    }
}