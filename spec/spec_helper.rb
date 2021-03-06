require 'pathname'
require 'fileutils'
require 'rake'
require 'rubygems'
require 'bundler/setup'
require 'bacon'

ROOT = Pathname.new(File.expand_path('../../', __FILE__))
$:.unshift(ENV['RUBYMOTION_CHECKOUT'] || "/Library/RubyMotion/lib")
$:.unshift((ROOT + 'lib').to_s)
require 'motion/project/template/osx'
require 'motion-sparkle'

Bacon.summary_at_exit

module SpecHelper
  def self.temporary_directory
    TemporaryDirectory.temporary_directory
  end

  module TemporaryDirectory
    def temporary_directory
      ROOT + 'tmp'
    end
    module_function :temporary_directory

    def setup_temporary_directory
      temporary_directory.mkpath
    end

    def teardown_temporary_directory
      temporary_directory.rmtree if temporary_directory.exist?
    end
  end
end
