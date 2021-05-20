desc "期限の３日前になるとメールを送信する"
  task notice_deadline: :environment do
    time_range = (Time.now.midnight + 3.day)
    products = Product.where('deadline' => time_range)
      products.each do |product|
        UserMailer.with(product: product).send_notice_deadline.deliver_now
      end
    end
    
desc "楽天レシピAPIを使ってレシピをデータベースに保存"
  task save_recipe: :environment do
    categories = RakutenWebService::Recipe.small_categories
    categories.each do |category|
      recipes = category.ranking
      recipes.each do |recipe|
        Food.create(title: recipe.title, avatar: recipe.food_image_url, url: recipe.url, description: recipe.description)
        sleep(2)
      end
    end
  end