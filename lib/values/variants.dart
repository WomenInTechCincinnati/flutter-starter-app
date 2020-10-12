class Variant {
  final String appName;
  final String variantLabel;
  final String apiApplicationId;
  final String baseUrl;

  Variant.production()
      : appName = "WWCodeCincinnati",
        variantLabel = "",
        apiApplicationId = "com.womenwhocode.cincinnati",
        baseUrl = "http://my-json-server.typicode.com/WomenWhoCodeCincy";


  Variant.test()
      : appName = "WWCodeCincinnati Test",
        variantLabel = "test",
        apiApplicationId = "com.womenwhocode.cincinnati.test",
        baseUrl = "http://my-json-server.typicode.com/WomenWhoCodeCincy";

  Variant.development()
      : appName = "WWCodeCincinnati Dev",
        variantLabel = "dev",
        apiApplicationId = "com.womenwhocode.cincinnati.dev",
        baseUrl = "http://my-json-server.typicode.com/WomenWhoCodeCincy";
}