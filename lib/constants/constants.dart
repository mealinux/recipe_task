import 'package:flutter/material.dart';

class CONSTANT {
  /* API Settings */
  static const APP_ID = '29580578';

  static const API_KEY = 'e8ea4692448237b84eeaf8c8f4730218';

  static const API_VERSION = 'v2';

  static const TYPE = 'public';

  /* URL Settings */
  static const BASE_URL = 'https://api.edamam.com/api/recipes';

  static const SEARCH_URL =
      '$BASE_URL/$API_VERSION?type=$TYPE&app_id=$APP_ID&app_key=$API_KEY';

  static const NO_PREVIEW_IMAGE =
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930';

  /* Alert Messages */
  static const SUCCESS_TITLE = 'Success';
  static const WARNING_TITLE = 'Warning';

  static const SUCCESS_DELETED_MESSAGE = 'The recipe deleted';
  static const SUCCESS_ADDED_MESSAGE = 'The recipe added your favorites';

  static const WARNING_MESSAGE = 'The recipe already exists in your favorites';

  /* Colors */
  static const WHITE_COLOR = Color(0xFFFFFFFF);
  static const SUCCESS_COLOR = Color(0xFF558B2F);
  static const WARNING_COLOR = Color(0xFFD84315);

  static const TEXT_COLOR = Color(0xFF424242);
  static const LIGHT_BLACK_COLOR = Color(0x89000000);

  static const ALERT_COLOR = Color(0xCFF0F0F0);

  static const NAVIGATOR_COLOR = Color.fromRGBO(128, 85, 140, 1);
  static const APPBAR_COLOR = Color.fromRGBO(101, 93, 138, 1);

  /* Text Size */
  static const CONTENT_TEXT_SIZE = 16.0;
  static const TITLE_TEXT_SIZE = 18.0;

  /* Toolbar(Appbar) Size */
  static const TOOLBAR_HEIGHT = 40.0;

  /* Border Radius Size */
  static const BORDER_RADIUS_SIZE = 15.0;
}
