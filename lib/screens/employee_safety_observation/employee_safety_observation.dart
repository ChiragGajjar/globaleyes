import 'package:globaleyes/base/base_stateful_widget.dart';
import '../../common_imports.dart';

class EmployeeSafetyObservation extends StatefulWidget {
  EmployeeSafetyObservation({Key? key}) : super(key: key);
  @override
  EmployeeSafetyObservationState createState() => EmployeeSafetyObservationState();
}

class EmployeeSafetyObservationState extends BaseStatefulWidgetState<EmployeeSafetyObservation> {

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
          Container(
            height: 50,
            color: AppColors.themGreen,
            child: const Center(
              child: Text(
                'Employee Safety Observation',
                style: TextStyle(
                    fontFamily: FontsFamily.GilroyRegular,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white),
              ),
            ),
          ),
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
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Welcome',
                style: TextStyle(
                    fontFamily: FontsFamily.GilroyRegular,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkBlue),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Center(
              child: Text(
                'Observer',
                style: TextStyle(
                    fontFamily: FontsFamily.GilroyRegular,
                    fontSize: 17.0,
                    fontWeight: FontWeight.normal,
                    color: AppColors.darkBlue,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(size.width - 100 / 2),
              child: Image(
                image:AppImages.worker,
                height: size.width - 200,
                width: size.width - 200,
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

          const Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  pop(context);
                },
                child: Container(
                  height: 50,
                  width: 150,
                  color: AppColors.themGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Exit',
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
              InkWell(
                onTap: (){
                  pushNamed(context, AppRoute.selectDepartment);
                },
                child: Container(
                  height: 50,
                  width: 150,
                  color: AppColors.themGreen,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue',
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
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

}
