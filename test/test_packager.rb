require "mrwolf"
require "test/unit"

class TC_mrwolf < Test::Unit::TestCase

  def test_package
    path="path of the file to packaged"
    project="project"
    version="version default is 1.0"
    Mrwolf.new(path,project,version).package
    assert_same(File.exist?("#{project}"+"-"+"#{version}"+".noarch.rpm"),true)
  end
end
