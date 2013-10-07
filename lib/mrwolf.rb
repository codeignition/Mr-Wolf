class Mrwolf
   def initialize(path,project,version)
    @path       =path
    @project    =project
    @version    =version
  end

  def package
    task = Packager.new(@path,@project,@version)
    task.package
  end

  def transport
    task = Transporter.new(@project,@version)
    task.publish
  end

end

require 'mrwolf/transporter_to_s3'
require 'mrwolf/packager_to_rpm'
