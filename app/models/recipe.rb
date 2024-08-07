class Recipe < ApplicationRecord
  def self.generate_recipe(ingredients)
    # 文字列の場合はカンマで分割して配列に変換
    ingredients_array = ingredients.is_a?(String) ? ingredients.split(/[,、]/) : ingredients

    # プロンプトの設定
    prompt = "以下の食材を使った詳細なレシピを作成してください。材料と手順を含め、手順は可能な限り具体的にしてください: #{ingredients_array.join(', ')}"

    # OpenAI API クライアントの作成
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    # 初回のAPIリクエスト
    initial_response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo",
        messages: [{ role: "user", content: prompt }],
        max_tokens: 500 # 生成されるテキストの最大トークン数を増やす
      }
    )

    # レスポンスを取得して、続きのリクエストが必要かチェック
    final_instructions = initial_response['choices'][0]['message']['content']

    # 手順が途中で途切れているかを判断して、必要なら続きのリクエストを行う
    if final_instructions.include?('続き')
      followup_prompt = "続き: #{final_instructions}"
      followup_response = client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{ role: "user", content: followup_prompt }],
          max_tokens: 500
        }
      )
      final_instructions += followup_response['choices'][0]['message']['content']
    end

    # レシピ内容を返す
    final_instructions.strip
  end
end
