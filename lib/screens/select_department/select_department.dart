import 'package:globaleyes/base/base_stateful_widget.dart';
import 'package:globaleyes/shared/text_field/custom_text_feild.dart';
import '../../common_imports.dart';

class SelectDepartment extends StatefulWidget {
  SelectDepartment({Key? key}) : super(key: key);
  @override
  SelectDepartmentState createState() => SelectDepartmentState();
}

class SelectDepartmentState extends BaseStatefulWidgetState<SelectDepartment> {

  List<String> arrSelectDepartment = ['Transportation','Operations'];
  var _DepartmentController = TextEditingController();


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
                const Center(
                  child: Text(
                    'Select Department',
                    style: TextStyle(
                        fontFamily: FontsFamily.GilroyRegular,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white),
                  ),
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                ),

              ],
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
                'Department',
                style: TextStyle(
                    fontFamily: FontsFamily.GilroyRegular,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkBlue),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                margin: const EdgeInsets.all(20),
                height: 50,
                color: AppColors.themGreen,
                child: CustomDropDownTextField<String>(
                  controller: _DepartmentController,
                  inputType: TextInputType.name,
                  hint: '',
                  state: this,
                  data: arrSelectDepartment,
                  getTextFromModel: (strName) => strName,
                  onSelect: (index) {
                    var name = arrSelectDepartment[index];
                    _DepartmentController.text = name;
                    pushNamed(context, AppRoute.departmentDetails);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}
