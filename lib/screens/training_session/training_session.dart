import 'package:globaleyes/base/base_stateful_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../common_imports.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class TrainingSession extends StatefulWidget {
  TrainingSession({Key? key}) : super(key: key);
  @override
  TrainingSessionState createState() => TrainingSessionState();
}

class TrainingSessionState extends BaseStatefulWidgetState<TrainingSession> {

  @override
  void afterFirstLayout(BuildContext context) {
    // TODO: implement afterFirstLayout
  }
  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
  }
  @override
  Widget getBodyWidget(Size size) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Image(
                image:AppImages.appLogo,
                height: 80.0,
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Image(
                image:AppImages.worker,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: Text(
              'Vasquez, Sophia',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              'Training Sessions:',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Personal Protective Equipment (PPE)',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Proper Lifting',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Situational Awareness',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Sexual Harassment',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
          const Spacer(),

          InkWell(
            onTap: (){
              _scan();
            },
            child: Container(
              height: 50,
              // width: size.width - 20,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              color: AppColors.themGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Click Here to Take Attendance',
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
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
  Future _scan() async {
    await Permission.camera.request();
    String? barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      pushNamed(context, AppRoute.attendedSession);
    }
  }
}
