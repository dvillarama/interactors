require "spec_helper"
require 'interactors'

module Interactors
  RSpec.describe Factorial do

    subject { described_class.new }

    it "does the math" do
      expect(subject.call(0)).to eq(1)
      expect(subject.call(4)).to eq(24)
    end

    it "checks for non-valid values" do
      expect{ subject.call(-2) }.to raise_error('No negative numbers please')
    end

    it "does no allow access to do_it" do
      expect{ subject.do_it(5) }.to raise_error(NoMethodError)
    end

    it "calls call the the right amount times" do
      expect(subject).to receive(:do_it).exactly(5).and_call_original
      expect(subject.call(3)).to eq(6)  # would call for 3, 2, 1, 0 (4 times)
      expect(subject.call(4)).to eq(24) # would call for only 4 (1 time)
    end

  end
end
