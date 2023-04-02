import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HistoryService extends GetxController {
  GetStorage historyStorage = GetStorage();

  getHistory() {
    return historyStorage.read('history') ?? [];
  }

  addHistory(String text) {
    List<dynamic> histories = getHistory();

    if (!histories.contains(text)) {
      histories.add(text);
    }

    historyStorage.write('history', histories);
  }

  deleteHistory(int index) {
    List<dynamic> histories = getHistory();

    histories.removeAt(index);

    historyStorage.write('history', histories);
  }
}
