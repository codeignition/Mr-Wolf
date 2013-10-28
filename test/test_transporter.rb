require 'mrwolf'
require 'test/unit'
require 'fog'
class TC_mrwolf < Test::Unit::TestCase

  def test_package
    @project               = "project"
    @AWS_ACCESS_KEY_ID     = ENV['AWS_ACCESS_KEY_ID']
    @AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY']
    @S3_BUCKET             = ENV['S3_BUCKET']
    @version               = "0.1"
    @path                  = "./"

     connection = Fog::Storage.new( provider:             :AWS,
                                    aws_access_key_id:     @AWS_ACCESS_KEY_ID,
                                    aws_secret_access_key: @AWS_SECRET_ACCESS_KEY)
    
    directory  = connection.directories.new( key: @S3_BUCKET )

    `mrwolf publish -t #{@path} -n #{@project} -v #{@version}`

    if directory.files.head ("#{@project}/#{@project}-#{@version}.noarch.rpm") 
      result="success"
    else
      result="failure"
    end

    assert_equal result,"success"
  end
end
