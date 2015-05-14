
module Jekyll
  class GitHubProjectLinkTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      super
      @attributes = {}
      markup.scan(::Liquid::TagAttributes) do |key, value|
        @attributes[key] = value.gsub(/^'|"/, '').gsub(/'|"$/, '')
      end
      @markup = markup
    end

    def render(context)

      project_link = "//github.com/#{@attributes['author']}/#{@attributes['project']}"
 <<-tag_output
 <div class="github thumbnail" onmouseover="this.style.borderColor = '#337ab7'" onmouseout="this.style.borderColor = ''">
        <span class="mega-octicon octicon-repo"></span>
        <a class="author" href="//github.com/#{@attributes['author']}">#{@attributes['author']}</a>
        <span>/</span>
        <a class="project" href="#{project_link}">web-#{@attributes['project']}</a>
      <a class="project" href="#{project_link}"><h4><i>#{@attributes['body']}</i></h4></a>
</div>
  tag_output
      end
  end
end

Liquid::Template.register_tag('githublink', Jekyll::GitHubProjectLinkTag)