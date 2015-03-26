require 'byebug'
module Phase6
  class ControllerBase < Phase5::ControllerBase

    def method_missing(method, *arg)
      method = method.to_s
      if method.end_with?("_path")
        method = "/" + method[0..-6]
        if method.include?("_")
          method = method.split("_")
          return method.join("/#{arg.first}/")
        elsif arg.first
          method += arg.first.to_s
        else
          method
        end
      else
        super
      end

    end

    def link_to(content, path)
      <<-HTML.html_safe
        <a href="#{path}">#{content}</a>
      HTML
    end

    def button_to(content, path, method = "get")
      @csrf.make_cookie
      <<-HTML.html_safe
        <form action="#{path}" method="#{method}">
          <input type="hidden" name="authenicity token" value="#{@csrf.token_value}">
          <button>#{content}</button>
        </form>
      HTML
    end
  end
end
