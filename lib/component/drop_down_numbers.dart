import 'package:flutter/material.dart';

import '../presentation/resources/color_manager.dart';


class DropDownNumbers extends StatelessWidget {
  final int listLength;
  final String? identifier;
  final int from;
  final int? groupValue;
  final Function onTap;
  final IconData icon;
  final double width;
  final Color color;

  const DropDownNumbers({Key? key, this.identifier,required this.from, required this.listLength, required this.groupValue, required this.onTap, this.icon = Icons.arrow_drop_down_outlined,this.color = Colors.white,this.width = 230}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8),

        decoration: BoxDecoration(
          color: color,
          border: Border.all(width: 1.5,color: ColorManager.primary.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: DropdownButton(
         // hint: Text(identifier),
          alignment: AlignmentDirectional.bottomEnd,
          iconEnabledColor: Colors.black,
          icon: Icon(icon),
          borderRadius: BorderRadius.circular(4),
          //style: Themes.normal15(color: Colors.red),
          isExpanded: true,
          value: groupValue,
          underline: Container(),
          dropdownColor: Colors.white,
          items: List.generate(listLength, (index) {
            return DropdownMenuItem(
              value: index + from,
              onTap: null,
              child: Text((index + from).toString(),
                  style: Theme.of(context).textTheme.subtitle1,
              ),
            );
          }),
          onChanged: (value)=> onTap(value),//(value) {print("this is important value $value");},
        ));
  }
}
