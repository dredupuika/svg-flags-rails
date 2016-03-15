module SvgFlagsRails
  module Rails
    class Engine < ::Rails::Engine
      initializer 'svg-flags-rails.assets.precompile' do |app|
        %w(images).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end

        app.config.assets.precompile << "country-4x3/*.svg"
        app.config.assets.precompile << "country-squared/*.svg"

      end
    end
  end
end
