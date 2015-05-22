class AdminDecorator < Draper::Decorator
  delegate_all

  def nav_bar
    return unless h.admin_signed_in?

    h.content_tag(:div, class: :nav_bar) do
      h.content_tag(:span, class: :sign_out) do
        h.link_to('sign out', h.destroy_admin_session_path, method: :delete)
      end
    end
  end
end
