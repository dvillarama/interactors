module Interactors
  class CamelCaseStrings < Base
    protected
    # pass strings as paramters and will return camelcase string
    def do_it(*strings)
      strings.map { |str| str.downcase.capitalize }.join
    end
  end
end
