require "spec_helper"
require 'interactors'

module Interactors
  RSpec.describe CamelCaseStrings do

    subject { described_class.new() }
    let(:test_strings1) { ['thiS', 'wiLL', 'worK'] }
    let(:test_strings2) { ['hey', 'world'] }

    it "does the camelcasing" do
      expect(subject.call(*test_strings1)).to eq('ThisWillWork')
      expect(subject.call(*test_strings2)).to eq('HeyWorld')
    end

    it "does no allow access to do_it" do
      expect{ subject.do_it(test_strings1) }.to raise_error(NoMethodError)
    end

    it "run do_it once per unique parameter" do
      allow(subject).to receive(:do_it).exactly(:twice).and_call_original
      expect(subject.call(*test_strings1)).to eq('ThisWillWork')
      expect(subject.call(*test_strings2)).to eq('HeyWorld')
      expect(subject.call('thiS', 'wiLL', 'worK')).to eq('ThisWillWork') # cached
      expect(subject.call(*test_strings2)).to eq('HeyWorld')             # cached
    end
  end
end
