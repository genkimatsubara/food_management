namespace :rakuten_recipe do
  desc "楽天レシピAPIを使ってレシピをデータベースに保存"
  task save_recipe: :environment do
    categories = RakutenWebService::Recipe.small_categories
    categories.each do |category|
      recipes = category.ranking
      recipes.each do |recipe|
        Food.create(title: recipe.title, image: recipe.food_image_url, url: recipe.url, description: recipe.description)
        sleep(2)
      end
    end
  end
end
