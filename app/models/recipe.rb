class Recipe < ApplicationRecord
  def self.generate_recipe(ingredients)
    # OpenAI APIを使ってレシピを生成する処理をここに追加
    prompt = "以下の食材を使ったレシピを作成してください: #{ingredients.join(', ')}"
    response = OpenAI::Completion.create(
      engine: "text-davinci-003",
      prompt: prompt,
      max_tokens: 150
    )
    response['choices'][0]['text'].strip
  end
end
