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

success_case1 = SuccessCase.create({ name: '商業空間' })
success_case2 = SuccessCase.create({ name: '辦公空間' })
success_case3 = SuccessCase.create({ name: '私人會所' })
