
use strict;
use warnings;

use Module::Build 0.28;


my %module_build_args = (
  'build_requires' => {
    'ExtUtils::CBuilder' => '0',
    'File::Find' => '0',
    'File::Temp' => '0',
    'Module::Build' => '0.28',
    'Test::Exception' => '0',
    'Test::More' => '0.88'
  },
  'configure_requires' => {
    'Module::Build' => '0.28'
  },
  'dist_abstract' => 'Reliable User ID management',
  'dist_author' => [
    'Leon Timmermans <leont@cpan.org>'
  ],
  'dist_name' => 'Unix-ResUID',
  'dist_version' => '0.001',
  'license' => 'perl',
  'module_name' => 'Unix::ResUID',
  'recommends' => {},
  'recursive_test_files' => 1,
  'requires' => {
    'Sub::Exporter' => '0',
    'XSLoader' => '0',
    'perl' => '5.006'
  },
  'script_files' => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
