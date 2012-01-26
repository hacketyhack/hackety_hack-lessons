# encoding: utf-8
Shoes.setup do
  gem 'redcarpet'
  gem 'hackety_hack-lessons', '1.1.1'
end
require 'redcarpet'
require 'hackety_hack/lessons'

class Renderer < Redcarpet::Render::Base
  def initialize(app)
    super()
    @app = app
    @args = []
  end

  def header(text, level)
    case level
    when 1
      @app.instance_eval { para text, :size => "x-large" }
    when 2
      @app.instance_eval { para text, :size => "large" }
    when 3
      @app.instance_eval { para text }
    end
    ''
  end

  def image(path, title, alt_text)
    on_click = if alt_text.nil? || alt_text.empty?
                 Proc.new {}
               else
                 Proc.new { alert(alt_text) }
               end

    @app.instance_eval { image("http://hackety.com#{path}", {}, &on_click) }
    ''
  end


  def emphasis(text)
    store @app.em(text)
  end

  def double_emphasis(text)
    store @app.strong(text)
  end

  def link(link, title, content)
    store @app.link(content, :click => link)
  end

  def codespan(code)
    store @app.code(code)
  end

  def store(shoes_bit)
    @args << shoes_bit
    '[-]'
  end

  def paragraph(text)
    para_bits = interpolate(text, @args)

    @app.instance_eval { para *para_bits, :font => "TakaoGothic" }
    @args.clear
    ''
  end

  # The markdown string "I'd _love_ a cupcake!" comes to us looking like this:
  # "Hello, I'd [-] a cupcake!"
  # ...and @args looks like this:
  # [Shoes::Em]
  # #interpolate turns them into this:
  # ["Hello, I'd ", Shoes::Em, " a cupcake!"]
  # These are the args that'll be passed to Shoes#para.
  # It also turns "_I_ like _chocolate!_" into
  # [Shoes::Em, " like ", Shoes::Em]
  def interpolate(text, args)
    results = []
    while text.include?('[-]')
      head, text = *text.split('[-]', 2)
      results << head << args.shift
    end
    results << text 
    results << args unless args.empty?

    return results.compact
  end
end

Shoes.app do
  renderer = Renderer.new(self)
  markdown = Redcarpet::Markdown.new(renderer, fenced_code_blocks: true)
  stack do
    markdown.render(File.read("../../../content/an-introduction-to-ruby-with-hackety-hack.md", :encoding => "utf-8"))
  end
end
