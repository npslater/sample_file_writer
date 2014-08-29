require 'sample_file_writer/version'
require 'thor'

module SampleFileWriter

  class CLI < Thor

    desc 'binary', 'Write a binary file of the given size'
    option :output_file, :required=>true
    option :size_bytes, :required=>true, :type=>:numeric
    def binary
      #write single byte ints in binary form
      total_size = 0
      File.open(options[:output_file], 'wb') do | file |
          while total_size < options[:size_bytes] do
            total_size += file.write([rand(0xFF)].pack('c'))
          end
      end
    end

    desc 'ascii', 'Write an ascii text file of the given size'
    option :output_file, :required=>true
    option :size_bytes, :required=>true, :type=>:numeric
    def ascii
      #write single ascii chars in text form
      total_size = 0
      File.open(options[:output_file], 'w') do | file |
        while total_size < options[:size_bytes] do
          total_size += file.write(rand(0xFF).chr)
        end
      end
    end

    desc 'unicode', 'Write a unicode text file of the given size'
    option :output_file, :required=>true
    option :size_bytes, :required=>true, :type=>:numeric
    def unicode
      File.open(options[:output_file], 'w:UTF-8') do | file |
        total_size = 0
        while total_size < options[:size_bytes] do
          total_size += file.write([rand(0xFFFD)].pack('U*'))
        end
      end
    end
  end
end
