module ApplicationHelper

  def auth_token
    <<-HTML.html_safe
    <input
      type="hidden"
      name="authenticity_token"
      value="#{ form_authenticity_token }"
    >
    HTML
  end

  def open_form(url)
    <<-HTML.html_safe
    <form
      action="#{url}"
      method="post"
    >
    HTML
  end

  def form_patch
    <<-HTML.html_safe
    <input
      type="hidden"
      name="_method"
      value="patch"
    >
    HTML
  end

  def delete_button(url)
    <<-HTML.html_safe
    #{open_form(url)}
    #{auth_token}
    <input
      type="hidden"
      name="_method"
      value="delete"
    >
    <button>Delete</button>
    </form>
    HTML
  end

  def form_delete
    <<-HTML.html_safe
    <input
      type="hidden"
      name="_method"
      value="delete"
    >
    HTML
  end

  def submit_button
    <<-HTML.html_safe
      <button>Submit</button>
    HTML
  end

  def ugly_lyrics(lyrics)
    new_lyrics = lyrics.split("\n")
    new_lyrics = new_lyrics.map { |line| "&#9835; " + h(line) }
    new_lyrics.join("\n").html_safe
  end
end
