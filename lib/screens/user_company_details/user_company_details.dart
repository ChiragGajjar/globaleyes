
import 'package:globaleyes/base/base_stateful_widget.dart';
import '../../common_imports.dart';

class UserCompanyDetailsScreen extends StatefulWidget {
  UserCompanyDetailsScreen({Key? key}) : super(key: key);
  @override
  UserCompanyDetailsScreenState createState() => UserCompanyDetailsScreenState();
}

class UserCompanyDetailsScreenState extends BaseStatefulWidgetState<UserCompanyDetailsScreen> {

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
      child: Center(
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Image(
                  image:AppImages.appLogo,
                  // width: 140.0,
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
            const Text(
              'Vasquez, Sophia',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
            const Text(
              'Production Supervisor',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
            const Text(
              'Shipping',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
            const Text(
              'November 9, 2021',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
            const Text(
              '05:40 p.m.',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue),
            ),
            const SizedBox(
              height: 20,
            ),

            const SizedBox(
              height: 20,
            ),
            const Text(
              'Choose One of the Following:',
              style: TextStyle(
                  fontFamily: FontsFamily.GilroyRegular,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkBlue
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: (){
                pushNamed(context, AppRoute.trainingSession);
              },
              child: Container(
                height: 50,
                width: size.width,
                color: AppColors.themGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Employee Training',
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
              height: 20,
            ),
            InkWell(
              onTap: (){
                pushNamed(context, AppRoute.employeeSafetyObservation);
              },
              child: Container(
                height: 50,
                width: size.width,
                color: AppColors.themGreen,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Employee Safety Observation',
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

}
