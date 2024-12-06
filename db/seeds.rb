OrderItem.destroy_all # Спочатку очищаємо order_items
Product.destroy_all # Потім очищаємо продукти

Product.create([
                 {
                   name: "Курага",
                   description: "Соковита та корисна курага",
                   price: 150.00,
                   image_url: "kuraga1.jpeg",
                   category: "Абрикоси",
                   proteins: 2.5,
                   fats: 0.5,
                   carbs: 77.5,
                   energy: 320,
                   country: "В'єтнам",
                   processing_type: "Натурально-сушені",
                   sugar_content: "Без цукру"
                 },
                 {
                   name: "Чорнослив",
                   description: "Натуральний чорнослив без додавання цукру",
                   price: 180.00,
                   image_url: "чорнослив.jpg",
                   category: "Сливи",
                   proteins: 2.2,
                   fats: 0.3,
                   carbs: 63.9,
                   energy: 240,
                   country: "Україна",
                   processing_type: "Сушені",
                   sugar_content: "З додаванням цукру"
                 },
                 {
                   name: "Манго",
                   description: "Натуральний манго без додавання цукру",
                   price: 270.00,
                   image_url: "mango.jpg",
                   category: "Сливи",
                   proteins: 5.2,
                   fats: 1.4,
                   carbs: 68.8,
                   energy: 340,
                   country: "Китай",
                   processing_type: "Сушені",
                   sugar_content: "Без цукру"
                 }
               ])
