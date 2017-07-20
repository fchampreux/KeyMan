module ApplicationHelper
    def markdown
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
    end
    
    def diplayMD
        filename = File.join(Rails.root, 'public/splash-'+ I18n.locale.to_s + '.md')
        puts filename
        begin
          file = File.open(filename, "rb")
          markdown.render(file.read).html_safe
        rescue Errno::ENOENT
          render :file => "public/404.html", :status => 404
        end
    end
end
