class OxfordService
  def initialize(word)
    @word = word
  end

  def results
    parse(get(@word))[:results]
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

  def get(word)
    conn.get("/api/v1/entries/en/#{word}/sentences").body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
