// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

// ignore: file_names
class AddProductModel {
  String? name;
  File? img_url;
  String? description;
  String? size;
  String? price;
  String? category_id;
}
