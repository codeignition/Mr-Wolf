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
      package = FPM::Package::Dir.new
      package.input("#{@path}")

      package.attributes = {
                             :rpm_defattrfile => "-", 
                             :rpm_user => "$USER", 
                             :rpm_group => "$USER", 
                             :rpm_defattrdir => "-",
                             :prefix => "#{@prefix}"
                           }
      rpm = package.convert(FPM::Package::RPM)
      rpm.name = "#{@project}"
      rpm.version = "#{@version}"
      rpm.architecture="noarch"
      begin
        output = "NAME-VERSION.ARCH.rpm"
        rpm.output(rpm.to_s(output))
      ensure
        rpm.cleanup
      end
    end
  end
end
