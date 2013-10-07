require "mrwolf"
require "test/unit"

class TC_mrwolf < Test::Unit::TestCase

  def test_package
    path="path of the directory to be packaged"
    project="project"
    version="version for eg 1.0"
    assert_equal Mrwolf.new(path,project,version).transport,"success"
  end
end
