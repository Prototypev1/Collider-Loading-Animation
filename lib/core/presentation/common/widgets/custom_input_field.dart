import 'package:collider_loading/core/presentation/common/styles/custom_colors.dart';
import 'package:collider_loading/core/presentation/common/styles/custom_text_styles.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.controller,
    this.initialValue,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.autofocus = false,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.borderRadius = const BorderRadius.all(Radius.circular(25)),
    this.enabledBorderColor,
    this.focusedBorderColor,
    this.errorBorderColor,
    this.disabledBorderColor,
    this.hintStyle,
    this.textStyle,
    this.labelStyle,
    this.fillColor,
    this.filled = false,
    this.width = double.infinity,
    this.height = 80,
    this.textColor,
    this.cursorColor,
    this.textInputAction = TextInputAction.done,
    this.textInputType = TextInputType.text,
  });

  final TextEditingController? controller;
  final String? initialValue;
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool enabled;
  final bool autofocus;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final BorderRadius borderRadius;
  final Color? enabledBorderColor;
  final Color? focusedBorderColor;
  final Color? errorBorderColor;
  final Color? disabledBorderColor;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final Color? fillColor;
  final bool filled;
  final double width;
  final double height;
  final Color? textColor;
  final Color? cursorColor;
  final TextInputAction textInputAction;
  final TextInputType textInputType;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  final _node = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _node.addListener(() {
      if (!_node.hasFocus) {
        _formKey.currentState?.validate();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final inputTextColor = widget.textColor ?? theme.extension<CustomColorScheme>()!.primaryText!;
    final cursorCol = widget.cursorColor ?? inputTextColor;

    final enabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.enabledBorderColor ?? theme.dividerColor, width: 2),
    );
    final focusedBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.focusedBorderColor ?? cursorCol, width: 2),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.errorBorderColor ?? theme.colorScheme.error, width: 2),
    );
    final disabledBorder = OutlineInputBorder(
      borderRadius: widget.borderRadius,
      borderSide: BorderSide(color: widget.disabledBorderColor ?? theme.disabledColor, width: 2),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: widget.labelStyle ??
                CustomTextStyles.of(context).medium14.apply(color: CustomColors.of(context).primaryText),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          width: widget.width,
          height: widget.validator != null ? widget.height : 48,
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: widget.controller,
              initialValue: widget.controller == null ? widget.initialValue : null,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              autofocus: widget.autofocus,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              style: widget.textStyle ?? TextStyle(color: inputTextColor),
              cursorColor: cursorCol,
              onChanged: widget.onChanged,
              validator: widget.validator,
              focusNode: _node,
              onSaved: widget.onSaved,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: widget.hintStyle ?? theme.inputDecorationTheme.hintStyle?.copyWith(color: inputTextColor),
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                contentPadding: widget.contentPadding,
                enabledBorder: enabledBorder,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                disabledBorder: disabledBorder,
                border: enabledBorder,
                filled: widget.filled,
                fillColor: widget.fillColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
