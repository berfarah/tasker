module ApplicationHelper
  def nav_link_to(text, path, controller)
    all = controller.is_a?(Array) ? controller : [controller]
    active = ' class="active"' if [params[:action],
                                   params[:controller],
                                   params[:view]].any? { |x| all.include? x }
    "<li#{active} title=\"#{controller}\">#{link_to text, path}</li>".html_safe
  end

  def flash_messages(flash)
    return '' if flash.empty?

    flash.map do |name, msg|
      content_tag :div, msg, class: "alert alert-#{flash_to_bootstrap[name]}"
    end.join.html_safe
  end

  private

    def flash_to_bootstrap
      { 'notice' => 'info',
        'info'   => 'info',
        'success' => 'success',
        'alert' => 'warning',
        'warn' => 'warning',
        'error' => 'danger',
        'exception' => 'danger' }
    end
end
