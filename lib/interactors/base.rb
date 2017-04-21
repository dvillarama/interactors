module Interactors
  class Base
    def initialize(*args)
      @results = {}
    end

    def call(*args)
      # Only call do_it once per unique parameter
      # Use array.hash as key because -> https://ruby-doc.org/core-2.4.1/Array.html#method-i-hash
      @results[args.hash] ||= do_it(*args)
    end

    # child must override this method
    def do_it(*args)
      fail NotImplementedError
    end
  end
end
