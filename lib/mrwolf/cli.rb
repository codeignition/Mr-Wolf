require 'mrwolf'
require "thor"

module Mrwolf
  class CLI < Thor
    desc "package", "create rpm package"
    method_option :path, :aliases => "-t"
    method_option :rpm_name, :aliases => "-n"
    method_option :rpm_version, :aliases => "-v"
    def package
      fixer=Mrwolf::Executor.new(options[:path],options[:rpm_name],options[:rpm_version])
      fixer.package
    end

    desc "publish", "publish rpm to s3"
    method_option :path, :aliases => "-t"
    method_option :rpm_name, :aliases => "-n"
    method_option :rpm_version, :aliases => "-v"
    def publish
      fixer=Mrwolf::Executor.new(options[:path],options[:rpm_name],options[:rpm_version])
      fixer.transport
    end
  end
end
