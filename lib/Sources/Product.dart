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
    product.price = query['price'];               //// This is basically to get the input ;)
    product.quantity = query['quantity'];
    return product;
  }

  //////////////To map ------- Product
  static Map<String, dynamic> toMap(Product product){


    return <String, dynamic>{
      'id' : product.id,
      'name': product.name,                 //// This is basically to get the output ;)
      'price' : product.name,
      'quantity' : product.name,
    };
  }


  //// From   map list -------- Map list -----> Product List
  static List<Product> fromList(List<Map<String, dynamic>> query)
  {
    List<Product> products = List <Product>();
    for(Map mp in query){
      products.add(fromMap(mp));
    }
    return products;
  }


}




//Short answer:
//Instead of the pre-null-safety operations

//var foo = List<int>();  // Now error
//var bar = List<int>(n); // Now error
//var baz = List<int>(0); // Now error
//use the following:

//var foo = <int>[];           // Always the recommended way.
//var bar = List.filled(1, 0); // Not filled with `null`s.
//var baz = List<int>.empty();
//Long answer:
//The List constructor had two uses:

//new List() to create an empty growable list, equivalent to [].
//new List(n) to create a fixed-length list of length n filled with null values
//With null safety, the second use was unsound most of the time, and there was no good way to fix it. It's possible to force a type argument to be non-nullable, but List<T>(4) only works when T is nullable. There is no way to enforce that.

//So, the List(n) mode needed to go (replaced by List.filled(n, value) which forces you to provide a fill-value). That left List(), which doesn't really carry its own weight. You can just use [] instead (and you should!), so it was decided to remove the constructor entirely - all uses of it was either unsafe or useless. (Also, it was a weird constructor already, because if we wanted to properly make it null safe, it would have an optional parameter with a non-nullable type and no default value.)

//By removing it completely, it makes it possible to, potentially, introduce a new List constructor in the future, perhaps as a shorter alias for List.filled. One can hope.