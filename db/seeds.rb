# db/seeds.rb
#Product.destroy_all

Product.create([
                 {
                   name: "Курага",
                   description: "Соковита та корисна курага",
                   price: 150.00,
                   image_url: "Apple.jpeg",
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
                   image_url: "2221.jpg",
                   category: "Сливи",
                   proteins: 2.2,
                   fats: 0.3,
                   carbs: 63.9,
                   energy: 240,
                   country: "Україна",
                   processing_type: "Сушені",
                   sugar_content: "З додаванням цукру"
                 }
               ])
