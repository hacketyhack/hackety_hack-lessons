require 'hackety_hack/lessons/version'
require 'metadown'

module HacketyHack
  module Lessons
    extend self

    FILE_LIST = Dir["#{File.dirname(__FILE__)}/../../content/*.md"]

    def titles
      all.collect{|data| data.metadata["title"]}
    end

    def find_by_title(title)
      all.find{|data| data.metadata["title"] == title}
    end

    def all
      FILE_LIST.collect{|file| Metadown.render(File.read(file)) }
    end
  end
end
