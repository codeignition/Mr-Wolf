module Mrwolf
  class Packager
    def initialize(path,project,version,prefix)
      @project                = project
      @path                   = path
      @version                = version
      @prefix                 = prefix
    end

    def package
      require 'fpm'
      puts `fpm -s dir -t rpm -n #{@project} -a all -v #{@version} --prefix #{@prefix} #{@path}`
    end
  end
end
