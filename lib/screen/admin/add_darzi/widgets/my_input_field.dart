import 'package:darzi_nearby/darzi_nearby.dart';

class MyInputField extends StatelessWidget {
  const MyInputField(
    this.data, {
    super.key,
  });
  final DarziFormEnity data;
  OutlineInputBorder get _border => OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: ColorConfig.grayLight,
        width: 0,
      ));
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.title,
            style: MyTextStyles.r12Medium,
          ),
          const SizedBox(height: 8),
          TextFormField(
            maxLines: data.minLines,
            minLines: data.minLines,
            controller: data.controller,
            keyboardType: data.keyboardType,
            validator: data.validator,
            inputFormatters: data.inputFormatters,
            onChanged: data.onChanged,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: ColorConfig.gray),
              border: _border,
              hintText: data.hintText,
            ),
          ),
        ],
      ),
    );
  }
}
