require_relative '../compare_files'

desc 'Comparing files content per each line.'
task :compare do
  file1_path = ENV['FILE1']
  file2_path = ENV['FILE2']

  files = CompareFiles::Base.new(file1_path, file2_path)
  files.compare

end
