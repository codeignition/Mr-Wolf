module Mrwolf
  class Executor
    def initialize(path,project,version,prefix)
      @path       =path
      @project    =project
      @version    =version
      @prefix     =prefix
    end

    def package
      task = Packager.new(@path,@project,@version,@prefix)
      task.package
    end

    def transport
      task = Transporter.new(@project,@version)
      task.publish
    end
  end
end
