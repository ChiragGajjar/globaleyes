import 'package:globaleyes/base/base_stateful_widget.dart';
import '../../common_imports.dart';

class AttendedSession extends StatefulWidget {
  AttendedSession({Key? key}) : super(key: key);
  @override
  AttendedSessionState createState() => AttendedSessionState();
}

class AttendedSessionState extends BaseStatefulWidgetState<AttendedSession> {

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
                height: 100.0,
              ),
            ],
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
              'Attendees',
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
              'Justin Bieber',
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
              'Captain James T. Kirk',
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
              'Lady Gaga',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
          ),
        ],
      ),
    );
  }

}
