import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:technoprise_test/imports.dart';

class WorkaHubTextFormField extends HookWidget {
  const WorkaHubTextFormField({
    super.key,
    required TextEditingController controller,
    this.validators,
    this.inputFormatters,
    required this.name,
    required this.onchanged,
    required this.textInputType,
    this.isObsecure = false,
    this.suffixIcon,
    this.isRounded = false,
    this.prefixIcon,
    this.maxLines,
    this.borderWidth = 1.0,
    this.alignText = TextAlignVertical.center,
    this.filledColor,
    this.hasFilledColor = false,
    this.hintText,
    this.textAlign = TextAlign.center,
    required this.title,
  }) : _controller = controller;

  final TextEditingController _controller;
  final FormFieldValidator<String>? validators;
  final List<TextInputFormatter>? inputFormatters;
  final String name;
  final Function(dynamic val) onchanged;
  final TextInputType textInputType;
  final bool isObsecure;
  final Widget? suffixIcon;
  final bool isRounded;
  final Icon? prefixIcon;
  final int? maxLines;
  final double borderWidth;
  final TextAlignVertical alignText;
  final Color? filledColor;
  final bool hasFilledColor;
  final String? hintText;
  final TextAlign textAlign;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: fontSize14500.copyWith(
            color: COLORBLACK,
          ),
        ),
        SizedBox(
          height: AppSizes.appHeight(4),
        ),
        FormBuilderTextField(
          textAlignVertical: alignText,
          textAlign: textAlign,
          maxLines: maxLines,
          obscureText: isObsecure,
          controller: _controller,
          autovalidateMode: AutovalidateMode.disabled,
          name: name,
          decoration: inputDecorations(
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
          onChanged: onchanged,
          validator: validators,
          inputFormatters:
              textInputType == TextInputType.number ? inputFormatters : null,
          keyboardType: textInputType,
          textInputAction: TextInputAction.next,
        ),
      ],
    );
  }
}

inputDecorations(
    {String? labelText,
    String? hintText,
    Icon? prefixIcon,
    Widget? suffixIcon}) {
  return InputDecoration(
    fillColor: COLORWHITE,
    filled: true,
    contentPadding: const EdgeInsets.all(10.0),
    labelText: labelText,
    hintText: hintText,
    hintStyle: fontSize12400,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: COLORBLACK,
      ),
      borderRadius: BorderRadius.circular(
        AppSizes.appCustomSize(8),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: COLORBLACK,
      ),
      borderRadius: BorderRadius.circular(
        AppSizes.appCustomSize(8),
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: COLORRED,
      ),
      borderRadius: BorderRadius.circular(
        AppSizes.appCustomSize(8),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: COLORRED,
      ),
      borderRadius: BorderRadius.circular(
        AppSizes.appCustomSize(8),
      ),
    ),
  );
}
