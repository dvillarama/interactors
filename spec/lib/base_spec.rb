require "spec_helper"
require 'interactors'

module Interactors

  class TestBase < Base
  end

  RSpec.describe Base do
    subject { TestBase.new() }
    it "throws exception when do_it is not implemented" do
      expect { subject.call }.to raise_error(NotImplementedError)
    end
  end
end
