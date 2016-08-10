module ApplicationHelper

  def full_title(page_title)
    base_title = I18n.t(:base_title)
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def association_size(association)
    "[#{association.size}]" unless association.empty?
  end

  def flash_by_name(name)
    "#{name.to_s == 'notice' ? 'success' : 'alert'}"
  end

  def boolean_to_text(correct)
    "#{correct ?  'Y' : 'N'}"
  end

  def styled_answer(answer)
     "#{answer.correct? ? 'success' : 'error'}"
  end

  def meta_description(text)
    base_description = I18n.t(:meta_description)
    if text.blank?
      tag('meta', name: 'description', content: base_description)
    else
      tag('meta', name: 'description', content: "#{base_description}, #{text}")
    end
  end

  def meta_key_words(words)
    base_words = I18n.t(:meta_key_words)
    if words.blank?
      tag('meta', name: 'keywords', content: base_words)
    else
      tag('meta', name: 'keywords', content: "#{base_words}, #{words}")
    end
  end
end
