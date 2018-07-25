class OxfordService
  def initialize(word)
    @word = word
  end

  def examples
    results
    binding.pry
  end

  private

  def results
    parse(get(word))
  end

  def get(word)
    Faraday.get("https://od-api.oxforddictionaries.com/api/v1/entries/#{word}&api_key=#{ENV["api_key"]}").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
