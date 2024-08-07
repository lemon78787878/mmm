class Recipe < ApplicationRecord
  def self.generate_recipe(ingredients)
    # 文字列の場合はカンマで分割して配列に変換
    ingredients_array = ingredients.is_a?(String) ? ingredients.split(/[,、]/) : ingredients

    # OpenAI APIを使ってレシピを生成する処理をここに追加
    prompt = "以下の食材を使ったレシピを作成してください: #{ingredients_array.join(', ')}"

    client = OpenAI::Client.new

    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # モデル名を指定
        messages: [{ role: "user", content: prompt }],
        max_tokens: 150
      }
    )

    response['choices'][0]['message']['content'].strip
  end
end
