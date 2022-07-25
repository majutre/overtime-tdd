module ApplicationHelper
  def admin_types
    ['AdminUser']
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def active?(path)
    return "active" if current_page?(path)
  end

  def status_badge(status)
    status_badge_generator(status)
  end

  private

  def status_badge_generator(status)
    content_tag(:span, status, class:"badge badge-#{status_color(status)}")
  end

  def status_color(status)
    case status
    when 'pending'
      'primary'
    when 'approved', 'confirmed'
      'success'
    when 'rejected'
      'danger'
    end
  end
end
