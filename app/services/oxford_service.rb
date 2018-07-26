class OxfordService
  def initialize(word)
    @word = word
  end

  def results(result_type = 'sentences', language = 'en')
    parse(get(@word, result_type, language))[:results]
  end

  private

  def conn
    Faraday.new("https://od-api.oxforddictionaries.com:443") do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.headers["app_key"] = ENV["app_keys"]
      faraday.adapter Faraday.default_adapter
    end
  end

  def get(word, result_type, language)
    conn.get("/api/v1/entries/#{language}/#{word}/#{result_type}").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
