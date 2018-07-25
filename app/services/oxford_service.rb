class OxfordService
  def initialize(word)
    @word = word
  end

  def examples
    sentences = results[:results].first[:lexicalEntries].first[:sentences]
    sentences.find_all do |sentence|
      sentence[:regions] == ["North American"]
    end.map do |sentence|
      sentence[:text]
    end
  end

  private

  def results
    parse(get(@word))
  end

  def conn(word)
    Faraday.new("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{word}/sentences") do |faraday|
      faraday.headers["Accept"] = "application/json"
      faraday.headers["app_id"] = "858f22d1"
      faraday.headers["app_key"] = "fe2c773b59e493eded930870360091a1"
      faraday.adapter Faraday.default_adapter
    end
  end

  def get(word)
    conn(word).get.body
  end

  def parse(json)
    JSON.parse(json, symbolize_names: true)
  end
end
