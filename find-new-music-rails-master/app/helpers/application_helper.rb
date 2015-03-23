module ApplicationHelper
  def form_open(url)
    <<-HTML.html_safe
      <form action="#{url}" method="post">
    HTML
  end

  def auth_token
    <<-HTML.html_safe
      <input
        type="hidden"
        name="authenticity_token"
        value="#{form_authenticity_token}"
      >
    HTML
  end

  def hidden_patch
    <<-HTML.html_safe
      <input
        type="hidden"
        name="_method"
        value="patch"
      >
    HTML
  end

  def hidden_delete
    <<-HTML.html_safe
      <input
        type="hidden"
        name="_method"
        value="delete"
      >
    HTML
  end

  def button(label)
    <<-HTML.html_safe
      <button>#{label}</button>
    HTML
  end

  def signup_names
    ["user[username]",
      "user[email]",
      "user[password]",
      "user[confirm_password]"]
  end

  def login_names
    [ "username",
      "email",
      "password",
      "confirm_password"
    ]
  end

  def signup_values
    [ @user.username,
      @user.email
    ]
  end

  def login_values
    [ params[:username],
      params[:email]
    ]
  end

  def other_recommendations(user, band)
    user.favorite_bands.where("name != ?", band.name).sample(5)
  end
end
