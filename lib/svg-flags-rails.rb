require 'svg-flags-rails/version'
module SvgFlagsRails
  class << self
    # Inspired by bootstrap-sass

    def load!
      if rails?
        register_rails_engine
      elsif sprockets?
        register_sprockets
      end
    end

    # Paths
    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def image_path
      File.join assets_path, 'images'
    end

    def assets_path
      @assets_path ||= File.join gem_path, 'assets'
    end

    # Environment detection helpers
    def sprockets?
      defined?(::Sprockets)
    end

    def rails?
      defined?(::Rails)
    end

    private

    def register_rails_engine
      require 'svg-flags-rails/engine'
    end

    def register_sprockets
      Sprockets.append_path(image_path)
    end

  end
end

SvgFlagsRails.load!
