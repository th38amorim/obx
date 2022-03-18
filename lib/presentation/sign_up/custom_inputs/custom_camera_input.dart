import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obx_com_br_app/application/sign_up/sign_up_form_cubit.dart';
import 'package:obx_com_br_app/presentation/common/obenx_app_bar.dart';
import 'package:obx_com_br_app/presentation/themes.dart';

class CustomCameraInput extends StatefulWidget {
  const CustomCameraInput({Key? key, required this.index, required this.pageController}) : super(key: key);

  final int index;
  final PageController pageController;

  @override
  _CustomCameraInputState createState() => _CustomCameraInputState();
}

class _CustomCameraInputState extends State<CustomCameraInput> {

  final ImagePicker _picker = ImagePicker();
  Uint8List picture = Uint8List(0);
  bool hasPictureSelect = false;

  @override
  void initState() {
    super.initState();
  }

  void _openCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    picture = await photo!.readAsBytes();
    setState(() {
      hasPictureSelect = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpFormCubit, SignUpFormState>(
    listener: (BuildContext context, SignUpFormState state) {},
    builder: (BuildContext context, SignUpFormState state) {
      return Scaffold(
        appBar: ObenxAppBar(),
        backgroundColor: backgroundDarkColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(state.configs[widget.index].label, style: TextStyle(color: Colors.white, fontSize: 22),),
                SizedBox(height: 20,),
                hasPictureSelect ?
                  Image.memory(picture)
                : GestureDetector(
                  onTap: () async {
                    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
                    picture = await photo!.readAsBytes();
                    setState(() {
                      hasPictureSelect = true;
                    });
                  },
                  child: Stack(
                    children: [
                      Positioned(
                        right: -1,
                        child: Icon(Icons.add, color: Colors.white, size: MediaQuery.of(context).size.width * 0.15,)
                      ),
                      Icon(Icons.camera_alt_outlined, color: primaryColor, size: MediaQuery.of(context).size.width - 80,),
                    ],
                  )
                ),
                SizedBox(height: 20,),
                Text('Atenção: verifique se todos os dados estão legíveis e se não há algum reflexo na imagem', style: TextStyle(color: Colors.white),),
                if(hasPictureSelect)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              _openCamera();
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(2),
                              fixedSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.40, 45)),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              shadowColor: MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                            ),
                            child: Text('Refazer', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: TextStyles.gradientColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<SignUpFormCubit>().fieldChanged(state.configs[widget.index].modelName, base64.encode(picture.toList()));
                              widget.pageController.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeIn,
                              );
                            },
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all<double>(2),
                              fixedSize: MaterialStateProperty.all<Size>(Size(MediaQuery.of(context).size.width * 0.40, 45)),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              shadowColor: MaterialStateProperty.all(Colors.transparent),
                              shape: MaterialStateProperty.all<OutlinedBorder>(
                                  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25)))),
                            ),
                            child: Text('Prosseguir', style: TextStyle(color: Colors.black)),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
