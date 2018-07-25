class SearchPresenter
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples
    oxford.examples
  end

  private

  def oxford
    @oxford ||= OxfordService.new(word)
  end
end
