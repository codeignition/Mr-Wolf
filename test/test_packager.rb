require "mrwolf"
require "test/unit"

class TC_mrwolf < Test::Unit::TestCase

  def test_package
    path="./"
    project="project"
    version="0.1"
    prefix="/opt"
   `mrwolf package -t #{path} -n #{project} -v #{version} -p #{prefix};ls`

    assert_same(File.exist?("#{project}"+"-"+"#{version}"+"-1"".noarch.rpm"),true)
    `rm -f #{project}-#{version}-1.noarch.rpm`
  end
end
