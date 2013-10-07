class Mrwolf::Transporter
  def initialize(project,version)

    @PROJECT               = project
    @AWS_ACCESS_KEY_ID     = ENV['AWS_ACCESS_KEY_ID']
    @AWS_SECRET_ACCESS_KEY = ENV['AWS_SECRET_ACCESS_KEY']
    @S3_BUCKET             = ENV['S3_BUCKET']
    @version               = version
  end

  def publish
    require 'rubygems'
    require 'fog'

    connection = Fog::Storage.new( provider:             :AWS,
                                  aws_access_key_id:     @AWS_ACCESS_KEY_ID,
                                  aws_secret_access_key: @AWS_SECRET_ACCESS_KEY)

    directory  = connection.directories.new( key: @S3_BUCKET )

    artifact      = "#{@PROJECT}/#{@PROJECT}-#{@version}.noarch.rpm"
    artifact_path = "#{@PROJECT}-#{@version}.noarch.rpm"

    directory.files.create(key: artifact, body: File.open(artifact_path), public: false)

    if directory.files.head("#{@PROJECT}/#{@PROJECT}-#{@version}.noarch.rpm")
      "success"
    else
      "failure"
    end
  end
end
