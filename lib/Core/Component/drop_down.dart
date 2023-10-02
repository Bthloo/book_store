import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import '../../Features/Check out Screem/Model/Governrates/Data.dart';


class DefaultDropDown extends StatelessWidget {
  SingleValueDropDownController controller;
  String label;
  List<GovernorateData> list;
  String? initialValue;
  //Function() validation;
  DefaultDropDown({
    super.key,
    required this.controller,
    required this.label,
  //  required this.hint,
    required this.list,
    this.initialValue,

  });
  @override
  Widget build(BuildContext context) {

    return DropDownTextField(
      validator: (value) {
        if(value?.length == 0 ){
          return 'Select the city';
        }
      },
      textFieldDecoration:  InputDecoration(
        labelText: label,
        enabledBorder: OutlineInputBorder(),
      ),
      controller: controller,
       searchDecoration: InputDecoration(hintText: 'Search For A City'),
       enableSearch: true,
      initialValue: initialValue,
      dropDownItemCount: list.length,
      dropDownList: list.map<DropDownValueModel>((value) {
        return DropDownValueModel(
          name: value.governorateNameEn??'',
          value: value.id??''
        );
      }).toList(),
      onChanged: (value) {
      },
    );



    //   BlocConsumer<GetAllManagerCubit, GetAllManagerViewState>(
    //   bloc: viewModel,
    //   listener: (context, state) {
    //     // TODO: implement listener
    //   },
    //   builder: (context, state) {
    //     if(state is GetAllManagerLoadingState){
    //       return CircularProgressIndicator();
    //     }
    //     else if(state is GetAllManagerFailState){
    //       return Text(state.message);
    //     }
    //     else if(state is GetAllManagerSuccessState){
    //       return DropDownTextField(
    //         textFieldDecoration: const InputDecoration(
    //           labelText: "Assign Manager",
    //           enabledBorder: OutlineInputBorder(),
    //         ),
    //         controller: controller,
    //        // searchDecoration: InputDecoration(hintText: hint),
    //        // enableSearch: true,
    //         dropDownItemCount: list.length??0,
    //         dropDownList: list.map<DropDownValueModel>((value) {
    //           return DropDownValueModel(
    //             value: value?.id,
    //             name: value?.name??"",
    //           );
    //         }).toList(),
    //         onChanged: (value) {
    //         },
    //       );
    //     }
    //     else {
    //       return Container();
    //     }
    //
    //
    //   },
    // );
  }
}