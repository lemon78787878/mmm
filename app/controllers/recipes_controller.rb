class RecipesController < ApplicationController
  def new
    @food = Food.new
  end

  def create
    client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])

    prompt = "以下の食材を使用したレシピを教えてください: #{params[:food][:food_name]}"
    begin
      response = client.completions(
        engine: "gpt-3.5-turbo",  # または "text-davinci-003" などの他のモデル
        prompt: prompt,
        max_tokens: 150
      )
      @recipe = response.dig("choices", 0, "text")
    rescue OpenAI::Client::Error => e
      @error = "OpenAI APIの呼び出し中にエラーが発生しました: #{e.message}"
    end

    respond_to do |format|
      format.html { render :show }
      format.turbo_stream
    end
  end

end
