import 'package:flutter/material.dart';
import 'package:torch_controller/torch_controller.dart';
class Torch extends StatefulWidget {
  const Torch({super.key});

  @override
  State<Torch> createState() => _TorchState();
}

class _TorchState extends State<Torch> {

  var isActive=false;
  var torchController=TorchController();
  var check='OFF';
  checkout(isActive){
    if(isActive){
      check='ON';
    }
    else{
      check='OFF';
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Torch Lite',
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 30,
                    maxRadius: 45,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            torchController.toggle();
                            isActive=!isActive;
                            checkout(isActive);
                          });

                        },
                        icon: const Icon(Icons.power_settings_new,),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  Text(
                    check,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'Developed by Anish',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: size.height*0.04,
          )
        ],
      ),
    );
  }
}
