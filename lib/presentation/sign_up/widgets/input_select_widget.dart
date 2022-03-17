import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obenx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obenx_com_br_app/presentation/themes.dart';

class InputSelectWidget extends StatefulWidget {
  InputSelectWidget({
    Key? key,
    required this.index,
    required this.pageController,
  }) : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _InputSelectWidgetState createState() => _InputSelectWidgetState();
}

class _InputSelectWidgetState extends State<InputSelectWidget> {

  String _selectedButton = 'Solteiro';
  String _documentSelectedButton = 'CNH';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: state.configs[widget.index].selectValues.length,
          itemBuilder: (context, index) {
            return StatusButton(
              onPressed: (value) {
                setState(() => state.configs[widget.index].modelName == 'civilStatus' ? _selectedButton = value : _documentSelectedButton = value);
                context.read<SignUpFormCubit>().fieldChanged('civilStatus', value);
                context.read<SignUpFormCubit>().fieldChanged('documentType', value);
              }, 
              groupValue: state.configs[widget.index].modelName == 'civilStatus' ? _selectedButton :  _documentSelectedButton, 
              value: state.configs[widget.index].selectValues[index], 
              label: state.configs[widget.index].selectValues[index],
            );
          },
        ),
        SizedBox(height: 80),
        Container(
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: BoxDecoration(
                gradient: TextStyles.gradientColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ElevatedButton(
                onPressed: () {
                      widget.pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn,
                    );
                },
                style: TextStyles.buttonStyle,
                child: Text('Avançar', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        );
       },  
    );
  }
}

class StatusButton extends StatelessWidget {
  const StatusButton({
    Key? key,
    required this.onPressed,
    required this.groupValue,
    required this.value,
    required this.label,
  }) : super(key: key);

  final void Function(String value) onPressed;
  final String groupValue;
  final String value;
  final String label;

  bool get _isSelected => value == groupValue;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
      listener: (BuildContext context, SignUpFormState state) {},
      builder: (BuildContext context, SignUpFormState state) {
        return Column(
          children: [
            Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: !_isSelected ? Color(0xff26262B) : Colors.white,
              ),
              child: ElevatedButton(
                onPressed: () => onPressed(value),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(label, style: TextStyle(color: _isSelected ? Colors.black : Colors.white)),
                      if (_isSelected) 
                        Icon(Icons.check, color: Colors.black)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 7),
          ],
        );
      },
    );
  }
}
