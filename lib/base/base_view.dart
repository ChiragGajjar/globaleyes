abstract class BaseView<T> {
  void onError(String key);

  void showError(String errorMessage);

  void showErrorWithListener(String errorMessage, Function onPositiveClicked);

  void showProgress();

  void hideProgress();
}
