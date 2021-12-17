
import 'package:globaleyes/base/base_stateful_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import '../../common_imports.dart';

class ScannerScreen extends StatefulWidget {
  ScannerScreen({Key? key}) : super(key: key);
  @override
  ScannerScreenState createState() => ScannerScreenState();
}

class ScannerScreenState extends BaseStatefulWidgetState<ScannerScreen> {
  late TextEditingController _QRCodeController;
  FocusNode myFocusNodeEmail = FocusNode();

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
  @override
  void initState() {
    super.initState();
    _QRCodeController = TextEditingController();
  }

  @override
  void dispose() {
    _QRCodeController.dispose();
    myFocusNodeEmail.dispose();
    super.dispose();
  }
  @override
  Widget getBodyWidget(Size size) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 50,
            ),
            const Center(
              child: Image(
                image:AppImages.appLogo,
                // width: 140.0,
                height: 140.0,
              ),
            ),

            Column(
              children: [
                const Text(
                  'Scan Observer/Trainer ID',
                  style: TextStyle(
                      fontFamily: FontsFamily.GilroyRegular,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue),
                ),

                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _QRCodeController,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.green, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.darkBlue, width: 1.0),
                            ),
                            hintText: 'Scan Code',
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          _scan();
                          // pushNamed(context, AppRoute.userCompanyDetails);
                        },
                        child: const Image(
                          image:AppImages.barcodeScanner,
                          width: 50.0,
                          height: 50.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'To Begin, Tap the Above Bar Code, then Scan the QR Code on Your Company ID Badge',
                  style: TextStyle(
                      fontFamily: FontsFamily.GilroyRegular,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkBlue
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),

            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                pushNamed(context, AppRoute.userCompanyDetails);
              },
              child: Container(
                height: 50,
                width: size.width,
                color: AppColors.themGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Click Here to Scan Company ID',
                      style: TextStyle(
                          fontFamily: FontsFamily.GilroyRegular,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      _QRCodeController.text = barcode;
    }
  }
}
