require 'mrwolf'
require "thor"

module Mrwolf
  class CLI < Thor
    desc "package", "create rpm package"
    method_option :path,        :aliases => "-t"
    method_option :rpm_name,    :aliases => "-n"
    method_option :rpm_version, :aliases => "-v"
    method_option :prefix,      :aliases => "-p"
    def package
      fixer=Mrwolf::Executor.new(options[:path],
                                 options[:rpm_name],
                                 options[:rpm_version],
                                 options[:prefix]
                                )
      fixer.package
    end

    desc "publish", "publish rpm to s3"
    method_option :path, :aliases => "-t"
    method_option :rpm_name, :aliases => "-n"
    method_option :rpm_version, :aliases => "-v"
    def publish
      fixer=Mrwolf::Executor.new(options[:path],
                                 options[:rpm_name],
                                 options[:rpm_version],
                                 options[:prefix]
                                )
      fixer.transport
    end
  end
end
