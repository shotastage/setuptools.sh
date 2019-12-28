require 'optparse'


class UptCLIParse
    def parse_options(argv = ARGV)
        opt = OptionParser.new
        opt.on('i', 'install', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('-d', '--del', 'delete an item') { puts 'Deleted' }
        opt.parse(ARGV)
    end
end
