require 'httparty'

module OpenAI
  class Client
    include HTTParty
    base_uri 'https://api.openai.com/v1'

    def initialize
      @headers = {
        "Content-Type" => "application/json",
        "Authorization" => "Bearer #{ENV['OPENAI_API_KEY']}"
      }
    end

    def generate_recipe(ingredients)
      options = {
        headers: @headers,
        body: {
          model: "text-davinci-003",
          prompt: "Create a recipe using the following ingredients: #{ingredients.join(', ')}",
          max_tokens: 150
        }.to_json
      }

      self.class.post("/completions", options)
    end
  end
end