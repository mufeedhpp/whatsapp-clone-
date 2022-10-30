import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

List <CameraDescription> cameras=[];

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
    Future<void>? cameraValue;
    int index=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraController = CameraController(cameras[index],ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }
  Widget build(BuildContext context) {
    
    
    return Container(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
          ),
          FutureBuilder(
            future: cameraValue,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.connectionState==ConnectionState.done){

              
              return CameraPreview(_cameraController);
            }else{
              return CircularProgressIndicator();
            }
            },
          ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.panorama,color: Colors.teal,),
                Icon(Icons.panorama_fish_eye,
                size: 60,
                color: Colors.teal,
                ),
                IconButton(icon: Icon(Icons.camera_alt_outlined,size: 40,color: Colors.teal,),
                onPressed: () {
                  print(index);
                  setState(() {
                    index = index == 0? 1 :0;
                    _cameraController = CameraController(
                      cameras[index],ResolutionPreset.ultraHigh);
                      cameraValue = _cameraController.initialize();
                  });
                
                }
        )
              ],
            ),
          ),
        ),
        ],
        
        ),
    );
    
  }
}