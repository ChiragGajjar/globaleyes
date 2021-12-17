import 'package:globaleyes/base/base_stateful_widget.dart';
import 'package:globaleyes/screens/department_details/department_details_cardview.dart';
import '../../common_imports.dart';

class ObservationDetails extends StatefulWidget {
  ObservationDetails({Key? key}) : super(key: key);
  @override
  ObservationDetailsState createState() => ObservationDetailsState();
}

class ObservationDetailsState extends BaseStatefulWidgetState<ObservationDetails> {

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    pop(context);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: const Image(
                      image:AppImages.icBackGrey,
                      height: 20,
                      width: 20,
                      color: AppColors.white,
                    ),
                  ),
                ),
                const Text(
                  'Safety Observations',
                  style: TextStyle(
                    fontFamily: FontsFamily.GilroyRegular,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                Text(
                  'Department',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Bakery',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  'Date and Time',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  '8/23/2020 9:38 PM',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  'Employee Name',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'David Pastry',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  '1. Did employee theroaghly wash his/her hands and then don the lab coat buttoned all the way to the top?',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'No',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  '2. Did employee use the shoe scrub to get rid of any particles stuck to the bottom of their shoes?',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'No',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  '3. Did employee collect the required PPE before proceeding to their respective workstation?',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'No',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),

                Text(
                  '4. Did employee make sure that there is proper interlocking in the mixer before operating?',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.bold,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'No',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: FontsFamily.GilroyRegular,
                    fontWeight: FontWeight.w400,
                    color:AppColors.black,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          )

        ],
      ),
    );
  }

}
