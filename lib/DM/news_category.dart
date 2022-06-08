enum NewsCategory { animal, finance, globalWarming }

extension NewsCategoryExtension on NewsCategory {
  String get imagepath {
    switch (this) {
      case NewsCategory.animal:
        return 'assets/animal.jpeg';
      case NewsCategory.finance:
        return "assets/finance.jpeg";
      case NewsCategory.globalWarming:
        return "assets/global_warming.jpeg";
      default:
        return null;
    }
  }

//   String get rawValue {
//     switch (this) {
//       case NewsStatus.closed:
//         return "closed";
//       case NewsStatus.responded:
//         return "responded";
//       case NewsStatus.pendingResponse:
//         return "pending response";
//       default:
//         return null;
//     }
//   }
}
