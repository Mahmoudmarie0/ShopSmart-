import 'package:get/get.dart';
import 'package:shop_smart/models/cart_model.dart';
import 'main_controller.dart';

class CartController extends GetxController {
  MainController mainController = Get.find();

  void changeQuantity({required String productId, required int quantity}) {
    mainController.cartItem.update(
      productId,
      (value) => CartModel(
        cartId: value.cartId,
        productId: productId,
        quantity: quantity,
      ),
    );
    update();
  }

  double getTotalPrice() {
    double total = 0.0;
    mainController.cartItem.forEach((key, value) {
      String price = mainController.findByProdId(value.productId)!.productPrice;
      if (price.isEmpty) {
        return;
      } else {
        total += double.parse(price) * value.quantity;
      }
    });
    return total;
  }

  void removeOneItem(String productId) {
    mainController.cartItem.remove(productId);
    update();
  }

  void clearCart() {
    mainController.cartItem.clear();
    update();
  }

  int getQtyuantity() {
    int total = 0;
    mainController.cartItem.forEach((key, value) {
      total += value.quantity;
    });
    return total;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    mainController.getCartItem;
    update();
  }
}