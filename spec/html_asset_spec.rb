require 'spec_helper'

describe Trackman::Assets::HtmlAsset do  
  it "should contains every image within the html as assets" do
    asset = Asset.create(:path => 'spec/test_data/sample.html')

    expected = [
      'spec/test_data/test1.jpeg', 
      'spec/test_data/test2.png', 
      'spec/test_data/test3.gif'
    ].map{|x| Asset.create(:path => x) } 
    
    actual = asset.assets.select{|a| !(['.css', '.js'].include?(a.path.extname)) }

    actual.should eq(expected)
  end  

   
  it "should contains every js within the html as assets" do
    asset = Asset.create(:path => 'spec/test_data/sample.html')

    expected = ['a', 'b', 'c'].map{|x| Asset.create(:path =>"spec/test_data/#{x}.js") } 
    
    actual = asset.assets.select{|a| a.path.extname == '.js'}

    actual.should eq(expected)
  end
  
  it "should contains every css within the html as assets" do
    asset = Asset.create(:path => 'spec/test_data/sample.html')

    expected = ['y', 'z'].map{|x| Asset.create(:path => "spec/test_data/#{x}.css") } 
    
    actual = asset.assets.select{|a| a.path.extname == '.css'}

    actual.should eq(expected)
  end

  it "returns all recursive css imports and images under the html file that contains css" do
    expected = [
        CssAsset.new(:path => 'spec/test_data/css/recursive/imported-lvl2.css'),
        CssAsset.new(:path => 'spec/test_data/css/recursive/imported-lvl3.css'),
        Asset.new(:path => 'spec/test_data/css/recursive/riding-you.jpg')
      ]
    asset = Asset.create(:path => 'spec/test_data/css/recursive/html-with-css.html')

    actual = asset.assets

    actual.should == expected
  end
end