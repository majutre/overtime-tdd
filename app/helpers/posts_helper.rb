module PostsHelper
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
    when 'approved'
      'success'
    when 'rejected'
      'danger'
    end
  end
end
