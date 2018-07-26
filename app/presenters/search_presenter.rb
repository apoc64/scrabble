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
    sentences = results.first[:lexicalEntries].first[:sentences]
    sentences.map do |sentence|
      Sentence.new(sentence)
    end
  end

  def oxford
    @oxford ||= OxfordService.new(word)
  end
end
