import 'package:darzi_nearby/darzi_nearby.dart';

class DarziFormEnity {
  DarziFormEnity.copy(DarziFormEnity data)
      : title = data.title,
        hintText = data.hintText,
        minLines = data.minLines,
        validator = data.validator,
        inputFormatters = data.inputFormatters,
        keyboardType = data.keyboardType;

  DarziFormEnity(
    this.title,
    this.hintText, {
    this.validator,
    this.minLines,
    this.inputFormatters,
    this.keyboardType,
    this.onChanged,
  });
  final String title;
  final String hintText;
  final TextInputType? keyboardType;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final controller = TextEditingController();

  final String? Function(String? val)? validator;
  void Function(String? val)? onChanged;
}

class DarziFormEnityPic extends DarziFormEnity {
  final Rx<FileOrImgUrl?> url = Rx<FileOrImgUrl?>(null);
  RxBool isHidden = false.obs;
  final bool checkImageValidation;
  DarziFormEnityPic(DarziFormEnity darziFormEnity,
      {this.checkImageValidation = true})
      : super.copy(darziFormEnity);
  bool get isSelected => url.value == null;

  String? isValid(int pos) {
    final imgVal = url.value;
    if (checkImageValidation && (imgVal == null || imgVal.isValid != null)) {
      return "Service ${pos + 1}: Please Add Image, ";
    }
    return null;
  }
}
