class XmlDocument
  def initialize(arg=false)
    @indent=arg
    @indent_level=0
  end

  def method_missing(method, *arg, &block)
    string||=""
    string<<"  "*@indent_level if @indent
    @indent_level+=1 
    string<<"<#{method}"
    unless arg.empty?
      arg.each do |hash|
        hash.each do |key,value|
          string<<" "
          string<<"#{key}='#{value}'"
        end
      end
    end
    if block
      string<<">"
      string<<"\n" if @indent
      string<<yield
      @indent_level-=1 
      string<<"  "*@indent_level if @indent
      string<<"</#{method}>"
      string<<"\n" if @indent
    else
      string<<"/>"
      string<<"\n" if @indent
      @indent_level-=1 
    end
    string
  end
end
