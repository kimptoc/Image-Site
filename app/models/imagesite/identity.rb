module Imagesite
  class Identity

    attr_accessor :current

#    @@instance = Identity.new

    def initialize
      @current = 0
    end

    def self.next
      return inst._next
    end

    def _next
      @current += 1
    end

    def self.inst
      @@instance ||= Identity.new
    end
  end
end