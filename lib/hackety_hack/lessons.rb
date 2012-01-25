require 'hackety_hack/lessons/version'
require 'metadown'

module HacketyHack
  module Lessons
    extend self

    FILE_LIST = Dir["content/*.md"]

    def titles
      FILE_LIST.collect{|file| Metadown.render(File.read(file)) }.
                collect{|data| data.metadata["title"]}
    end
  end
end
