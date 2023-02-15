class Product{

  int id;
  String name;
  String price;
  int quantity;


  // Constructor
  Product({required this.id, required this.name, required this.price, required this.quantity});

  // made static to be accessible from other classes
  // Since data type is not known the value is made as "dynamic"
  //////////////// From map....... Map=> Product object (product)
  static Product fromMap(Map<String, dynamic>query)
  {
    Product product = Product();
    product.id = query['id'];         // Database Column names id,name,price,quantity
    product.name = query['name'];
    product.price = query['price'];
    product.quantity = query['quantity'];
    return product;
  }

  //////////////To map ------- Product
  static Map<String, dynamic> toMap(Product product){


    return
  }


}