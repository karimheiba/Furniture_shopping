class ProductModel{

final int id;
final String title;
 final  double price; 
 final  String description;
 final String imageUrl;
  Map? category;
  final double rating;


  ProductModel( {
required this.id,
required this.title,
   required this.price, 
   required this.description,
   required this.imageUrl,
   this.category,
   this.rating=0,

 
  
  });


   static List <ProductModel> product=[
    ProductModel(
     id: 1,
    price: 50,
    title: "Minimal Stand",
  
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
   imageUrl:"assets/images/item.png",
   category: {"category":"lamp"},
   rating:4.3,

     ),
       ProductModel(
      id: 2,
    price: 80,
    title: "coffe chair",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/coffechair.jpg",
     rating:2.1
     ),
        ProductModel(
      id: 3,
    price: 120,
    title: "simple desk",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/table1.jpg",
     ),
        ProductModel(
      id: 4,
    price: 200,
    title: "Black simple lampr",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/lamp1.jpg",
      rating:3,
     ),
      ProductModel(
     id: 1,
    price: 50,
    title: "Modern table",
  
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
   imageUrl:"assets/images/table2.jpg",
    rating:4.7,
     ),
       ProductModel(
      id: 2,
    price: 80,
    title: "coffe chair",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/coffechair.jpg",
      rating:3.3,
     ),
        ProductModel(
      id: 3,
    price: 90,
    title: "Modern lamp",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/lamp2.jpg",
      rating:3.8,
     ),
      ProductModel(
     id: 1,
    price: 50,
    title: "Minimal Stand",
  
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
   imageUrl:"assets/images/item.png",
     ),
       ProductModel(
      id: 2,
    price: 80,
    title: "coffe chair",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/coffechair.jpg",
     ),
        ProductModel(
      id: 3,
    price: 120,
    title: "simple desk",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/table1.jpg",
     ),
        ProductModel(
      id: 4,
    price: 200,
    title: "Black simple lampr",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/lamp1.jpg",
     ),
      ProductModel(
     id: 1,
    price: 50,
    title: "Modern table",
  
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
   imageUrl:"assets/images/table2.jpg",
     ),
       ProductModel(
      id: 2,
    price: 80,
    title: "coffe chair",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/coffechair.jpg",
     ),
        ProductModel(
      id: 3,
    price: 90,
    title: "Modern lamp",
    description:"Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ",
     imageUrl:"assets/images/lamp2.jpg",
     ),
       
  
      
   
   
  ];

}