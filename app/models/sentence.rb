class Sentence
  attr_reader :text

  def initialize(data)
    @text = data[:text]
  end
end
