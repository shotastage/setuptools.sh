require 'optparse'


class UptCLIParse
    def parse_options(argv = ARGV)
        opt = OptionParser.new
        opt.on('i', 'install', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('u', 'update', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('s', 'search', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('t', 'task', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('uninstall', 'remove', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('cfg', 'configure', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('h', 'help', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('v', 'version', 'add an item') { puts 'INSTALL::AOG' }
        opt.on('-d', '--del', 'delete an item') { puts 'Deleted' }
        opt.parse(ARGV)
    end
end
