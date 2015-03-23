module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
      <input type="hidden" name="authenticity_token" value="#{form_authenticity_token}">
    HTML
  end

  def hidden_delete
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="delete">
    HTML
  end

  def hidden_patch
    <<-HTML.html_safe
      <input type="hidden" name="_method" value="patch">
    HTML
  end

end
