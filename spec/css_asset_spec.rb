require 'spec_helper'

describe CssAsset do
  it "returns its assets when it has import in it" do
    asset = CssAsset.new(:path => 'spec/test_data/css/with-asset.css')
    
    asset.assets.should == [CssAsset.new(:path => 'spec/test_data/css/imported.css')] 
  end

  it "returns multiple assets when it has multiple imports" do
    actual = CssAsset.new(:path => 'spec/test_data/css/with-multiple-assets.css')
    expected = [
      CssAsset.new(:path => 'spec/test_data/css/imported.css'), 
      CssAsset.new(:path => 'spec/test_data/css/imported2.css')
    ] 

    actual.assets.should == expected
  end

  it "returns an image if it is within the css" do
    actual = CssAsset.new(:path => 'spec/test_data/css/image/with-image.css')
    expected = [ Asset.new(:path => 'spec/test_data/css/image/riding-you.jpg')] 

    actual.assets.should == expected
  end

  it "returns all recursive css imports and images under the css file" do
    expected = 
      [
        CssAsset.new(:path => 'spec/test_data/css/recursive/imported-lvl2.css'),
        CssAsset.new(:path => 'spec/test_data/css/recursive/imported-lvl3.css'),
        Asset.new(:path => 'spec/test_data/css/recursive/riding-you.jpg')
      ]
    asset = Asset.create(:path => 'spec/test_data/css/recursive/imported-recursive.css')
    actual = asset.assets

    actual.should == expected
  end
end