// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(min, max) => "Min of ${min}, Max of ${max} characters";

  static String m1(n) => "${n} items";

  static String m2(name) => "${name} was added";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToCart": MessageLookupByLibrary.simpleMessage("Add to cart"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "cart": MessageLookupByLibrary.simpleMessage("Cart"),
        "cartIsEmpty": MessageLookupByLibrary.simpleMessage(
            "There is no items in the cart."),
        "characterLimit": m0,
        "checkout": MessageLookupByLibrary.simpleMessage("Checkout"),
        "checkoutDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Would you like to purchase the selected product?"),
        "checkoutDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("Purchased successfully."),
        "dark": MessageLookupByLibrary.simpleMessage("Dark"),
        "delete": MessageLookupByLibrary.simpleMessage("Delete"),
        "deleteDialogDesc": MessageLookupByLibrary.simpleMessage(
            "Do you want to delete the selected product?"),
        "deleteDialogSuccessToast": MessageLookupByLibrary.simpleMessage(
            "The selected items has been deleted."),
        "description": MessageLookupByLibrary.simpleMessage("Description"),
        "en": MessageLookupByLibrary.simpleMessage("English"),
        "enterUserBday":
            MessageLookupByLibrary.simpleMessage("What is your date of birth?"),
        "enterUserName":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "items": m1,
        "ko": MessageLookupByLibrary.simpleMessage("Korean"),
        "language": MessageLookupByLibrary.simpleMessage("Language"),
        "light": MessageLookupByLibrary.simpleMessage("Light"),
        "noProduct":
            MessageLookupByLibrary.simpleMessage("There is no product."),
        "product": MessageLookupByLibrary.simpleMessage("Product"),
        "productAdded": m2,
        "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
        "register": MessageLookupByLibrary.simpleMessage("Continue"),
        "searchProduct": MessageLookupByLibrary.simpleMessage("Search product"),
        "selectedItems": MessageLookupByLibrary.simpleMessage("Selected Items"),
        "shopping": MessageLookupByLibrary.simpleMessage("Shopping"),
        "signInMsg": MessageLookupByLibrary.simpleMessage(
            "Get started with a SNS Account"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip"),
        "theme": MessageLookupByLibrary.simpleMessage("Theme"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("Total Price"),
        "uploadProfileImage":
            MessageLookupByLibrary.simpleMessage("Upload profile photo"),
        "userBday": MessageLookupByLibrary.simpleMessage("Date of birth"),
        "userName": MessageLookupByLibrary.simpleMessage("Your Name"),
        "userProfileImage":
            MessageLookupByLibrary.simpleMessage("Profile Photo")
      };
}
