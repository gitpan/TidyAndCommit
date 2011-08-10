
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'This class can be used as a wrapper around a commit (check example for how to wrap 
this around a subversion commit message). The module cleans up the target code using perltidy before 
running the next step(usually a svn commit statement for my own use case). Perltidy must be 
installed before use of this script. This Class will Tidy all files with .pm, .cgi or .pl extension 
when passed a file name and it will search for all file in a folder with .pm, .cgi or .pl extension
when passed a foldername pass your own tidyrc config file to the object to get custom tidy goodness.',
  'AUTHOR' => 'Shantanu Bhadoria <shantanu at cpan dott org>',
  'BUILD_REQUIRES' => {
    'Test::More' => '0.47'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.30'
  },
  'DISTNAME' => 'TidyAndCommit',
  'EXE_FILES' => [],
  'LICENSE' => 'perl',
  'NAME' => 'TidyAndCommit',
  'PREREQ_PM' => {
    'File::Spec' => '0',
    'Perl::Tidy' => '0'
  },
  'VERSION' => '0.02',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



