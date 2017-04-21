module Interactors
  class Factorial < Base
    protected
    def do_it(number)
      raise 'No negative numbers please' if number < 0
      if (number == 0)
        return 1
      else
        return (number * call(number-1));
      end
    end
  end
end

