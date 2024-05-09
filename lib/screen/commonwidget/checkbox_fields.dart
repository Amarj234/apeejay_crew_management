import 'package:apeejay_crew_management/utils/color.dart';
import 'package:flutter/material.dart';


class CheckboxFormField extends FormField<bool> {
  CheckboxFormField({Widget? title,
    FormFieldSetter<bool>? onSaved,
    FormFieldValidator<bool>? validator,
    bool initialValue = false,
  required final  bool autovalidate })
      : super(
      onSaved: onSaved,

      validator: validator,
      initialValue: initialValue,
      builder: (FormFieldState<bool> state) {
        return CheckboxListTile(

          visualDensity:  VisualDensity(horizontal: -4.0, vertical:-4.0),
          materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
          activeColor:AppColor.greenlight,
          dense: state.hasError,
          title: title,
          value: state.value,

          onChanged: (bool? data){
            state.didChange(data);
            onSaved!(data);

          },
          subtitle: state.hasError
              ? Builder(
            builder: (BuildContext context) =>
                Text(
                  state.errorText ?? "",
                  style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .error),
                ),
          )
              : null,
          controlAffinity: ListTileControlAffinity.leading,

        );
      });

}