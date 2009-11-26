module Smeg
  class Template
    class NotFound < StandardError; end
    
    class << self
      def path; @@path || "templates"; end
      def path=(path); @@path = path; end
      
      def find(name)
        disk_path = Dir["#{path}/#{name}.mustache"]
        
        if disk_path.any? 
          new disk_path.first
        else
          raise NotFound, "template does not exist"
        end
      end
    end
    
    def initialize(path)
      @disk_path = path
    end
    
    def read
      File.read(@disk_path)
    end
  end
end