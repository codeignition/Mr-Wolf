module Mrwolf
  class Executor
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
end
