begin
  require 'core/lib/core'
  require 'authentication/lib/authentication'
  require 'dashboard/lib/dashboard'
  require 'images/lib/images'
  require 'inquiries/lib/inquiries'
  require 'pages/lib/pages'
  require 'resources/lib/resources'
  require 'settings/lib/settings'
rescue LoadError
  #puts "Running outside of rails..."
end

module Refinery
  class << self
    attr_accessor :is_a_gem, :root, :s3_backend, :base_cache_key
    def is_a_gem
      @is_a_gem ||= false
    end

    def root
      @root ||= Pathname.new(File.expand_path(__FILE__).split('vendor').first.to_s)
    end

    def s3_backend
      @s3_backend ||= false
    end

    def base_cache_key
      @base_cache_key ||= "refinery"
    end

    def version
      ::Refinery::Version.to_s
    end
  end

  class Version
    class << self
      attr_reader :major, :minor, :tiny, :build
    end

    @major = 0
    @minor = 9
    @tiny  = 8
    @build = '0.beta2.pre'

    def self.to_s
      [@major, @minor, @tiny, @build].compact.join('.')
    end
  end
end