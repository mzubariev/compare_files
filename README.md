The program for comparing of two files per each line.

#### Setting up project
##### Preferable to use ruby -v 2.3.0.

* Add to your project Gemfile following line

gem 'compare_files', '~> 0.1.0'

* Run from terminal

bundle install

* Add to your project Rakefile

spec = Gem::Specification.find_by_name 'compare_files'
load "#{spec.gem_dir}/lib/tasks/compare_files.rake"

* Run from terminal rake task (use two parameters: 2 files with absolute paths)

Example:
rake compare FILE1=/home/nz/projects/ruby/agile_engine/1.txt    FILE2=/home/nz/projects/ruby/agile_engine/2.txt

