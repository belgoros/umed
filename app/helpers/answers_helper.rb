module AnswersHelper
  def boolean_to_text(correct)
    "#{correct ?  'Y' : 'N'}"
  end
end
