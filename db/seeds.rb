# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
admin_user = User.create({ email: 'admin@com.tw',   password: '12345678', name: 'Admin' })

# Service create
service1 = Service.create({
  name: '訂制家俱', description: '訂制家俱描述', prompt_text: '訂制家俱提示訊息'
})

service2 = Service.create({
  name: '模組家俱', description: '模組家俱描述', prompt_text: '模組家俱提示訊息'
})

service3 = Service.create({
  name: '辦公家俱', description: '辦公家俱描述', prompt_text: '辦公家俱提示訊息'
})

# ServiceFurniture create
service2_furniture1 = service2.service_furnitures.create({ name: '組合隔間' })
service2_furniture1 = service2.service_furnitures.create({ name: '飯店家具' })
service2_furniture1 = service2.service_furnitures.create({ name: '銀行家具' })
service2_furniture1 = service2.service_furnitures.create({ name: '鋁柱家具' })
service2_furniture1 = service2.service_furnitures.create({ name: '展場家具' })
service2_furniture1 = service2.service_furnitures.create({ name: '接待櫃台' })

service3_furniture1 = service3.service_furnitures.create({ name: '工作站' })
service3_furniture1 = service3.service_furnitures.create({ name: '主管桌' })
service3_furniture1 = service3.service_furnitures.create({ name: '櫃類' })
service3_furniture1 = service3.service_furnitures.create({ name: '會議桌' })
service3_furniture1 = service3.service_furnitures.create({ name: '椅類' })
service3_furniture1 = service3.service_furnitures.create({ name: '配件' })

# success case
success_case1 = SuccessCase.create({ name: '商業空間' })
success_case2 = SuccessCase.create({ name: '辦公空間' })
success_case3 = SuccessCase.create({ name: '私人會所' })

# success case products
success_case1_product = success_case1.products.create({
  uid:          "#{success_case1.name}-001",
  name:         "#{success_case1.name}-product-1",
  name_eng:     "#{success_case1.name}-product-1",
  description:  "#{success_case1.name} description",
  hash_tag:     "class1,class2",
})
success_case1_product = success_case2.products.create({
  uid:          "#{success_case2.name}-001",
  name:         "#{success_case2.name}-product-1",
  name_eng:     "#{success_case2.name}-product-1",
  description:  "#{success_case2.name} description",
  hash_tag:     "class1,class2",
})
success_case1_product = success_case3.products.create({
  uid:          "#{success_case3.name}-001",
  name:         "#{success_case3.name}-product-1",
  name_eng:     "#{success_case3.name}-product-1",
  description:  "#{success_case3.name} description",
  hash_tag:     "class1,class2",
})

# brand
brand1 = Brand.create({ name: 'Segis',      description: 'Segis description',       link: 'http://www.google.com' })
brand2 = Brand.create({ name: 'Softline',   description: 'Softline description',    link: 'http://www.google.com' })
brand3 = Brand.create({ name: 'Humanscale', description: 'Humanscale description',  link: 'http://www.google.com' })
brand4 = Brand.create({ name: 'Vlaar',      description: 'Vlaar description',       link: 'http://www.google.com' })
brand5 = Brand.create({ name: 'realsteel',  description: 'realsteel description',   link: 'http://www.google.com' })

# brand products
brand1_product = brand1.products.create({
  uid:          "#{brand1.name}-001",
  name:         "#{brand1.name}-product-1",
  name_eng:     "#{brand1.name}-product-1",
  description:  "#{brand1.name} description",
  hash_tag:     "class1,class2",
})

brand2_products = brand2.products.create({
  uid:          "#{brand2.name}-001",
  name:         "#{brand2.name}-product-1",
  name_eng:     "#{brand2.name}-product-1",
  description:  "#{brand2.name} description",
  hash_tag:     "class1,class2",
})

brand3_products = brand3.products.create({
  uid:          "#{brand3.name}-001",
  name:         "#{brand3.name}-product-1",
  name_eng:     "#{brand3.name}-product-1",
  description:  "#{brand3.name} description",
  hash_tag:     "class1,class2",
})

brand4_products = brand4.products.create({
  uid:          "#{brand4.name}-001",
  name:         "#{brand4.name}-product-1",
  name_eng:     "#{brand4.name}-product-1",
  description:  "#{brand4.name} description",
  hash_tag:     "class1,class2",
})

brand5_products = brand5.products.create({
  uid:          "#{brand5.name}-001",
  name:         "#{brand5.name}-product-1",
  name_eng:     "#{brand5.name}-product-1",
  description:  "#{brand5.name} description",
  hash_tag:     "class1,class2",
})
