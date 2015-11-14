module AnswersHelper
  def boolean_to_text(correct)
    "#{true ?  'Y' : 'N'}"
  end
end
