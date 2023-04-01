import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FilterService extends GetxController {
  GetStorage filterStorage = GetStorage();

  var filters = [].obs;

  getFilters() {
    var filterTexts = filterStorage.read('filters') ?? [];

    filters.value = filterTexts;
    filters.refresh();
  }

  addFilter(String text) {
    getFilters();

    if (filters().contains(text)) {
      filters.remove(text);
    } else {
      filters.add(text);
    }

    filterStorage.write('filters', filters());

    filters.refresh();
  }

  filterQueryText() {
    getFilters();

    var filterText = '';
    for (var element in filters()) {
      filterText += 'health=$element&';
    }

    return filterText;
  }
}
