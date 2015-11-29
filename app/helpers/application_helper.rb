module ApplicationHelper

  def full_title(page_title)
    base_title = I18n.t(:base_title)
    if page_title.empty?
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
end
