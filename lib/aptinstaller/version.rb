module Aptinstaller
    module Version #:nodoc:
      def self.check(required, actual) #:nodoc:
        required = required.map { |v| "%06d" % v }.join(".")
        actual   = actual.map { |v| "%06d" % v }.join(".")
        return actual >= required
      end
      
      MAJOR = 0
      MINOR = 1
      TINY  = 0
      STRING = [MAJOR, MINOR, TINY].join(".")
    end
end

