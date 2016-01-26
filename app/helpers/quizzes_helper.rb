module QuizzesHelper
  def selection_for(quiz)
    "#{quiz.level.try(:name)}->#{quiz.subject.try(:name)}->#{quiz.theme.try(:name)}"
  end
end
