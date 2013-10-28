module Mrwolf
  class Executor
    def initialize(path,project,version,prefix)
      @path       =path       || "./"
      @project    =project 
      @version    =version    || "0.1"
      @prefix     =prefix     || "/opt"
    end

    def package
      task = Packager.new(@path,@project,@version,@prefix)
      task.package
    end

    def transport
      task = Transporter.new(@path,@project,@version)
      task.publish
    end
  end
end
