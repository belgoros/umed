require 'spec_helper'

describe AnswersHelper, :type => :helper do

  describe "boolean_to_text" do
    it "should not convert false value" do
      expect(boolean_to_text(false)).to eq('N')
    end

    it "should not convert nil value" do
      expect(boolean_to_text(nil)).to eq('N')
    end

    it "should not convert true value" do
      expect(boolean_to_text(true)).to eq('Y')
    end
  end
end
