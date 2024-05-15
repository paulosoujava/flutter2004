//Facade

//complex subsystem classes
class NetworkManager {
  Future<String> fetchData() async {
    return 'Data';
  }
}

//complex subsystem classes
class DatabaseManager {
  Future<String> fetchData(String data) async {
    return 'Complex Data $data';
  }
}

////Facade
class DataFacade {
  final NetworkManager _networkManager = NetworkManager();
  final DatabaseManager _databaseManager = DatabaseManager();

  Future<String> fetchDataAndProcess() async {
    String data = await _networkManager.fetchData();
    return await _databaseManager.fetchData();
  }
}


void main() {
  DataFacade dataFacade = DataFacade();
  dataFacade.fetchDataAndProcess();
}