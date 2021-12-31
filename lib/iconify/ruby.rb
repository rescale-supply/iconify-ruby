# frozen_string_literal: true
require "pry"
require "json"
require_relative "ruby/version"

module Iconify
  module Ruby
    class Error < StandardError; end

    extend self

    def dir()
      File.expand_path("../../iconify-json", __dir__)
    end

    def collections()
      data = File.read(File.join(dir, "collections.json"))
      JSON.parse(data)
    end

    def locate(name)
      begin
        data = File.read(File.join(dir, "json/#{name}.json"))
        JSON.parse(data)
      rescue => exception
        { error: exception }
      end
    end
  end
end