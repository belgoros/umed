require 'rails_helper'

describe ApplicationHelper, :type => :helper do
  describe "generating full title" do
    let(:base_title) { I18n.t(:base_title)}
    it "should concatenate page title with base title" do
      expect(full_title('some page title')).to eq("#{base_title} | some page title")
    end

    it "should display just a base title if no page title provided" do
      page_titles = ['', nil, '   ']
      page_titles.each do |title|
        expect(full_title(title)).to eq(base_title)
      end
    end
  end

  describe "association size" do
    it "should return the association size" do
      association = %w(one two three)
      expect(association_size(association)).to eq("[3]")
    end

    it 'should return nothing for empty associations' do
      expect(association_size([])).to be nil
    end
  end

  describe 'generates flash class' do
    #    "#{name.to_s == 'notice' ? 'success' : 'alert'}"
    it 'generates success flash class' do
      expect(flash_by_name('notice')).to eq('success')
    end

    it 'generates alert flash class' do
      expect(flash_by_name('some other than notice')).to eq('alert')
    end
  end

  describe "boolean_to_text" do
    it "should convert false value" do
      expect(boolean_to_text(false)).to eq('N')
    end

    it "should convert nil value" do
      expect(boolean_to_text(nil)).to eq('N')
    end

    it "should convert true value" do
      expect(boolean_to_text(true)).to eq('Y')
    end
  end
end
