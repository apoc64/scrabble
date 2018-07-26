class SearchPresenter
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples
    results = oxford.results
    get_sentences(results)
  end

  private

  def get_sentences(results, region = ["North American"])
    all_sentences = results.first[:lexicalEntries].first[:sentences]
    regional_sentences = filter_region(all_sentences, region)
    regional_sentences.map do |sentence|
      sentence[:text]
    end
  end

  def filter_region(sentences, region)
    sentences.find_all do |sentence|
      sentence[:regions] == region
    end
  end

  def oxford
    @oxford ||= OxfordService.new(word)
  end
end
