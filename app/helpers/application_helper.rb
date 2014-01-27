module ApplicationHelper
  def format_newlines(string)
    html_escape(string).gsub(/\r\n/, '<br />').html_safe
  end
  
  alias :fn :format_newlines 
end
