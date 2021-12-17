import 'package:globaleyes/base/base_stateful_widget.dart';
import 'package:globaleyes/screens/department_details/department_details_cardview.dart';
import '../../common_imports.dart';

class DepartmentDetails extends StatefulWidget {
  DepartmentDetails({Key? key}) : super(key: key);
  @override
  DepartmentDetailsState createState() => DepartmentDetailsState();
}

class DepartmentDetailsState extends BaseStatefulWidgetState<DepartmentDetails> {

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
                  'Observation',
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
            child: Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: true,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: List.generate(
                  5,
                      (index) {
                    return InkWell(
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const DepartmentDetailsCardView(),
                      ),
                      onTap:() {
                        pushNamed(context, AppRoute.observationDetails);
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
