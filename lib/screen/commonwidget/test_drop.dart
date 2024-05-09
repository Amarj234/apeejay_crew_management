import 'package:apeejay_crew_management/utils/constimage.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/color.dart';



class TestDrop extends StatelessWidget {
  const TestDrop({super.key, required this.list, required this.hint,  this.textcolor=AppColor.main, required this.bordercolor, this.fillcolor,  this.iswhite=false, required this.mayfun, this.selectedValue});
  final List<String> list;
  final String hint;
  final Color textcolor;
  final Color bordercolor;
  final Color? fillcolor;
  final bool iswhite;
  final String? selectedValue;

  final Function(String? val) mayfun;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    final List<DropdownMenuItem<String>> menuItems = [];
    for (final String item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style:  GoogleFonts.roboto(
                  color: textcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  List<double> _getCustomItemsHeights() {
    final List<double> itemsHeights = [];
    for (int i = 0; i < (list.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

    @override
    Widget build(BuildContext context) {
      return  Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: fillcolor,
border: Border.all(color: bordercolor),
          borderRadius: BorderRadius.circular(5)
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(
              hint,
              style:  GoogleFonts.roboto(
                color: textcolor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            items: _addDividersAfterItems(list),
            value: selectedValue,
            onChanged: mayfun,
            buttonStyleData:  ButtonStyleData(
             // overlayColor: MaterialStateProperty.all(Colors.red),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              height: 40,
              width: MediaQuery.of(context).size.width-40,
            ),
            dropdownStyleData:  DropdownStyleData(
              decoration: BoxDecoration(color:iswhite ?Colors.white: bordercolor),
              maxHeight: 300,
            ),
            menuItemStyleData: MenuItemStyleData(
            //  overlayColor: MaterialStateProperty.all(Colors.red),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              customHeights: _getCustomItemsHeights(),
            ),
            iconStyleData:  IconStyleData(
              iconDisabledColor:textcolor,
              iconEnabledColor:textcolor,
              icon: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Image.asset(AssetImages.arrowdown,color: textcolor),
              ),
              openMenuIcon: Icon(Icons.arrow_drop_up,color: textcolor,),
            ),
          ),
        ),
      );
    }
}
