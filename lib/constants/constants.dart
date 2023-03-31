class CONSTANT {
  static const APP_ID = '29580578';

  static const API_KEY = 'e8ea4692448237b84eeaf8c8f4730218';

  static const API_VERSION = 'v2';

  static const TYPE = 'public';

  static const BASE_URL = 'https://api.edamam.com/api/recipes';

  static const SEARCH_URL =
      '$BASE_URL/$API_VERSION?type=$TYPE&app_id=$APP_ID&app_key=$API_KEY';

  static const NO_PREVIEW_IMAGE =
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930';
}
