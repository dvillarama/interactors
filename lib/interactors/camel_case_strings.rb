module Interactors
  class CamelCaseStrings < Base

    protected
    def do_it(*strings)
      strings.map { |str| str.downcase.capitalize }.join
    end
  end
end
