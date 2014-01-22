module Akiva
  module Brain
    @@filters = []
    @@actions = {}
    @@formatters = {}
    @@api

    class << self
      def update(&block)
        puts "brain update"
        instance_exec(&block)
      end

      def empty
        @@filters = []
        @@actions = {}
        @@formatters = {}
        @@api = nil
      end

      def add_filter(action_name, regex, options = {})
        @@filters.unshift({
          regex: regex,
          action: action_name
        }.merge(options))
      end

      def add_action(action_name, class_instance = nil, &block)
        @@actions[action_name] = class_instance || block
      end

      def add_formatter(formatter_name, class_instance = nil, &block)
        @@formatters[formatter_name] = class_instance || block
      end

      def set_api api_flag
        case api_flag
        when /thebigdb/ 
            puts "thebigdb as api"  
        when /wikidata/
            puts "wikidata as api"
        end 
        
      end

      # getter
      def api
        @@api
      end

      def filters
        @@filters
      end

      def actions
        @@actions
      end

      def formatters
        @@formatters
      end
    end
  end
end